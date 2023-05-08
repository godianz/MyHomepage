
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/board/diary.css">


<!-- content -->
<div class="content">
	<c:forEach var="dto" items="${ contentlist }" varStatus="status">
		<div class="contnet_main">
			<div class="content_title">
				<div id="diary_idx">no.${ dto.diary_idx }</div>
				<div id="diary_title">${ dto.diary_title }</div>
			</div>

			<div class="content_text">${ dto.diary_content }</div>
			<div class="content_footer">
				<div>태그 #프로그래밍 #html</div>
				<div>
					작성
					<fmt:formatDate value="${dto.diary_date }" pattern="yyyy년MM월dd일"
						type="date" />
				</div>
			</div>

		</div>
	</c:forEach>
	<div class="content_list">
		<div id="list">
			<i class="fa fa-caret-down"></i>개발노트 ${ listCount } 건
		</div>
		<input type="hidden" value="" name="diary_idx" />
		<c:forEach var="dto" items="${ contentList }" varStatus="status">
			<div id="page" class="page" style="cursor: pointer">
				<input type="hidden" value="${ dto.diary_idx }" class="idx" /> ${ dto.diary_title }
			</div>
		</c:forEach>

		<div>
			<input type="text" name="searchText" class="searchText" />
			<button name="searchBtn" class="searchBtn">검색</button>
		</div>

	</div>
</div>
<script>
	script

	$(".page").click(
			function() {
				console.log($(this).children(".idx").attr("value"))
				location.href = '/board/diary?diary_idx='
						+ $(this).children(".idx").attr("value");
			})
</script>