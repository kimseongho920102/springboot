<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<link rel="stylesheet" href="/resources/css/board/update.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="content_area">
		<form id="update_form" method="post" enctype="multipart/form-data">
			<div class="board_update">
				<table class="board_update_table">
				
					<tr>
						<td>회사</td>
						<td><select class="search_company" id="company"
							name="company" disabled="disabled">
								<c:choose>
									<c:when test="${vo.company eq '네이버'}">
										<option value="네이버">네이버</option>
									</c:when>
									<c:when test="${vo.company eq '카카오'}">
										<option value="카카오">카카오</option>
									</c:when>
									<c:when test="${vo.company eq '이피피에스'}">
										<option value="이피피에스">이피피에스</option>
									</c:when>
									<c:otherwise>
									<option value="default">회사를 선택해주세요</option>
									</c:otherwise>
								</c:choose>
						</select></td>
						<td>등록자</td>
						<td><input type="text" id="reg_name" name="reg_name" readonly="readonly" value="${vo.reg_name}"/></td>
						<td>등록 일자</td>
						<td><input type="text" id="reg_date" name="reg_date" readonly="readonly" value="${vo.reg_date}" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="reg_pwd" name="reg_pwd" /></td>
						<td>첨부파일</td>
						<td><input type="file" id="reg_file" name="reg_file" /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" id="subject" name="subject" value="${vo.subject}" /></td>
					</tr>
				</table>
			</div>

			<div class="update_content">내용</div>
			<div>
				<textarea class="board_content" name="content" id="content"
					cols="30" rows="10" >${vo.content}</textarea>
			</div>
			<div class="update_submit">
				<input type="button" class="submit_button" value="수정하기">
			</div>
			<input type="hidden" id ="seq" name = "seq" value="${vo.seq}" />
		</form>
	</div>
	<script>
		var pwdCheck = false; // 비밀번호 확인
		var subjectCheck = false; // 제목 확인
		var contentCheck = false; // 내용 확인

		$(document).ready(function() {

			/* 제출버튼 클릭시 유효성 확인작업  */
			$(".submit_button").click(function() {
				/* 입력값 변수 */
				var reg_pwd = $('#reg_pwd').val(); // 비밀번호
				var subject = $('#subject').val(); // 제목
				var content = $('#content').val(); // 내용
				var seq = $('#seq').val(); // 시퀀스

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
				/*비밀번호 유효성 검사  */
				if (reg_pwd == "") {
					alert('비밀번호를 입력해주세요');
				} else {
					var data = {
						seq : seq,
						reg_pwd : reg_pwd
					}
					//비밀번호 확인을 위한 ajax 요청시작
					$.ajax({
						type : "post",
						url : "/board/pwdCheck",
						data : data,
						success : function(result) {
							console.log("성공 여부" + result);
							if (result == 'success') {
								pwdCheck = true;
								/* 최종 유효성 검사 */
								if (pwdCheck && subjectCheck && contentCheck) {
									$("#update_form").attr("action", "update");
									$("#update_form").submit();
									} else {
									return false;
								}
							} else {
								alert('입력하신 비밀번호가 일치하지 않습니다');
							}
						}// success 종료
					}); // ajax 종료	
				}

			});
		});
	</script>
</body>
</html>