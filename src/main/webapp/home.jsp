<%@page import="com.helper.Helper"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart - Home</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #e2e2e2;">
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-5 mx-2">
			<%
			String cat = request.getParameter("category");
			ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
			List<Product> list = null;
			if (cat == null || cat.trim().equals("all")) {
				list = productDao.getAllProducts();
				%>
				<script type="text/javascript">
				let old = document.getElementById("all");
				old.classList.add("active","text-white");
				</script>
				<%
			} else {
				int cId = Integer.parseInt(cat.trim());
				list = productDao.getProductsById(cId);
				%>
				<script type="text/javascript">

				function changeClass(cId){
					let old = document.getElementById(cId);
								console.log(document.getElementById(cId));
								old.classList.add("active","text-white");
								let all = document.getElementById("all");
								all.classList.remove("active","text-white");
				}
				const cId = <%= cId%>
				console.log(cId.toString());
				changeClass(cId);
				</script>
				<%
			}

			CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> cList = cDao.getCategories();
			%>
			<!-- 	show categories -->
			<div class="col-md-2 h-100 shadow m-0 p-2 bg-body rounded">

				<div class="list-group mt-0">
					<a href="home.jsp?category=all" id="all"
						class="list-group-item list-group-item-action active"
						aria-current="true"> All Products </a>
				</div>

				<%
				for (Category c : cList) {
				%>
				<a href="home.jsp?category=<%=c.getCategoryId()%>" id="<%=c.getCategoryId() %>"
					class="list-group-item list-group-item-action text-dark"><%=c.getCategoryTitle()%></a>
				<%
				}
				%>
			</div>
			<!-- 	show products -->
			<div class="col-md-10 d-flex flex-wrap">

				<!-- 	row -->
				<!-- <div class="container mt-4 p-0 d-flex flex-wrap"> -->
				<!-- traversing products -->
				<%
				for (Product p : list) {
				%>

				<div class="col-md-3 m-2 d-flex flex-wrap">

					<div class="card product-card shadow p-0 m-0 mb-5 bg-body rounded" style="width:500px !important;">
						<a href="view_product.jsp?pid=<%=p.getpId()%>">
							<div class="container text-center"
								style="height: 250px; width: 100%;">
								<img src="<%=p.getpPhoto()%>" style="height: 100%"
									class="card-img-top my-2 mx-0 text-center" alt="Product image">
							</div>
						</a>
						<div class="card-body">
							<h5 class="card-title"><%=p.getpName()%></h5>
							<p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
						</div>
						<a href="view_product.jsp?pid=<%=p.getpId()%>">
							<div class="card-footer text-center">
								<button class="btn custom-bg text-white">View Product</button>
								<button class="btn btn-outline-success">
									&#8377;<%=p.getPriceAfterApplyingDiscount()%>/- <span
										class="text-secondary discount-label"><%=p.getpDiscount()%>%Off</span>
								</button>
							</div>
						</a>
					</div>
				</div>
				<%
				}
				if (list.size() == 0) {
				out.println("<h3>No item in this category</h3>");
				}
				%>
				<!-- </div> -->

			</div>
		</div>
	</div>
	<%@include file="components/footer.jsp"%>

	<%@include file="components/common_modals.jsp"%>
</body>
</html>