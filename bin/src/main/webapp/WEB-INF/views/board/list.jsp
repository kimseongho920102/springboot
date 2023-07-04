<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회화면</title>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/board/list.css">
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
					<div class="search_area">
					<form id="search_form" action="post">
						<span>회사</span> <span> <select class="search_company"
							id="company" name="company">
								<option value="default">회사를 선택해주세요</option>
								<option value="네이버">네이버</option>
								<option value="카카오">카카오</option>
								<option value="이피피에스">이피피에스</option>
						</select>
						</span> <span> 등록자</span> <span> <input type="text"
							name="reg_name" />
						</span> <span> 등록 일자</span> <input type="text" name="start_date"
							id="start_date" readonly="readonly" /> ~ <input type="text"
							name="end_date" id="end_date" readonly="readonly" />
							</form>
					</div>
					<div class="button_area">
						<button class="board_reg">등록</button>
						<button class="board_update">수정</button>
						<button class="board_delete">삭제</button>
						<button class="board_search">조회</button>
					</div>
					<div>
						<table class="board_table">

							<tr>
								<th>선택</th>
								<th>제목</th>
								<th>등록일자</th>
								<th>등록자</th>
								<th>조회수</th>
								<th>첨부파일</th>
							</tr>
							<c:forEach items="${list}" var="board_list">
								<tr>
									<td><input type="radio" class="radio" name="seq" value="${board_list.seq} "/></td>
									<td>${board_list.subject}</td>
									<td>${board_list.reg_date}</td>
									<td>${board_list.reg_name}</td>
									<td>${board_list.read_count}</td>
									<td><button>${board_list.reg_file}</button></td>
								</tr>
							</c:forEach>
						</table>

					</div>
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
		var dateCheck = false; // 등록일자 확인
		$(document).ready(
		function() {
			
			//날짜 선택하는 함수
			$('#start_date').daterangepicker({
				singleDatePicker : true,
				locale : {
					format : "YYYY-MM-DD"
				}
			});
			$('#end_date').daterangepicker({
				singleDatePicker : true,
				locale : {
					format : "YYYY-MM-DD"
				}
			});
			//업데이트 팝업창
			$(".board_update").click(
					function() {
						var seq = $("input[name='seq']:checked").val();
			if(seq == '' || seq==null){
				alert('수정 하고자 하는 게시물을 클릭해주세요');
			}else{
			window.open('update?seq='+seq, '업데이트', 'top=800, left=800, width=1500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
			}
			});
			//삭제 팝업창
			$(".board_delete").click(
					function() {
						var seq = $("input[name='seq']:checked").val();
			if(seq == '' || seq==null){
				alert('수정 하고자 하는 게시물을 클릭해주세요');
			}else{
			window.open('delete?seq='+seq, '업데이트', 'top=800, left=800, width=1500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
			}
			});
			/* 조회버튼 클릭시 유효성 확인작업  */
			$(".board_search").click(
					function() {
			/* 입력값 변수 */
			var company = $('#company').val(); // 회사명
			var start_date = $('#start_date').val(); // 시작일
			var end_date = $('#end_date').val(); // 종료일

	
			/*회사명 유효성 검사  */
			if (company == "default") {
				alert('회사를 선택해주세요');
			} else {
				companyCheck = true;
			}

			/*등록자 유효성 검사  */
			if (start_date > end_date) {
				alert('날짜를 다시 선택 해주세요');
			} else {
				dateCheck = true;
			}
			
			/* 최종 유효성 검사 */

			if (companyCheck && dateCheck) {
				$("#search_form").attr("action", "search");
				$("#search_form").submit();
			} else {
				return false;
			}
		});
			/* 조회버튼 클릭시 유효성 확인작업  */
			$(".board_reg").click(
					function() {
						   location.href = "reg";
					});
			
		});
			
</script>
</body>
</html>