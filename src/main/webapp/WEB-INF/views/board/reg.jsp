<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록화면</title>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/board/reg.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

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
					<form id="reg_form" method="post" enctype="multipart/form-data">
						<div class="board_reg">
							<table class="board_reg_table">

								<tr>
									<td>회사</td>
									<td><select class="search_company" id="company"
										name="company">
											<option value="default">회사를 선택해주세요</option>
											<option value="네이버">네이버</option>
											<option value="카카오">카카오</option>
											<option value="이피피에스">이피피에스</option>
									</select></td>
									<td>등록자</td>
									<td><input type="text" id="reg_name" name="reg_name" /></td>
									<td>등록 일자</td>
									<td><input type="text" id="reg_date" name="reg_date"
										readonly="readonly" /></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" id="reg_pwd" name="reg_pwd" /></td>
									<td>첨부파일</td>
									<td><input type="file" id="reg_file" name="reg_file" /></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" id="subject" name="subject" /></td>
								</tr>
							</table>
						</div>

						<div class="reg_content">내용</div>
						<div>
							<textarea class="board_content" name="content" id="content"
								cols="30" rows="10"></textarea>
						</div>
						<div class="reg_submit">
							<input type="button" class="submit_button" value="등록하기">
						</div>
					</form>
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
	<script>
		var companyCheck = false; // 회사명 확인
		var nameCheck = false; // 등록자 확인
		var dateCheck = false; // 등록일자 확인
		var pwdCheck = false; // 비밀번호 확인
		var subjectCheck = false; // 제목 확인
		var contentCheck = false; // 내용 확인

		$(document).ready(
				function() {
					$('#reg_date').daterangepicker({
						singleDatePicker : true,
						locale : {
							format : "YYYY-MM-DD"
						}
					});
					/* 제출버튼 클릭시 유효성 확인작업  */
					$(".submit_button").click(
							function() {
								/* 입력값 변수 */
								var company = $('#company').val(); // 회사명
								var reg_name = $('#reg_name').val(); // 등록자
								var reg_date = $('#reg_date').val(); // 등록일자
								var reg_pwd = $('#reg_pwd').val(); // 비밀번호
								var subject = $('#subject').val(); // 제목
								var content = $('#content').val(); // 내용

								/*회사명 유효성 검사  */
								if (company == "default") {
									alert('회사를 선택해주세요');
								} else {
									companyCheck = true;
								}

								/*등록자 유효성 검사  */
								if (reg_name == "") {
									alert('등록자를 입력해주세요');
								} else {
									nameCheck = true;
								}
								/*등록일자 유효성 검사  */
								if (reg_date == "") {
									alert('등록일자를 선택해주세요');
								} else {
									dateCheck = true;
								}
								/*비밀번호 유효성 검사  */
								if (reg_pwd == "") {
									alert('비밀번호를 입력해주세요');
								} else {
									pwdCheck = true;
								}
								/*제목 유효성 검사  */
								if (subject == "") {
									alert('제목을 선택해주세요');
								} else {
									subjectCheck = true;
								}
								/*내용 유효성 검사  */
								if (content == "") {
									alert('내용을 입력해주세요');
								} else {
									contentCheck = true;
								}
								/* 최종 유효성 검사 */

								if (companyCheck && nameCheck && dateCheck
										&& pwdCheck && subjectCheck
										&& contentCheck) {
									$("#reg_form").attr("action", "reg");
									$("#reg_form").submit();
								} else {
									return false;
								}
							});
				});
	</script>
</body>
</html>