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
			<label>닉네임</label><input type="text" id="visitor_name" /> 
			<label>비밀번호</label><input type="password" id="visitor_pw" />
			<button class="registerBtn">등록</button>
		</div>
		<div class="write_box">
			<img src="/img/users.png" class="avatar">
			<textarea id="visitor_content" cols="100" rows="8"></textarea>
		</div>
	</div>

	<div class="unknown">
		<c:forEach var="dto" items="${visitorView}" varStatus="status">
			<div class="content">
				<div class="anonymous">
					<label>닉네임</label>
					<div>${ dto.visitor_name }님</div>
					<button class="reviseBtn">수정</button>
					<button type="submit" class="delete" value="${ dto.visitor_idx }">삭제</button>
				</div>
				<div class="write_box">
					<img src="/img/users.png" class="avatar">
					<textarea class="visitor_content" cols="100" rows="8">${ dto.visitor_content }</textarea>
				</div>
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
	$(".reviseBtn").click(function() {

		var visitor_content = $('.visitor_content').val();
		var data = {
				"visitor_content" : visitor_content
		}
		
		$.ajax({
			async : true,
			type : 'POST',
			data : JSON.stringify(data),
			dataType : "text",
			contentType : "application/json; charset-UTF-8",
			url : "/board/reviseVisitor",
			success : function(data) {
				console.log("success", data);
				alert("수정되었습니다.");

			},
			error : function(error) {
				console.log("error", error);
				alert("다시 시도해주세요.");
				return;
			}
		});

	});

	//삭제
	$(".delete").click(function() {

		var event = $(this);

		$.ajax({
			async : true,
			type : 'POST',
			data : {
				visitor_idx : $(this).val()
			},
			url : "/board/deleteVisitor",
			success : function(data) {
				event.closest(".content").remove(); //closest: 선택한 요소를 포함하면서 가장 가까운 상위 요소를 선택합니다.
				alert("삭제되었습니다.");
			},
			error : function(error) {
				console.log("error", error);
				alert("다시 시도해주세요.");
				return;
			}
		});

	});

	//등록
	$(".registerBtn").click(function() {
		var visitor_name = $('#visitor_name').val();
		var user_pw = $('#user_pw').val();
		var visitor_content = $('#visitor_content').val();
		var data = {
			"visitor_name" : visitor_name,
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