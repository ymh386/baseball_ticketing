package com.baseball.app.matches;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.app.boards.ReviewDTO;
import com.baseball.app.pages.Pager;
import com.baseball.app.seats.SeatDTO;
import com.baseball.app.test.MyModel;
import com.baseball.app.tickets.TicketDTO;
import com.baseball.app.tickets.TicketService;

@Controller
@RequestMapping("/matches/*")
public class MatchController {
	
	@Autowired
	private MatchService matchService;
	
	@Autowired
	private MyModel myModel;
			
	
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
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getMatchList(Model model) throws Exception {
		
		List<MatchDTO> list = matchService.getMatchList();
		
		model.addAttribute("list", list);
		
		return "matches/matchList";
	}
	

	
	
	
	@RequestMapping(value = "getReviewList", method = RequestMethod.GET)
	public String getReviewListG(MatchDTO matchDTO, Pager pager, Model model) throws Exception {
		
		List<ReviewDTO> list = matchService.getReviewList(matchDTO, pager);
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		model.addAttribute("matchNum", matchDTO.getMatchNum());
		
		return "matches/reviewList";
	}
	
	@RequestMapping(value = "getReviewList", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, String>> getReviewListP(MatchDTO matchDTO, Pager pager, Model model) throws Exception {
		System.out.println("getReview post");
		
		List<ReviewDTO> list = matchService.getReviewList(matchDTO, pager);
				
		List<Map<String, String>> result = new ArrayList<Map<String,String>>();
				
		for(ReviewDTO dto : list) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("reviewNum", String.valueOf(dto.getReviewNum()));
			map.put("userId", dto.getUserId());
			map.put("boardContent", dto.getBoardContent());
			map.put("boardDate", String.valueOf(dto.getBoardDate()));
			result.add(map);
		}
		
		return result;
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
	
	@RequestMapping(value = "updateReview", method = RequestMethod.GET)
	public String updateReviewG(ReviewDTO reviewDTO, Model model) throws Exception {
		
		System.out.println("add getMatchNum : " + reviewDTO.getMatchNum());
		System.out.println("add getReviewNum : " + reviewDTO.getReviewNum());
		System.out.println("add getBoardContent : " + reviewDTO.getBoardContent());
		
		ReviewDTO result = matchService.getReviewDetail(reviewDTO);
		model.addAttribute("dto", result);
		
		return "matches/reviewUpdate";
	}
	
	@RequestMapping(value = "updateReview", method = RequestMethod.POST)
	public String updateReviewP(ReviewDTO reviewDTO, Model model) throws Exception {
		
		System.out.println("add getMatchNum : " + reviewDTO.getMatchNum());
		System.out.println("add getReviewNum : " + reviewDTO.getReviewNum());
		System.out.println("add getBoardContent : " + reviewDTO.getBoardContent());
		
		int result = matchService.updateReview(reviewDTO);
		model.addAttribute("result", result);
				
		return "redirect:./getReviewList?matchNum=" + reviewDTO.getMatchNum();
	}
	
	@RequestMapping(value = "tempImage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> tempImage(MultipartFile[] attaches, HttpSession session) throws Exception {
		
		String result = matchService.tempImage(attaches, session);
		Map<String, String> map = new HashMap<String, String>(); 
		map.put("tempImage", result);
		
		return map;
	}
	
	@RequestMapping(value = "deleteTempImage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> deleteTempImage(String src, HttpSession session) throws Exception {
		
		String result = matchService.deleteTempImage(src, session);
		Map<String, String> map = new HashMap<String, String>(); 
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	@ResponseBody
	public MyModel test() throws Exception {
		
		myModel.setName("paul");
		myModel.setSkills(new String[] {"123", "456"});
		System.out.println("test");
		return myModel;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
