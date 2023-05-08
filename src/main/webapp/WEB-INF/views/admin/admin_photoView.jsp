<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="/css/admin_photo.css">

<div class="content">
	<div class="contnet_main">
		<div class="content_title">
			<div id="gallery_idx" name="gallery_idx">${ galleryView.gallery_idx }</div>
			<input type="text" value="${ galleryView.gallery_title }" id="gallery_title" name="gallery_title" />
		</div>
		<div class="content_text">
		<div class="before">
			<label>현재 이미지</label>
			<img src="${ galleryView.gallery_image }" >
		</div>
		<div class="after">
			<label>변경 이미지</label> 
			<input type="file" name="image" multiple><br>
			<label>내용</label>
			<input type="text" value="${ galleryView.gallery_content}" name="gallery_content" />
		</div>
		</div>
		<div class="content_footer">
			<div>태그 #재미난취미생활</div>
			<div>작성일 
				<fmt:formatDate value="${ galleryView.gallery_date }" pattern="yyyy년MM월dd일" type="date" />
			</div>
		</div>
		<div class="btnClass">
		<input type="submit" value="수정" id="uploadBtn" class="btnClass"/>
		<button class="btnClass" id="deleteBtn">삭제</button>
		</div>
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
	$(".page").click(function() {
		console.log($(this).attr("value"));
		location.href = "/admin/admin_photoView?gallery_idx=" + $(this).attr("value");
	})

	$('#uploadBtn').click(function(e) {

		let formData = new FormData();

 		let inputFile = $("input[name='image']").val();
		let galleryTitle = $("input[name='gallery_title']").val();
		let galleryContent = $("input[name='gallery_content']").val();

 		formData.append("image", inputFile);
		formData.append("gallery_title", galleryTitle);
		formData.append("gallery_content", galleryContent);

		
		  $.ajax({
			    async : true,
			    type : 'POST',
			    data : formData,
 				processData : false,
 				contentType: false,
 				enctype:'multipart/form-data',
 				dataType:'json',
			    url : '/admin/admin_photoRevise',
			    success : function(data) {
			     alert("수정되었습니다.");
			    },
			    error : function(error) {
			      alert("다시 시도해주세요.");
			      return;
			    }
			  });
		
		
	})
</script>
