
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.helper.FactoryProvider"%>
<%
CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
List<Category> list = cDao.getCategories();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Categories</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #e2e2e2;">
	<%@include file="components/navbar.jsp"%>

	<div class="container mt-5">
		<div class="col-md-8 offset-md-2">
			<table class="table table-striped">
					<h2 class="text-center py-3 custom-bg text-white">All Categories</h2>
				<thead>
					<tr>
						<th scope="col">Sr.No</th>
						<th scope="col">Title</th>
						<th scope="col">Description</th>
					</tr>
				</thead>
				<tbody>
					<%
					int counter = 0;
					for (Category c : list) {
					%>
					<tr>
						<th scope="row"><%=++counter%></th>
						<td><%=c.getCategoryTitle()%></td>
						<td><%=c.getCategoryDescription()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<%@include file="components/common_modals.jsp"%>
</body>
</html>