
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.UserDao"%>
<%@page import="java.util.List"%>
<%
UserDao uDao = new UserDao(FactoryProvider.getFactory());
List<User> list = uDao.getAllUsers();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users</title>
<link rel="icon" type="image/x-icon" href="img/aroma_logo.png">
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #e2e2e2;">
	<%@include file="components/navbar.jsp"%>

	<div class="container  mt-5">
		<table class="table table-striped text-center">
		<h2 class="text-center py-3 custom-bg text-white">All Users</h2>
			<thead>
				<tr>
					<th scope="col">Sr.No</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Phone</th>
					<th scope="col">Pic</th>
					<th scope="col">Address</th>
				</tr>
			</thead>
			<tbody>
				<%
				int counter = 0;
				for (User u : list) {
				%>
				<tr>
					<th scope="row"><%=++counter%></th>
					<td><%=u.getUserName()%></td>
					<td><%=u.getUserEmail()%></td>
					<td><%=u.getUserPhone()%></td>
					<td><div
							class="container text-center d-flex justify-content-center"
							style="height: 70px; width: 100px;">
							<img src="img/product_images/<%=u.getUserPic()%>"
								class="card-img-top border rounded-circle" alt="Profile image">
						</div></td>
					<td><%=u.getUserAddress()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<%@include file="components/common_modals.jsp"%>
</body>
</html>