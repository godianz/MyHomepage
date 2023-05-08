<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/board/diary.css">
<div class="content">
	<div class="contnet_main">

		<c:forEach var="dto" items="${ photoList }" varStatus="status">
			<div class="content_title">
				<div id="title_no" name="gallery_idx">${ dto.gallery_idx }</div>
				<div id="title">${ dto.gallery_title }</div>

			</div>

			<div class="content_text">
				<img src="${ dto.gallery_image }" width=250px; height=250px;>
			</div>


			<div class="content_footer">
				<div>태그 #재미난취미생활</div>
				<div>
					작성일
					<fmt:formatDate value="${ dto.gallery_date }" pattern="yyyy년MM월dd일"
						type="date" />
				</div>
			</div>
		</c:forEach>
	</div>


	<div class="content_list">
		<div id="list">
			<i class="fa fa-caret-down"></i>개발노트
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
		location.href = "/board/photo?gallery_idx=" + $(this).attr("value");
	})

</script>

