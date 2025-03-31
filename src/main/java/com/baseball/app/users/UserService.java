package com.baseball.app.users;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.baseball.app.files.FileManager;
import com.baseball.app.tickets.TicketDTO;

@Service
public class UserService {
    
    @Autowired
    private UserDAO userDAO;
    
    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); // BCrypt 인코더
    
    @Autowired
    private FileManager fileManager;
    
    @Autowired
    private JavaMailSender mailSender;

    // 로그인 
    public UserDTO login(UserDTO userDTO) throws Exception {
        UserDTO result = userDAO.getDetail(userDTO);

        if (result == null) {
            return null;
        }

        // DB에 저장된 해시된 비밀번호와 입력된 비밀번호 비교
        if (passwordEncoder.matches(userDTO.getPassword(), result.getPassword())) {
            return result;
        }

        return null;
    }

    // 이메일 존재 여부 확인
    public boolean isEmailExists(UserDTO userDTO) throws Exception {
        return userDAO.findByEmail(userDTO) != null;
    }
    
    
    

    // 비밀번호 변경
    public boolean updatePassword(String email, String tempPassword) throws Exception {
        UserDTO userDTO = new UserDTO();
        userDTO.setEmail(email);
        
        // 임시 비밀번호를 해시화하여 저장
        String hashedPassword = passwordEncoder.encode(tempPassword);
        userDTO.setPassword(hashedPassword);

        try {
            // 해시화된 비밀번호로 DB 업데이트 수행
            userDAO.findPwUpdate(userDTO);
            return true; // 업데이트 성공
        } catch (Exception e) {
            // 예외 처리, 비밀번호 업데이트 실패 시
            e.printStackTrace();
            return false; // 업데이트 실패
        }
    }


    // 회원가입
    public int join(UserDTO userDTO, ServletContext context) throws Exception {
        // 비밀번호 해시화
        String encodedPassword = passwordEncoder.encode(userDTO.getPassword());
        userDTO.setPassword(encodedPassword);  // 해시화된 비밀번호를 세팅

        // 해시화된 비밀번호로 사용자 정보 저장
        return userDAO.join(userDTO);
    }

    // 아이디 찾기
    public UserDTO findId(UserDTO userDTO) throws Exception {
        return userDAO.findId(userDTO);
    }

    // 비밀번호 찾기
    public UserDTO findPassword(UserDTO userDTO) throws Exception {
        return userDAO.findPassword(userDTO);
    }
    
    public UserDTO findByEmail(UserDTO userDTO) throws Exception{
    	return userDAO.findByEmail(userDTO);
    }

    public List<Map<String, Object>> getTickets(UserDTO userDTO) throws Exception{
        return userDAO.getTickets(userDTO);
    }
    
    
    //비밀번호 변경
    public String pwUpdate(UserDTO userDTO, String currentPassword, String newPassword, String confirmPassword) throws Exception {
        // 새 비밀번호와 확인 비밀번호가 일치하는지 확인
        if (!newPassword.equals(confirmPassword)) {
            return "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.";
        }

        // 현재 비밀번호가 맞는지 확인 (암호화된 비밀번호 비교)
        if (!passwordEncoder.matches(currentPassword, userDTO.getPassword())) {
            return "현재 비밀번호가 올바르지 않습니다.";
        }

        // 새 비밀번호를 해시화
        String hashedPassword = passwordEncoder.encode(newPassword);
        userDTO.setPassword(hashedPassword); // 새 비밀번호를 해시화하여 설정

        // 비밀번호 변경
        userDAO.pwUpdate(userDTO);

        return "success";
    }

    // 회원 탈퇴
    public int userDelete(UserDTO userDTO) throws Exception {
        return userDAO.userDelete(userDTO);
    }

    // 임시 비밀번호 생성
    public String generateTempPassword() throws Exception{
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 8; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        return sb.toString();
    }

    // 이메일 전송
    public void sendTempPassword(String toEmail, String tempPassword) throws Exception{
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom("wlsdnjs652@gmail.com", "baseball Ticket Team");
            helper.setTo(toEmail);
            helper.setSubject("baseball_ticketing 임시 비밀번호 발급 안내");
            helper.setText("안녕하세요 kbo 티켓 예매서비스입니다.\n\n임시 비밀번호는 [" + tempPassword + "] 입니다.\n로그인 후 비밀번호를 변경해주세요.");

            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    

    // 티켓 상태 변경 메서드
    public int updateState(Long ticketNum, String ticketStatus) throws Exception {
        Map<String, Object> params = new HashMap();
        params.put("ticketNum", ticketNum);
        params.put("ticketStatus", ticketStatus);

        return userDAO.updateState(params); // DAO 호출
    }

    // 환불 처리 메서드
    public boolean refundTickets(String userId, Long ticketNum) {
        try {
            // 티켓 상태를 '환불완료'로 변경
            int result = updateState(ticketNum, "환불완료");
            return result == 1; // 성공적으로 업데이트되면 true 반환
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    

    
    
    
    
    
}
