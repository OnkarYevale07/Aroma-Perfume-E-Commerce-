<%@page import="com.entities.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.ProductDao"%>
<%
ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
List<Product> list = pDao.getAllProducts();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #e2e2e2;">
	<%@include file="components/navbar.jsp"%>

	<div class="container mt-5">
		<div class="col-md-12">
			<table class="table table-striped table-bordered">
				<h2 class="text-center py-3 custom-bg text-white">All Products</h2>
				<thead class="mt-0">
					<tr>
						<th scope="col">Sr.No</th>
						<th scope="col">Product Name</th>
						<th scope="col">Category</th>
						<th scope="col">Price</th>
						<th scope="col">Discount</th>
						<th scope="col">Discounted Price</th>
						<th scope="col">Quantity</th>
						<th scope="col">Product Image</th>
						<th scope="col">Description</th>
					</tr>
				</thead>
				<tbody>
					<%
					int counter = 0;
					for (Product p : list) {
					%>
					<tr>
						<th scope="row"><%=++counter%></th>
						<td><%=p.getpName()%></td>
						<td><%=p.getCategory().getCategoryTitle()%></td>
						<td><%=p.getpPrice()%></td>
						<td><%=p.getpDiscount()%></td>
						<td><%=p.getPriceAfterApplyingDiscount()%></td>
						<td><%=p.getpQuantity()%></td>
						<td><div
								class="container text-center d-flex justify-content-center"
								style="height: 50px; width: 100%;">
								<img src="<%=p.getpPhoto()%>"
									class="card-img-top" alt="Product image">
							</div></td>
						<td><%=p.getpDesc()%></td>
						<td><a href="update_product.jsp?pId=<%=p.getpId() %>"><button  class="btn btn-primary">Edit</button></a></td>
						<td><a href="deleteProduct.jsp?pId=<%=p.getpId() %>"><button class="btn btn-danger">Delete</button></a></td>
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