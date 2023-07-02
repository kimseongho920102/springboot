package com.guro.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.guro.model.BoardVO;

@Mapper
public interface BoardMapper {

public void boardReg(BoardVO vo);

public List<BoardVO> boardList();

public List<BoardVO> boardSearchList(BoardVO vo);

public BoardVO boardOneSearch(int seq);

public String boardPwdCheck(int seq);

public void boardUpdate(BoardVO vo);

public void boardDelete(int seq);
}
