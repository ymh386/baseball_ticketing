package com.baseball.app.matches;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.baseball.app.boards.ReviewDTO;
import com.baseball.app.seats.SeatDTO;
import com.baseball.app.tickets.TicketDTO;
import com.baseball.app.tickets.TicketService;

@Controller
@RequestMapping("/matches/*")
public class MatchController {
	
	@Autowired
	private MatchService matchService;
			
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String getDetail(MatchDTO matchDTO, Model model) throws Exception {
		
		matchDTO = matchService.getDetail(matchDTO);
		
		model.addAttribute("dto", matchDTO);
		
		return "matches/detail";
		
	}
	
	@RequestMapping(value = "seatList", method = RequestMethod.GET)
	public String getSeatList(MatchDTO matchDTO, TicketDTO ticketDTO, HttpSession session, Model model) throws Exception {
		List<TicketDTO> ar2 = matchService.getTicketPayment(ticketDTO);
		
		List<SeatDTO> ar = matchService.getSeatList(matchDTO);
		
		model.addAttribute("list", ar);
		model.addAttribute("tlist", ar2);
		
		return "matches/seatList";
	}
	
	@RequestMapping(value = "getReviewList", method = RequestMethod.GET)
	public String getReviewList(MatchDTO matchDTO, Model model) throws Exception {
		System.out.println("list getMatchNum : " + matchDTO.getMatchNum());
		
		List<ReviewDTO> list = matchService.getReviewList(matchDTO);
		model.addAttribute("list", list);
		model.addAttribute("matchNum", matchDTO.getMatchNum());
		
		return "matches/ReviewList";
	}
	
	@RequestMapping(value = "deleteReview", method = RequestMethod.GET)
	public String deleteReview(ReviewDTO reviewDTO, Model model) throws Exception {
		System.out.println("getReviewNum : " + reviewDTO.getReviewNum());
		
		int result = matchService.deleteReview(reviewDTO);
		model.addAttribute("result", result);
		
		return "redirect:./getReviewList?matchNum=" + reviewDTO.getMatchNum();
	}
	
	@RequestMapping(value = "addReview", method = RequestMethod.POST)
	public String addReview(ReviewDTO reviewDTO, Model model) throws Exception {
		System.out.println("add getMatchNum : " + reviewDTO.getMatchNum());
		System.out.println("add getBoardContent : " + reviewDTO.getBoardContent());
		reviewDTO.setUserId("a3");
		
		int result = matchService.addReview(reviewDTO);
		model.addAttribute("result", result);
				
		return "redirect:./getReviewList?matchNum=" + reviewDTO.getMatchNum();
	}
	
	
	

}
