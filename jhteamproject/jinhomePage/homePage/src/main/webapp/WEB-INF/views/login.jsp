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

<body>
	<!-- Main content -->
	<div>
		<selection>
			<fieldset>
				<ul>
					<li><legend>로그인</legend>
					<form method="post">
						<label for="id">아이디　 : </label>
						<input type="text" id="id" name="id" size="13" autofocus></li>
						<li><label for="password"> 비밀번호 : </label>
						<input type="password" id="password" name="password"></li>
						<input type="submit" value="로그인">
					</form>			
				</ul>
			</fieldset>
			
	    </section>
    </div>
</body>