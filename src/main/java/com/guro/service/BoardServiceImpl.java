package com.guro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guro.mapper.BoardMapper;
import com.guro.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardmapper;


	@Override
	public void boardReg(BoardVO vo) throws Exception {

		boardmapper.boardReg(vo);
	}

	@Override
	public List<BoardVO> boardSearchList(BoardVO vo) throws Exception{
		
		return boardmapper.boardSearchList(vo);
	}

	@Override
	public List<BoardVO> boardList() throws Exception {
		
		return boardmapper.boardList();
	}

	@Override
	public BoardVO boardOneSearch(int seq) throws Exception {
		
		return boardmapper.boardOneSearch(seq);
	}

	@Override
	public String boardPwdCheck(int seq) throws Exception {
		
		return boardmapper.boardPwdCheck(seq);
	}

	@Override
	public void boardUpdate(BoardVO vo) throws Exception {
		boardmapper.boardUpdate(vo);
	}

	@Override
	public void boardDelete(int seq) throws Exception {
		boardmapper.boardDelete(seq);
		
	}

 

}