<%@page import="com.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin ! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%
CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
List<Category> list = cDao.getCategories();

// getting count
Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #e2e2e2;">
	<%@include file="components/navbar.jsp"%>

	<div class="container admin">
		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp"%>
		</div>


		<div class="row mt-3">
			<!-- first column -->
			<div class="col-md-4">
				<div class="card" onclick="viewUsers()">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle"
								src="img/team.png" alt="team_logo">
						</div>
						<h1><%=m.get("userCount") %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			<!-- second column -->
			<div class="col-md-4">
				<div class="card" onclick="viewCategories()">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle"
								src="img/list.png" alt="team_logo">
						</div>
						<h1><%=list.size() %></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<!-- third column -->
			<div class="col-md-4">
				<div class="card" onclick="viewProducts()">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle"
								src="img/delivery-box.png" alt="team_logo">
						</div>
						<h1><%=m.get("productCount") %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>


		<!-- second row -->
		<div class="row mt-3">
			<!-- second row first column-->
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle"
								src="img/calculator.png" alt="team_logo">
						</div>
						<p class="mt-2">Click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
			<!-- second row second column-->
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle"
								src="img/plus.png" alt="team_logo">
						</div>
						<p class="mt-2">Click here to add new Product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 	add category modal start -->
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">

						<div class="form-group mb-3">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required>
						</div>
						<div class="form-group">
							<textarea style="height: 200px;" class="form-control"
								placeholder="Enter category description" name="catDescription"
								required></textarea>
						</div>
						<div class="container text-center m-3">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- 	add category modal end-->

	<!-- 	add product modal start -->
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post">
						<input type="hidden" name="operation" value="addproduct">
						<div class="form-group mb-3">
							<input type="text" class="form-control" name="pName"
								placeholder="Enter product name" required>
						</div>
						<div class="form-group mb-3">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter product price" required>
						</div>
						<div class="form-group mb-3">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter product discount" required>
						</div>
						<div class="form-group mb-3">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter product quantity" required>
						</div>
						<div class="form-group mb-3">
							<select class="form-select" name="catId"
								aria-label="Default select example">

								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
								<%
								}
								%>


							</select>
						</div>

						<div class="form-group mb-3">
							<textarea style="height: 150px;" class="form-control"
								placeholder="Enter category description" name="pDesc" required></textarea>
						</div>
						<div class="form-group mb-3 col-md-12">
							<label for="pPhoto" class="mb-2 me-2">Enter Image URL</label><input type="text" id="pPhoto" class="col-md-10" name="pPhoto" placeholder="Enter Image URL"
								required>
						</div>

						<div class="container text-center m-3">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- 	add product modal end-->


	<%@include file="components/common_modals.jsp"%>
</body>
</html>