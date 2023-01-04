<%@page import="dto.Account"%>
<%@page import="dao.AccountRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%-- <%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%> --%>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")){
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
			<h1 class="display-3">상품 정보</h1>
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
		String sql = "select * from product WHERE P_id=?";
		psmt= conn.prepareStatement(sql);
		psmt.setString(1, id);
		rs = psmt.executeQuery();
		
		while (rs.next()) {
	%>
		<div class="col-md-5">
		<%-- <img src="c:/upload/<%=product.getFilename()%>" style="width: 100%" /> --%>
		</div>
		<div class="col-md-6">
		<h3><%=Account.getPname()%></h3>
			<p><%=Account.getDescription()%>
			<p><b>상품 코드 : </b><span class="badge badge-danger"> <%=account.getAccountId()%></span>
			<p><b>제조사</b> : <%=Account.getManufacturer()%>
			<p><b>분류</b> : <%=Account.getCategory()%>
			<p><b>재고 수</b> : <%=Account.getUnitsInStock()%>
			<h4><%=Account.getUnitPrice()%>원</h4>
			<p><form name="addForm" action="./addCart.jsp?id=<%=account.getAccountId()%>" method="post">
			<a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</a>
			<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a> 
			<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
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