package com.guro.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SpringTestMapper {

final String TEST="SELECT count(*) FROM BOARD";

@Select(TEST)

int test();

}