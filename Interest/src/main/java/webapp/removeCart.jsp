<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Account"%>
<%@ page import="dao.AccountRepository"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("accounts.jsp");
		return;
	}
	AccountRepository dao = AccountRepository.getInstance();
	
	Account account = dao.getAccountById(id);
	if (account == null) {
		response.sendRedirect("exceptionNoAccountId.jsp");
	}
	ArrayList<Account> cartList = (ArrayList<Account>) session.getAttribute("cartlist");
	Account goodsQnt = new Account();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getAccountId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}
	response.sendRedirect("cart.jsp");
%>