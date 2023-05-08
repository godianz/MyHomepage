<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/member/login.css">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<div class="whole">
<form id="loginform" method="post" action="loginAction">
	<div>
		<label>아이디</label><br> 
		<input type="text" name="user_id" id="user_id" /><br> 
		<label>비밀번호</label><br> 
		<input type="password" name="user_pw" id="user_pw" />
	</div>
	 <input type="button" id="login" value="로그인" >
</form>
	<div class="idFind">아이디.비밀번호 찾기</div>
	<div class="join">회원가입</div>

</div>
<script>
 	//아이디.비밀번호 찾기 이동
	$(".idFind").click(function() {
		location.href = '/member/idFind'
	})

	//회원가입 이동
	$('.join').click(function() {
		location.href = '/member/join'
	}) 
	
	//로그인
 	$("#login").click(function(){
		var id = $("#user_id").val();
		var pw = $("#user_pw").val();
		
		if (id == "") {
			alert("아이디를 입력하세요");
			$("#user_id").focus();
			return false;
		} else if (pw == "") {
			alert("비밀번호를 입력하세요");
			$("#user_pw").focus();
			return false;
		};
		
		var data = {
				"user_id" : id,
				"user_pw" : pw
		};
		
		  $.ajax({
			    async : true,
			    type : 'POST',
			    data : JSON.stringify(data),
			    url : "/member/loginAction",
			    contentType : "application/json; charset-UTF-8",
			    success : function(data) {
			    console.log(data);
			      alert("저장되었습니다.");
			  	location.href = '/main';
			    },
			    error : function(error) {
			      alert("다시 시도해주세요.");
			      return;
			    }
			  });
	});
 	 
 	/* function login() {
		var id = $("#user_id").val();
		var pw = $("#user_pw").val();

		if (id == "") {
			alert("아이디를 입력하세요");
			$("#user_id").focus();
			return false;
		} else if (pw == "") {
			alert("비밀번호를 입력하세요");
			$("#user_pw").focus();
			return false;
		};
		$("#loginform").submit();
	} */
/*  	//로그인창 닫기
     setTimeout(function() {
    opener.location.reload();
    self.close(); 
    };	 */



</script>