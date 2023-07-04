<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<link rel="stylesheet" href="resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<div class="top_area">
				<h1>화면 상단</h1>
			</div>
			<div class="center_area">
				<div class="left_area">
					<h1>화면 왼쪽</h1>
				</div>
				<div class="content_area">
					<div>화면테스트입니다. count : ${count}</div> 
					<a href="board/list">목록 보기</a> <a
						href="board/reg">등록 하기</a>
				</div>
				<div class="right_area">
					<h1>화면 오른쪽</h1>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="bottom_area">
				<h1>화면 아래쪽</h1>
			</div>

		</div>
	</div>

</body>
</html>