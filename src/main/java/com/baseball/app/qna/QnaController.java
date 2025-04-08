package com.baseball.app.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.app.boards.BoardDTO;
import com.baseball.app.boards.BoardFileDTO;
import com.baseball.app.boards.CommentDTO;
import com.baseball.app.pages.Pager;
import com.baseball.app.users.UserDTO;


@Controller
@RequestMapping(value="/qna/*")
public class QnaController {
	
	
	@Autowired
	private QnaService qnaService;
	
	
	//------------------------------------
		
	@ModelAttribute("kind")
	public String getKind() {
		
		return "qna";
	}
	
	//------------------------------------
	
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getList(Pager pager, Model model) throws Exception {
		
		List<BoardDTO> list = qnaService.getList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		
		return "board/boardList";
	}
	
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String getDetail(QnaDTO qnaDTO, Model model) throws Exception {
		
		qnaDTO = (QnaDTO)qnaService.getDetail(qnaDTO);
		model.addAttribute("dto", qnaDTO);
		
		// 대댓글 있는 댓글의 list 가져오기
		List<CommentDTO> list = qnaService.getSubCommentCount();
		model.addAttribute("list", list);
		
		return "board/boardDetail";
	}
	
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(QnaDTO qnaDTO) throws Exception {
		
		return "board/boardForm";
	}
	
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(QnaDTO qnaDTO, Model model, HttpSession session, MultipartFile[] attaches) throws Exception {
		
//		qnaDTO.setUserId("a3"); // 테스트용 유저 아이디 값
		
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		qnaDTO.setUserId(userDTO.getUserId());
		
		
		System.out.println("userId "+qnaDTO.getUserId());
		System.out.println("title "+qnaDTO.getBoardTitle());
		System.out.println("content "+qnaDTO.getBoardContent());
		
		int result = qnaService.add(qnaDTO, attaches, session);
		
		return "redirect:./list";
	}
	
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(QnaDTO qnaDTO, Model model) throws Exception {
		
		qnaDTO = (QnaDTO)qnaService.getDetail(qnaDTO);
		model.addAttribute("dto", qnaDTO);
		
		return "board/boardForm";
	}
	
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(QnaDTO qnaDTO, HttpSession session, MultipartFile[] attaches) throws Exception {
		
		int result = qnaService.update(qnaDTO, attaches, session);
		
		return "redirect:./detail?boardNum="+qnaDTO.getBoardNum();
	}
	
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(QnaDTO qnaDTO, HttpSession session) throws Exception {
		
		int result = qnaService.delete(qnaDTO, session);
		
		return "redirect:./list";
	}
	
	
	@RequestMapping(value = "fileDown", method = RequestMethod.GET)
	public String fileDown(BoardFileDTO boardFileDTO, Model model) throws Exception {
		
		boardFileDTO = qnaService.getFileDetail(boardFileDTO);
		model.addAttribute("file", boardFileDTO);
		System.out.println("fileDown 리턴 직전");
		return "fileDownView";
	}
	
	
	@RequestMapping(value = "fileDelete", method = RequestMethod.POST)
	public String fileDelete(BoardFileDTO boardFileDTO, Model model, HttpSession session) throws Exception {
		
		int result = qnaService.deleteFile(boardFileDTO, session);
		
		model.addAttribute("result", result);
		System.out.println("result : " + result);
		return "commons/ajaxResult";
	}
	
	
	@RequestMapping(value = "addComment", method = RequestMethod.POST)
	public String addComment(CommentDTO commentDTO) throws Exception {
		System.out.println("controller reply : " + commentDTO.getBoardContent() + commentDTO.getBoardNum());

		commentDTO.setUserId("a3"); // 테스트용 유저 아이디 값
		
		int result = qnaService.addComment(commentDTO);
		
		return "redirect:./detail?boardNum="+commentDTO.getBoardNum();
	}
	
	
	@RequestMapping(value = "deleteComment", method = RequestMethod.GET)
	public String deleteComment(CommentDTO commentDTO) throws Exception {
		
		int result = qnaService.deleteComment(commentDTO);
		
		return "redirect:./detail?boardNum="+commentDTO.getBoardNum();
	}
	
	
	
	
	
	@RequestMapping(value = "getSubCommentList", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, String>> getSubCommentList(CommentDTO commentDTO) throws Exception {
		
		List<Map<String, String>> result = qnaService.getSubCommentList(commentDTO);
				
		return result;
		
	}
	
	//-----------------------
	
//	// 데이터 리스트 생성
//	List<Map<String, String>> dataList = new ArrayList<Map<String,String>>();
//	
//	// 데이터 항목 추가
//	Map<String, String> data = new HashMap<String, String>();
//	data.put("name", "홍");
//	data.put("age", "33");
//	dataList.add(data);
//	
//	data = new HashMap<String, String>();
//	data.put("name", "길");
//	data.put("age", "11");
//	dataList.add(data);
//	
//	data = new HashMap<String, String>();
//	data.put("name", "동");
//	data.put("age", "22");
//	dataList.add(data);
	

}
