<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/admin_diaryWrite.css">

		<div class="container">
		<div class="title">
		<span>제목:</span> <input type="text" id="diary_title">
		</div>
		<textarea id="editor"></textarea>	
		<input type="hidden" id="diary_content">
		</div>
		<div class="container_under" >
		<input type="button" class="btn btn-secondary mt-3 mx-2" value="작성취소" />
		<input class="btn btn-primary mt-3 mx-2" value="작성완료" id="submit" />
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
	//게시글 등록
	 $("#submit").click(function() {
		
		  var editorData = newEditor.getData();
			newText = editorData.replace(/<(\/p|p)([^>]*)>/gi,"");
		  $("#diary_content").attr('value',newText);

		  var diaryTitle = $("#diary_title").val();
		  var diaryContent = $("#diary_content").val();
		  
		  var data = {
			diary_title: diaryTitle,
			diary_content: diaryContent
		  };
		  
		  console.log(data);
		  
		  $.ajax({
		    async : true,
		    type : 'POST',
		    data : JSON.stringify(data),
		    url : "/admin/WriteAction",
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
	}); 
	</script>
