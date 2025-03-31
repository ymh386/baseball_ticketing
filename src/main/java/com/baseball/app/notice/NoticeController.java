package com.baseball.app.notice;

import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.app.boards.BoardDTO;
import com.baseball.app.boards.BoardFileDTO;
import com.baseball.app.pages.Pager;
import com.baseball.app.users.UserDTO;

@Controller
@RequestMapping(value="/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Value("${notice.kind}")
	private String kind;
	
	@ModelAttribute("kind")
	public String getKind() {
		return "notice";
	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String getList(Pager pager,Model model) throws Exception{
		
		List<BoardDTO> list = noticeService.getList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
	
		
		
		return "board/boardList";
	}
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String getDetail(NoticeDTO boardDTO, Model model,HttpSession session) throws Exception{
		
		Object obj = session.getAttribute("board");
		
		boolean check = false;
		
		if(obj != null) {
			HashSet<Long> ar = (HashSet<Long>)obj;
		
			if(!ar.contains(boardDTO.getBoardNum())) {
				check=true;
			}else {
				ar.add(boardDTO.getBoardNum());
			}
			
			
		}else {
			HashSet<Long> num = new HashSet<Long>();
			num.add(boardDTO.getBoardNum());
			session.setAttribute("board", num);
			check=true;
			
			
		}
		
		
		boardDTO =(NoticeDTO)noticeService.getDetail(boardDTO);
		model.addAttribute("dto", boardDTO);
		return "board/boardDetail";
		
	}
	
	@RequestMapping(value="add", method=RequestMethod.GET)
	public String add() throws Exception{
		
		return "board/boardForm";
		
	}
	
	@RequestMapping(value="add", method = RequestMethod.POST)
	public String add(NoticeDTO boardDTO, HttpSession session, MultipartFile [] attaches) throws Exception{
		
		
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		boardDTO.setUserId(userDTO.getUserId());
		int result = noticeService.add(boardDTO, attaches, session);
		
		return "redirect:./list";
		
	}
	
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String update(NoticeDTO boardDTO, Model model)throws Exception{
		
		boardDTO = (NoticeDTO)noticeService.getDetail(boardDTO);
		
		model.addAttribute("dto", boardDTO);
		return "board/boardForm";
		
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(NoticeDTO boardDTO, MultipartFile [] attaches, HttpSession session)throws Exception{
		
		int result = noticeService.update(boardDTO, attaches, session);
		return "redirect:./detail?boardNum="+boardDTO.getBoardNum();
		
	}
	
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(BoardDTO boardDTO, Model model, HttpSession session) throws Exception{
		int result = noticeService.delete(boardDTO, session);
		String s = "삭제 실패";
		if(result>0){
			s = "삭제 성공";
		}
		model.addAttribute("result", s);
		model.addAttribute("path", "./list");
		
		return "commons/result";
		
		
		
	}
	
	
	
	
	@RequestMapping(value = "fileDown", method = RequestMethod.GET)
	public String fileDown(BoardFileDTO boardFileDTO, Model model) throws Exception {
		
		boardFileDTO = noticeService.getFileDetail(boardFileDTO);
		model.addAttribute("file", boardFileDTO);
		return "fileDownView";
	}
	
	
	@RequestMapping(value = "fileDelete", method = RequestMethod.POST)
	public String fileDelete(BoardFileDTO boardFileDTO, Model model, HttpSession session) throws Exception {
		
		int result = noticeService.fileDelete(boardFileDTO, session);
		
		model.addAttribute("result", result);
		System.out.println("result : " + result);
		return "commons/ajaxResult";
	}
		
	
	
	

}
