package com.baseball.app.Interceptors;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.baseball.app.boards.BoardDTO;
import com.baseball.app.boards.CommentDTO;
import com.baseball.app.boards.ReviewDTO;
import com.baseball.app.matches.MatchDAO;
import com.baseball.app.notice.NoticeDAO;
import com.baseball.app.notice.NoticeDTO;
import com.baseball.app.qna.QnaDAO;
import com.baseball.app.qna.QnaDTO;
import com.baseball.app.users.UserDTO;

@Component
public class UserIdCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private MatchDAO matchDAO;

//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		
//		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("user");
//		
//		String kind = (String)modelAndView.getModel().get("kind");
//		
//		
//		Object objDTO = modelAndView.getModel().get("dto");
//		
//		String id="";
//		
//		if(objDTO instanceof BoardDTO) {
//			id = ((BoardDTO)objDTO).getUserId();
//		}else {
//			id = userDTO.getUserId();
//		}
//		
//		if(!userDTO.getUserId().equals(id)) {
//			modelAndView.setViewName("/commons/result");
//			modelAndView.getModel().put("result", "작성자만 가능합니다.");
//			if(objDTO instanceof ReviewDTO) {
//				modelAndView.getModel().put("path", "./getReviewList?matchNum=" + ((ReviewDTO)objDTO).getMatchNum());
//			}else {
//				modelAndView.getModel().put("path", "./detail?boardNum=" + ((BoardDTO)objDTO).getBoardNum());
//			}
//			
//		}
//		
//	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("user");
		if(userDTO.getUserId().equals("admin")) {
			return true;
		}
		
		BoardDTO boardDTO = null;
		ReviewDTO reviewDTO = null;
		CommentDTO commentDTO = null;
		
		String id = "";
		
		if(request.getParameter("reviewNum") != null) {
			reviewDTO = new ReviewDTO();
			reviewDTO.setReviewNum(Long.parseLong(request.getParameter("reviewNum")));
			reviewDTO = (ReviewDTO)matchDAO.getReviewDetail(reviewDTO);
			id = reviewDTO.getUserId();
			
		}else if(request.getParameter("commentNum") != null){
			commentDTO = new CommentDTO();
			commentDTO.setCommentNum(Long.parseLong(request.getParameter("commentNum")));
			boardDTO = (BoardDTO)qnaDAO.getCommentOne(commentDTO);
			id = boardDTO.getUserId();
			
		}else {
			boardDTO = new BoardDTO();
			boardDTO.setBoardNum(Long.parseLong(request.getParameter("boardNum")));
			boardDTO = (BoardDTO)qnaDAO.getDetail(boardDTO);
			id = boardDTO.getUserId();
			
		}
		
		if(!userDTO.getUserId().equals(id)) {
			request.setAttribute("result", "작성자만 이용가능합니다.");
			if(reviewDTO != null) {
				request.setAttribute("path", "./getReviewList?matchNum=" + reviewDTO.getMatchNum());
			}else {
				request.setAttribute("path", "./detail?boardNum=" + boardDTO.getBoardNum());
			}
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/result.jsp");
			view.forward(request, response);
			
			return false;
		}
		
		
		return true;
		
	}

	

	
	
}
