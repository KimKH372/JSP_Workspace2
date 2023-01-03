<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<!-- 객체 생성, DTO클래스 역할 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<jsp:setProperty name="person" property="id" value="20182005" />
	<jsp:setProperty name="person" property="name" value="홍길동" />
	<p>	아이디 : <% out.println(person.getId()); %>
	<p>	이 름 : <% out.println(person.getName()); %>
	
	<jsp:useBean id="person2" class="ch04.com.dao.Person" scope="request" />
	<jsp:setProperty name="person2" property="id" value="20122005" />
	<jsp:setProperty name="person2" property="name" value="kkh" />
	<p>	아이디2 : <% out.println(person2.getId()); %>
	<p>	이 름2 : <% out.println(person2.getName()); %>
</body>
</html>