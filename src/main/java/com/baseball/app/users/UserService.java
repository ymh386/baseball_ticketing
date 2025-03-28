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
import org.springframework.stereotype.Service;

import com.baseball.app.files.FileManager;
import com.baseball.app.tickets.TicketDTO;

@Service
public class UserService {
    
    @Autowired
    private UserDAO userDAO;
    
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

        if (Objects.equals(result.getPassword(), userDTO.getPassword())) {
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
        userDTO.setPassword(tempPassword);
        
        try {
            // 비밀번호 업데이트 수행
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

        // 현재 비밀번호가 맞는지 확인 (암호화하지 않고 평문으로 비교)
        if (!userDTO.getPassword().equals(currentPassword)) {
            return "현재 비밀번호가 올바르지 않습니다.";
        }

        // 비밀번호 변경 로직 (암호화하지 않고 바로 변경)
        userDTO.setPassword(newPassword); // 새 비밀번호를 그대로 저장
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
