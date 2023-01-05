<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<%@ include file ="dbconn.jsp" %>
		<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">계좌 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%
				PreparedStatement psmt =null;
				ResultSet rs = null;
				
				String sql = "select * from account";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width: 100%">
				<h3><%=rs.getString("p_name") %></h3>
				<h3><%=rs.getString("p_bank") %></h3>
				<h3><%=rs.getString("p_rate") + "%" %></h3>
				<h3><%=rs.getString("p_description") %></h3>
				<h3><%=rs.getString("p_category") %></h3>
			<p><a href="account.jsp?id=<%=rs.getString("p_id")%>"class="btn btn-secondary" role="button">상세 정보 &raquo;></a>
		</div>
		<% 
			}
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		%>
	</div>
	<jsp:include page="footer.jsp" />
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>