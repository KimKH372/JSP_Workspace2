<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>MVC</title>
</head>
<body>
<!--  뷰에서 입력된 정보를, 전송 버튼을 누르게 되면,
 action="ControllerServlet" 여기서 처리함
  -->
	<form method="post" action="ControllerServlet">
		<p>	아이디 : <input type="text" name="id">
		<p>	비밀번호 : <input type="password" name="passwd">
		<p>	<input type="submit" value="전송">
	</form>
</body>
</html>