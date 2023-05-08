 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            <div>태그 #프로그래밍 #html </div>
            <div>작성 <fmt:formatDate value="${dto.diary_date }" pattern="yyyy년MM월dd일" type="date" /></div>
          </div>
      <button class="modifyBtn" value="${dto.diary_idx }">수정</button>
      <button type="submit" class="delete" value="${dto.diary_idx }">삭제</button>
      </div>

</c:forEach>
<button id="registerBtn" onclick="location.href='/admin/admin_diaryWrite'">글쓰기</button>

      <div class="content_list">
      <div id="list"> <i class="fa fa-caret-down"></i>개발노트 ${ listCount } 건 </div>
      <form name="searchList">

      	<div> 
      		<input type="text" name="" id="searchText" value=""/> <button id="searchBtn">검색</button>
      	</div>
      	
        <div id="nextbar"> 1 2 3 4  </div>
        </form>
      </div>
      
    </div>
    
    
 <script>
 
 //삭제
 $(".delete").click(function(){
	 
	 var event = $(this);
	var result = event.parents(".content_main");
	 
	 console.log(result);
	 
	 $.ajax({
		    async : true,
		    type : 'POST',
		    data : {
		    	diary_idx : $(this).val()
		    },
		    url : "/admin/deleteDiary",
		    success : function(data) {
		    	console.log(data);
		    event.parents(".contnet_main").remove();
		    
		      alert("삭제되었습니다.");
		  	location.href = '/admin/admin_diary';
		    },
		    error : function(error) {
		      alert("다시 시도해주세요.");
		      return;
		    }
		  });
 });
 
 //수정
 $(".modifyBtn").click(function(){
	 location.href="/admin/admin_diaryRevise?diary_idx="+ $(this).attr("value");
 })

 </script>