<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/board/diary.css">

<div class="content">
	<div>
	<form action="uploadOk" method="post" enctype="multipart/form-data">
		<label>제목</label>
		<input type="text" name="gallery_title"/><br>
		<label>내용</label>
		<textarea rows="8" cols="100" name="gallery_content"></textarea><br>
		<label>사진등록</label>
		파일 : <input type="file" name="image"><br/>
		<input type="submit" value="작성하기">
	</form>
	</div>

<div class="content_list">
		<div id="list">
			<i class="fa fa-caret-down"></i>추억저장소
			
			<img src="/img/camera.png" style="width:60px;">
		</div>
		<c:forEach var="dto" items="${ galleryList }" varStatus="status">
		<div id="page" class="page" value="${ dto.gallery_idx }">${ dto.gallery_title }</div>
		</c:forEach>
		<div id="nextbar">처음 < 1 2 3 4 > 마지막</div>
	</div>

</div>
 
<script>

	$(".page").click(function(){
		console.log( $(this).attr("value"));
		location.href = "/admin/admin_photoView?gallery_idx=" + $(this).attr("value");
	})

</script>


