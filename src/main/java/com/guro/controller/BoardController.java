package com.guro.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.guro.model.BoardVO;
import com.guro.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardservice;

	// 게시물 등록 페이지 이동
	@RequestMapping(value = "reg", method = RequestMethod.GET)
	public void joinGET() {

		logger.info("게시물등록 페이지 진입");

	}

	// 게시물 등록
	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String regPOST(BoardVO vo) throws Exception {
		// 인코딩 전 비밀번호
//		String rawPw = "";
		// 인코딩 후 비밀번호
		String encodePw = "";

//		rawPw = vo.getReg_pwd();
//		encodePw = pwEncoder.encode(rawPw);
		vo.setReg_pwd(encodePw);
		if (vo.getReg_file() != null) {
			logger.info("파일 이름: {}", vo.getReg_file().getOriginalFilename());
			vo.setFile_name(vo.getReg_file().getOriginalFilename());
			logger.info("파일 크기: {}", vo.getReg_file().getSize());
		}

		boardservice.boardReg(vo);

		return "redirect:/";

	}

	// 게시물 조회 페이지로 이동
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String listGET(Model model) throws Exception {

		logger.info("게시물 조회 페이지 진입");
		List<BoardVO> list = new ArrayList<BoardVO>();
		list = boardservice.boardList();
		model.addAttribute("list", list);

		return "board/list";
	}

	// 게시물 검색후 조회 페이지로 이동
	@RequestMapping(value = "search")
	public String board_search(BoardVO vo, Model model) throws Exception {

		logger.info("게시물 검색중");
		List<BoardVO> list = new ArrayList<BoardVO>();
		list = boardservice.boardSearchList(vo);
		model.addAttribute("list", list);

		return "board/list";
	}

	// 팝업창에서 실행되어 부모를 게시물 업데이트 처리하여 조회페이지로 이동
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void updatePOST(HttpServletResponse response, BoardVO vo) throws Exception {
		logger.info("업데이트 처리중..");
		if (vo.getReg_file() != null) {
			logger.info("파일 이름: {}", vo.getReg_file().getOriginalFilename());
			vo.setFile_name(vo.getReg_file().getOriginalFilename());
			logger.info("파일 크기: {}", vo.getReg_file().getSize());
		}
		boardservice.boardUpdate(vo);
		logger.info("팝업창은 종료됨으로 이동될 주소는 없음");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>opener.parent.location.reload(); window.close();</script>");
		out.flush();
	}

	// 업데이트 페이지로 이동
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void updateGET(@RequestParam("seq") int seq, Model model) throws Exception {

		logger.info("게시물 업데이트 페이지 진입");
		BoardVO vo = new BoardVO();
		vo = boardservice.boardOneSearch(seq);
		model.addAttribute("vo", vo);

	}

//	// 비밀번호 확인하는 ajax
//	@ResponseBody
//	@RequestMapping(value = "/pwdCheck", method = RequestMethod.POST)
//	public String pwdCheckPOST(String reg_pwd, int seq) throws Exception {
//		logger.info("비밀번화 확인 ajax 요청 진행중");
//
//		String encodePw = boardservice.boardPwdCheck(seq);
//
//		if (pwEncoder.matches(reg_pwd, encodePw)) {
//			return "success"; // 비밀번호 일치
//		} else {
//			return "fail"; // 비밀번호 불일치
//		}
//
//	}

	// 삭제 페이지로 이동
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public void deleteGET(@RequestParam("seq") int seq, Model model) throws Exception {

		logger.info("게시물 삭제 페이지 진입");
		BoardVO vo = new BoardVO();
		vo = boardservice.boardOneSearch(seq);
		model.addAttribute("vo", vo);

	}

	// 팝업창에서 실행되어 부모를 게시물 삭제 처리하여 조회페이지로 이동
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void deletePOST(HttpServletResponse response, BoardVO vo) throws Exception {
		logger.info("삭제 처리중..");
		boardservice.boardDelete(vo.getSeq());
		logger.info("팝업창은 종료됨으로 이동될 주소는 없음");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>opener.parent.location.reload(); window.close();</script>");
		out.flush();
	}

}