package com.guro.service;

import java.util.List;

import com.guro.model.BoardVO;

public interface BoardService {

	// 게시물등록
	public void boardReg(BoardVO vo) throws Exception;

	// 검색 회사별, 등록자별, 등록일자별 검색후 리스트로 출력
	public List<BoardVO> boardSearchList(BoardVO vo) throws Exception;

	// 전체 리스트 조회
	public List<BoardVO> boardList() throws Exception;

	// 업데이트를 위한 하나의 결과 조회
	public BoardVO boardOneSearch(int seq) throws Exception;

	// 비밀번화 확인 ajax요청
	public String boardPwdCheck(int seq) throws Exception;

	// 비밀번화 확인 ajax요청
	public void boardUpdate(BoardVO vo) throws Exception;

	// 게시물 삭제
	public void boardDelete(int seq) throws Exception;
}