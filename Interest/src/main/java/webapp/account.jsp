<%@page import="dto.Account"%>
<%@page import="dao.AccountRepository"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page errorPage="exceptionNoAccountId.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>계좌 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("계좌를 관심목록에 추가하시겠습니까?")){
			document.addForm.submit();
		}esle{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">계좌 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
	
		AccountRepository dao = AccountRepository.getInstance();
		Account account = dao.getAccountById(id);
	%>
	<%@ include file="dbconn.jsp" %>
	<div class="container">
	<div class="row">
	<%
		PreparedStatement psmt= null;
		ResultSet rs= null;
		String sql = "select * from account WHERE P_id=?";
		psmt= conn.prepareStatement(sql);
		psmt.setString(1, id);
		rs = psmt.executeQuery();
		
		while (rs.next()) {
	%>
		<div class="col-md-5">
		 <img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width: 100%" /> 
		</div>
		<div class="col-md-6">
			<p><b>계좌 코드 : </b><span class="badge badge-danger"> <%=account.getAccountId()%></span>
				<h3><%=rs.getString("p_name") %></h3>
				<h3><%=rs.getString("p_bank") %></h3>
				<h3><%=rs.getString("p_rate") + "%" %></h3>
				<h3><%=rs.getString("p_description") %></h3>
				<h3><%=rs.getString("p_category") %></h3>
			<p><form name="addForm" action="./addCart.jsp?id=<%=account.getAccountId()%>" method="post">
			<a href="#" class="btn btn-info" onclick="addToCart()"> 계좌개설 &raquo;</a>
			<a href="./cart.jsp" class="btn btn-warning"> 관심목록 &raquo;</a> 
			<a href="./accounts.jsp" class="btn btn-secondary"> 계좌목록 &raquo;</a>
		</form>
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
	<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>