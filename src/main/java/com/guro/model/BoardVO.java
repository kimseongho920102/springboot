package com.guro.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {
	int seq ;
	String subject;
	String content;
	String reg_date;
	String start_date;
	String end_date;
	String company;
	String reg_name;
	String reg_pwd;
	MultipartFile reg_file;
	String file_name;
	int read_count;	
}