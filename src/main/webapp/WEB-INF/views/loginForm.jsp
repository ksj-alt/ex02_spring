<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.error{
		color:red;
	}
</style>
</head>
<body>
	<form action="login" method="post">
		<fieldset>
			<p>
				<label>아이디</label>
				<input type="text" name="userid">
			</p>
			<p>
				<label>비밀번호</label>
				<input type="password" name="userpw">
			</p>
			<p>
				<input type="submit" name="로그인">
			</p>
			<c:if test="${error != null }">
				<p class="error">
					${error }
				</p>
			</c:if>
		</fieldset>
	</form>
	
	<%
		System.out.println("----------------------loginForm.jsp");
	%>
</body>
</html>