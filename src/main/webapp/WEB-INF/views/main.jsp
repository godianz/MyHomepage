<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/main.css">

<div class="main_div">

	<!-- content -->
	<div id="main" class="grid-container">

		<div class="item2">
			<img src="https://via.placeholder.com/250x250">
			<p>안녕하세요. 신입입니다.</p>
		</div>
		<div class="item3">
			<div onclick="location.href='/board/diaryList'"
				style="cursor: pointer">개발 공부</div>
			<ol>
				<c:forEach var="dto" items="${ diaryDto }" varStatus="status">
					<input type="hidden" value="${ dto.diary_idx }" id="diary_idx"
						name="diary_idx" />
					<li><a href="/board/diary?diary_idx=${ dto.diary_idx }">${ dto.diary_title }</a></li>
				</c:forEach>
			</ol>
		</div>
		<div class="item4">
			<div onclick="location.href='/board/visitor'" style="cursor: pointer">
				방명록</div>
			<ol>
				<c:forEach var="dto" items="${ visitorDto }" varStatus="status">
				
					<li style="cursor: pointer;">${ dto.visitor_content }</li>
				</c:forEach>
			</ol>
		</div>
		<div class="item5">
			<div onclick="location.href='/board/photoList'">
				추억 저장소<img src="/img/camera.png" width="60px">
			</div>

			<div class="photo_list scrollMenu">
 				<c:forEach var="dto" items="${ galleryDto }" varStatus="status">
					<a onclick="location.href='/board/photo?gallery_idx=${ dto.gallery_idx}'">
					<img src="${ dto.gallery_image }" class="photo"/>
					
					</a> 
				</c:forEach>
			</div>
		</div>
	</div>
</div>
