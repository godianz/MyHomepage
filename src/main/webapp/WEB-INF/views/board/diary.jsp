
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


<!-- content -->
<div class="content">
	<div class="contnet_main">

		<div class="content_title">
			<div id="diary_idx">no.${ content.diary_idx }</div>
			<div id="diary_title">${ content.diary_title }</div>
		</div>

		<div class="content_text">${ content.diary_content }</div>
		<div class="content_footer">
			<div>태그 #프로그래밍 #html</div>
			<div id="diary_date">
				작성
				<fmt:formatDate value="${content.diary_date }" pattern="yyyy년MM월dd일"
					type="date" />
			</div>
		</div>

	</div>

	<div class="content_list">
		<div id="list">
			<i class="fa fa-caret-down"></i>개발노트 ${ listCount } 건
		</div>
		<form name="searchList">

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

			<div class="pageNav">
            <a href="/board/diary?search_type=${type}&search_contents=${word}&page=1">처음</a>
            <a href="/Notice/notice?search_type=${type}&search_contents=${word}&page=${ page-1 }">이전</a>
			<c:forEach var="pageNum" begin="1" end="${pageNum}">
            <a href="/Notice/notice?search_type=${type}&search_contents=${word}&page=${pageNum}">${pageNum}</a>
			</c:forEach>
            <a href="/Notice/notice?search_type=${type}&search_contents=${word}&page=${ page+1 }">다음</a>
            <a href="/Notice/notice?search_type=${type}&search_contents=${word}&page=${pageNum}">마지막</a>
        </div>
		</form>
	</div>

</div>

<script>
	/* 	$(".page").click(function() {
	 /* console.log($(this).attr("value")); */
	/* location.href = '/board/diary?diary_idx=' + $(this).attr("value"); */
	/*     	location.href='' 
	}) */

 	$(".page").click(function() {
				console.log($(this).children(".idx").attr("value"))
				location.href = '/board/diary?diary_idx='+ $(this).children(".idx").attr("value");
			}) 
			

	$(".searchBtn").click(
			function List() {

				$.ajax({
					type : 'GET',
					url : "/board/diary",
					data : $("form[name=search-form]").serialize(),
					success : function(result) {
						//테이블 초기화
						$('#boardtable > tbody').empty();
						if (result.length >= 1) {
							result.forEach(function(item) {
								str = '<tr>'
								str += "<td>" + item.idx + "</td>";
								str += "<td>" + item.writer + "</td>";
								str += "<td><a href = '/board/detail?idx="
										+ item.idx + "'>" + item.title
										+ "</a></td>";
								str += "<td>" + item.date + "</td>";
								str += "<td>" + item.hit + "</td>";
								str += "</tr>"
								$('#boardtable').append(str);
							})
						}
					}
				})

			});
</script>

