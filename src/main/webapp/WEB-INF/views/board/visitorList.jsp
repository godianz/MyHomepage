<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/board/visitor.css">

<!-- visitor -->
<div class="visitor">

	<div class="unknown">
		<div class="anonymous">
			<label>닉네임</label><input type="text" id="user_name" /> 
			<label>비밀번호</label><input type="password" id="user_pw" />
			<button class="registerBtn">등록</button>
		</div>
		<div class="write_box">
			<img src="/img/users.png" class="avatar">
			<textarea id="visitor_content" cols="100" rows="8"></textarea>
		</div>
	</div>

	<div class="unknown">
		<c:forEach var="dto" items="${visitorView}" varStatus="status">
			<div class="anonymous">
				<label>닉네임</label>
				<div>${ dto.user_name }님</div>
				<button class="reviseBtn">수정</button>
				<button type="submit" id="delete" value="${ dto.visitor_idx }">삭제</button>
			</div>
			<div class="write_box">
				<img src="/img/users.png" class="avatar">
				<div id="visitor_content">${ dto.visitor_content }</div>
			</div>
		</c:forEach>
	</div>


	<div class="known">

		<div class="friend">

			<label></label>
			<button class="registerBtn">등록</button>
		</div>
		<div class="write_box">
			<img src="/img/heart.png" class="avatar">
			<textarea name="" id="" cols="100" rows="8"></textarea>
		</div>
	</div>


</div>

<script>
	//수정

	//삭제
	$("#delete").click(
			function() {
				location.href = '/board/deleteVisitor?visitor_idx='
						+ $(this).attr("value");
			})

	//등록
	$(".registerBtn").click(function() {
		var user_name = $('#user_name').val();
		var user_pw = $('#user_pw').val();
		var visitor_content = $('#visitor_content').val();
		var data = {
			"user_name" : user_name,
			"user_pw" : user_pw,
			"visitor_content" : visitor_content
		};
		$.ajax({
			async : true,
			type : 'POST',
			data : JSON.stringify(data),
			url : "/board/visitorRegister",
			dataType : "text",
			contentType : "application/json; charset-UTF-8",
			success : function(data) {
				console.log("success", data);
				alert("저장되었습니다.");
				location.href = '/board/visitor';
			},
			error : function(error) {
				console.log("error", error);
				alert("다시 시도해주세요.");
				return;
			}
		});
	});
</script>