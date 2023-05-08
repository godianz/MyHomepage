<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="/css/admin_board.css">

      <div class="contnet_main">
      
        <div class="content_title">
	      <span class="diary_idx">no.${ content.diary_idx }</span>
	      <input type="hidden" value="${content.diary_idx }" id="diary_idx">
	      <input type="text" value="${ content.diary_title }" id="diary_title" >
        </div>

          <div id="editor">${ content.diary_content }</div>
          <input id="diary_content" type="hidden">
          <div class="content_footer">
            <div>태그 #프로그래밍 #html </div>
            <div>작성 <fmt:formatDate value="${ content.diary_date }" pattern="yyyy년MM월dd일" type="date" /></div>
          </div>
          <div class="btnClass">
         <button class="ReviseBtn">수정하기</button> 
         </div>
      </div>


	<!-- CKEditor --> 	
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
	<script>		
	ClassicEditor
	.create(document.querySelector('#editor'), {
		ckfinder: {
			uploadUrl : '/image/upload'
		}
	})
	.then(editor => {
		newEditor = editor;
	})
	.catch(error => {
		console.error(error);
	});
	
	//수정하기
	$(".ReviseBtn").click(function (){
		
		var diaryIdx = $("#diary_idx").val();
		var diaryTitle = $("#diary_title").val();
		var editorData = newEditor.getData();
		newText = editorData.replace(/<(\/p|p)([^>]*)>/gi,"");
		  $("#diary_content").attr('value',newText);
		  
	   var diaryContent = $("#diary_content").val();
		  
		  var data = {
				  "diary_idx" : diaryIdx,
				  "diary_title" : diaryTitle,
				  "diary_content" : diaryContent
		  };
		  
		console.log(data);

		  $.ajax({
			    async : true,
			    type : 'POST',
			    data : JSON.stringify(data),
			    url : "/admin/admin_reviseAction",
			    contentType : "application/json; charset-UTF-8",
			    success : function(data) {
			    console.log(data);
			      alert("저장되었습니다.");
			  	location.href = '/admin/admin_diary';
			    },
			    error : function(error) {
			      alert("다시 시도해주세요.");
			      return;
			    }
			  });
	})
	</script>
