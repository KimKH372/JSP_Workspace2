<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<!-- 값 설정하는 부분이 없어서, 기본 클래스에 있는 기본값 불러와짐,
앞에서 설정한 세터 부분을  가져와서 변경하고, 다시 출력하기 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<p>	아이디 : <jsp:getProperty name="person" property="id" />
	<p>	이 름 : <jsp:getProperty name="person" property="name" />
	
	<p>기본값이 아닌 내가 설정한 값으로 불러오기
	<jsp:setProperty name="person2" property="id" value="20182005" />
	<jsp:setProperty name="person2" property="name" value="홍길동" />
	<p>	아이디2 : <jsp:getProperty name="person2" property="id" />
	<p>	이 름2 : <jsp:getProperty name="person2" property="name" />
</body>
</html>