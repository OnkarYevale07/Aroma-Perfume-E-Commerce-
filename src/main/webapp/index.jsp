<%@page import="com.helper.Helper"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aroma.com.Bloom Far Away With Aroma</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #f2f2f2;">
	<%@include file="components/navbar.jsp"%>
	<h5 class="text-center my-1">
		<marquee>
			<span class="mx-5" style="font-family: 'Stylish';font-weight: 400;">🎯🍃😍Bloom Far Away With Aroma.😍🍃🎯</span> <span
				class="mx-5" style="font-family: 'Stylish';font-weight: 400;">🎯🍃💌Your Fragrance is your message, Your
				scented slogan.💌🍃🎯</span><span class="mx-5" style="font-family: 'Stylish';font-weight: 400;">🎯🍃A Women's
				Perfume tells more about her than her handwriting.😍🍃🎯</span> <span
				class="mx-5" style="font-family: 'Stylish';font-weight: 400;">💞🍃💖A Perfume is an intimate object, it is the
				reflector of the heart.💖🍃💞</span>
		</marquee>
	</h5>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">

			<div class="carousel-item active">
				<a href="view_product.jsp?pid=25"> <img
					src="img/banners/slide2.jpg" class="d-block w-100"
					style="height: 70vh;" alt="Banner Image"></a>
			</div>

			<div class="carousel-item">
				<a href="view_product.jsp?pid=27"> <img
					src="img/banners/slide1.jpg" class="d-block w-100"
					style="height: 70vh;" alt="Banner Image"></a>
			</div>

			<div class="carousel-item">
				<a href="view_product.jsp?pid=40"> <img
					src="img/banners/slide3.jpg" class="d-block w-100"
					style="height: 70vh;" alt="Banner Image"></a>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="text-center my-3 px-5 col-md-8 offset-md-2">
		<h1
			class="text-center custom-bg m-0 p-2 mx-5 text-white border rounded-pill"
			style="font-family: 'Truculenta', sans-serif; font-weight: 600; font-style: italic;">─────
			⋆⋆⋆ Best Offers ⋆⋆⋆ ─────</h1>
	</div>
	<div class="container d-flex flex-wrap offset-md-2">
		<%
		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		List<Product> pList = dao.getDiscountedProducts();
		int count = 0;
		for (Product p : pList) {
			count++;
			if (count > 3) {
				break;
			} else {
		%>
		<div class="col-md-3 m-2">

			<div class="card product-card shadow p-0 m-0 mb-2 bg-body rounded">
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
		}
		%>
	</div>
	<div class="text-center my-3 px-5 col-md-8 offset-md-2">
		<h1
			class="text-center custom-bg m-0 p-2 mx-5 text-white border rounded-pill"
			style="font-family: 'Truculenta', sans-serif; font-weight: 600; font-style: italic;">─────
			⋆⋆⋆ MOST SELLING ⋆⋆⋆ ─────</h1>
	</div>
	<div class="container-fluid m-0 p-0">
		<a href="view_product.jsp?pid=35"> <img
			src="img/banners/slide4.jpg" class="d-block w-100"
			style="height: 80vh;" alt="Banner Image"></a><a
			href="view_product.jsp?pid=30"><img src="img/banners/slide2.jpg"
			class="d-block w-100" style="height: 70vh;" alt="Banner Image"></a>
		<a href="view_product.jsp?pid=44"><img
			src="img/banners/slide3.jpg" class="d-block w-100"
			style="height: 70vh;" alt="Banner Image"></a> <a
			href="view_product.jsp?pid=44"><img src="img/banners/slide5.jpg"
			class="d-block w-100" style="height: 70vh;" alt="Banner Image"></a>
	</div>

	<%@include file="components/footer.jsp"%>
	<%@include file="components/common_modals.jsp"%>
</body>
</html>