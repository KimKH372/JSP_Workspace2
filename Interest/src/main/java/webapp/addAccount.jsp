<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 등록</title>
</head>
<body>

	<jsp:include page="header.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title" /></h1>
		</div>
	</div>
	<div class="container">
			
		<form name="newAccount" action="./processAddAccount.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="accountId" /></label>
				<div class="col-sm-3">
					<input type="text" id="accountId"  name="accountId"  class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname" /></label>
				<div class="col-sm-3">
					<input type="text" id="name"  name="name" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="Rate"/></label>
				<div class="col-sm-3">
					<input type="text" id="Rate"  name="Rate" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category" /></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition" /></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="은행" ><fmt:message key="은행"/> 
					<input type="radio" name="condition" value="저축은행" ><fmt:message key="저축은행" />
					<input type="radio" name="condition" value="CMA" ><fmt:message key="CMA" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="accountImage" /></label>
				<div class="col-sm-5">
					<input type="file" name="accountImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button" />" onclick="CheckAddAccount()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>