<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
	<%@ include file ="dbconn.jsp" %>
	<div class="container">
		<div class="row" align="center">
			<%
				PreparedStatement psmt =null;
				ResultSet rs = null;
				
				String sql = "select * from product";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<%-- <img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width: 100%"> --%>
				<h3><%=rs.getString("p_name") %></h3>
				<h3><%=rs.getString("p_bank") %></h3>
				<h3><%=rs.getString("p_rate") %></h3>
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
</body>
</html>