package com.yellow.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yellow.domain.BoardDTO;
import com.yellow.service.board.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	@Autowired
	BoardService bService;
	@GetMapping("/list")
	public String list(Model model) {
		log.info(">>> GET: list PAGE 출력");		
		List<BoardDTO> list = bService.newBoardList();// 게시물 목록
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		
		model.addAttribute("map",map);
		return "board/list";
		
	}
}
