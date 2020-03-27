package com.yellow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yellow.domain.ReplyDTO;
import com.yellow.service.reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	@GetMapping("/list")
	public 	String list(int bno, Model model) {
		log.info(">>>>>get: reply list page");
//		List<ReplyDTO>list = rService.list(bno);
//		
//		for (ReplyDTO replyDTO : list) {
//			log.info(replyDTO.toString());
//		}
									//rService 이놈이 호출했다가 댓글 10개를 받는다.
		model.addAttribute("list", rService.list(bno));//model은 화면단으로 전송할 데이터를 담는것
									//무조건 이 메서드에 리턴이 있어야 한다. 
		return "/board/commentlist"; //화면단 어디로 이동할건지 알려주는 놈
	}
	@ResponseBody//ajax 쓸떄
	@PostMapping("/insert")
	public void insert(ReplyDTO rDto) {
		log.info(">>>>POST: REPLY INSERT DB");
			
//		log.info(rDto.toString());
		rService.insert(rDto);
		
		
	}
	@ResponseBody
	@PostMapping("/delete")
	public void delete(int rno, int bno) {
		
		rService.delete(rno,bno);
	}
	
}
