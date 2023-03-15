<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="false" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<%@ include file="include/head.jsp" %>


<script>
function fn_prev(page, range, rangeSize) {      
	   var page = ((range - 2) * rangeSize) + 1;      
	   var range = range - 1;      
	   //var upId = document.getElementById("hidden_upId").value;
	   var url = "${contextPath}/board/list";      
	   url = url + "?page=" + page;      
	   url = url + "&range=" + range;            
	   location.href = url;   
	}  

	//페이지 번호 클릭   
	function fn_pagination(page, range, rangeSize, searchType, keyword) {   
	   //var upId = document.getElementById("hidden_upId").value;
	   var url = "${contextPath}/board/list";         
	   url = url + "?page=" + page;      
	   url = url + "&range=" + range;      
	   location.href = url;      
	}   

	//다음 버튼 이벤트   
	function fn_next(page, range, rangeSize) {      
	   var page = parseInt((range * rangeSize)) + 1;      
	   var range = parseInt(range) + 1;      
	   //var upId = document.getElementById("hidden_upId").value;
	   var url = "${contextPath}/board/list";         
	   url = url + "?page=" + page;      
	   url = url + "&range=" + range;            
	   location.href = url;   
	}
</script>

<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body>
<div>


  <!-- Content Wrapper. Contains page content -->
  
  <div class="content-wrapper"><br><br>
    <section class="content-header">
        <div class="box">
		<div class="box-header with-border">
			<a href="${contextPath}/board/register"><h2>게시판 글쓰기</h2></a>
		</div>
		</div>
    </section>

    <!-- Main content --><br>
    <section class="content container-fluid">
		<div>${msg}</div>
		<div class="table-responsive">
		  <table class="table">

			<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
			<td>작성자</td>
			<td>조회수</td>
			</tr>
			
			<c:forEach var="board" items="${list}">
			<tr>
          <td>${board.bno}</td>
          <td><a href="detail?bno=${board.bno}"> ${board.title} </a></td>
          <td>${board.regdate}</td>
          <td>${board.id}</td>
          <td><span class="badge">${board.readcnt}</span></td>
          </tr>
      </c:forEach>
      <tr>
			<td colspan="5" align="center">
				<input class="btn btn-success" type="button" value="메인으로"	id="main" />		
			</td>
		</tr>
		  </table>
		</div>
		<!-- pagination{s} -->   
         <div id="paginationBox">      
          <ul class="pagination">         
           <c:if test="${pagination.prev}">            
              <li class="page-item">
                 <a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
              </li>         
           </c:if>                     
           <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">            
              <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
                 <a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
              </li>         
           </c:forEach>                     
           <c:if test="${pagination.next}">            
              <li class="page-item">
                 <a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
              </li>         
           </c:if>      
          </ul>   
         </div>   
        <!-- pagination{e} -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</body>
</html>