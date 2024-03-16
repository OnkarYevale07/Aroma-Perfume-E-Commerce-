<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Delete Product</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #e2e2e2;">
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid m-3  mt-5 d-flex justify-content-center">
		<div
			class="container m-3 p-3 col-md-4 mt-5 shadow mb-5 bg-body rounded">
			<h5>Are you sure you want to delete this item?</h5>
			<br>
			<div class="d-flex justify-content-center">
				<div class="col-md-6 text-center">
					<a href="products.jsp" class="btn btn-primary col-md-6">Back</a>
				</div>
				<div class="col-md-6">
					<form action="deleteServlet" method="post">
						<%
						int pId = Integer.parseInt(request.getParameter("pId"));
						%>
						<input type="hidden" name="pId" value="<%=pId%>">
						<button class="btn btn-danger col-md-6">Confirm</button>
					</form>
				</div>
			</div>
		</div>

	</div>





	<%@include file="components/footer.jsp"%>
	<%@include file="components/common_modals.jsp"%>
</body>
</html>