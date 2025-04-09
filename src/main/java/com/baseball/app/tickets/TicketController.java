package com.baseball.app.tickets;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baseball.app.pages.Pager;
import com.baseball.app.seats.SeatDTO;
import com.baseball.app.users.UserDTO;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@CrossOrigin(origins = "https://dev-pub.apis.naver.com/naverpay-partner/naverpay/payments/v2.2/apply/payment")
@Controller
@RequestMapping("/tickets/*")
public class TicketController {
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	public String add(TicketDTO ticketDTO, HttpSession session, Model model) throws Exception {
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		ticketDTO.setUserId(userDTO.getUserId());
		int result = ticketService.add(ticketDTO);
		
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value="payment", method=RequestMethod.GET)
	public String payment(TicketDTO ticketDTO, HttpSession session, Model model) throws Exception {
		SeatDTO seatDTO = new SeatDTO();
		seatDTO.setSeatLevel(ticketDTO.getSeatNum().substring(0, 1));
		
		ticketDTO = ticketService.getDetail(ticketDTO);
		seatDTO = ticketService.getSeatPrice(seatDTO);
		
		session.setAttribute("dto", ticketDTO);
		model.addAttribute("price", seatDTO.getSeatPrice());
		return "tickets/payment";
	}
	
	@RequestMapping(value="paymentList", method=RequestMethod.GET)
	public String getPaymentList(Model model, HttpSession session, Pager pager) throws Exception {
		List<PaymentDTO> ar = ticketService.getPaymentList(session, pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
		
		return "tickets/paymentList";
	}
	
	@RequestMapping(value="paymentDetail", method=RequestMethod.GET)
	public String getPaymentDetail(TicketDTO ticketDTO, HttpSession session, Model model) throws Exception {
		ticketDTO = ticketService.getPaymentDetail(ticketDTO, session);
		model.addAttribute("dto", ticketDTO);
		
		String level = ticketDTO.getSeatNum().substring(0, 1);
		model.addAttribute("level", level);
		
		return "tickets/paymentDetail";
	}
	
	@RequestMapping(value="paymentAdd", method=RequestMethod.POST)
	public String paymentAdd(PaymentDTO paymentDTO, UserDTO usePoint, HttpSession session, Model model) throws Exception {
		TicketDTO ticketDTO = new TicketDTO();
		String productName [] = paymentDTO.getProductName().split("_");
		ticketDTO.setMatchNum(Long.parseLong(productName[0]));
		ticketDTO.setSeatNum(productName[1]);
		ticketDTO.setPaymentId(paymentDTO.getPaymentId());
		
		int result = ticketService.paymentAdd(paymentDTO, usePoint, session, productName);
		int result2 = ticketService.ticketStatusComplete(ticketDTO);
		
		if(result > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		model.addAttribute("result", result);
		
		ticketDTO = ticketService.getDetail(ticketDTO);
		session.setAttribute("dto", ticketDTO);
		
		
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(TicketDTO ticketDTO, HttpSession session, Model model) throws Exception {
		int result = ticketService.delete(ticketDTO);
		session.setAttribute("dto", null);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	
	
	

	
	

}
