<%@page import="com.entities.User"%>
<%
User user1 = (User) session.getAttribute("current-user");
%>


<nav class="sticky-top navbar navbar-expand-lg navbar-dark custom-bg shadow p-2 bg-body">
	<div class="container">
		<div id="brand-container d-flex justify-content-center">
		<img alt="LOGO" src="img/aroma_logo.png" style="height: 50px; width: 50px; margin-top:-10px;">
			<a class="navbar-brand ms-0 fs-2" style="text-shadow: 2px 2px 5px #c82020;" href="index.jsp">AROMA</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div id="navigation-links">
			<div class="collapse navbar-collapse text-center"
				id="navbarSupportedContent">
				<ul class="navbar-nav mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp?category=all">Products</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="about.jsp">About Us</a></li>
				</ul>
			</div>

		</div>
		<div id="nav-right">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link active"
					data-bs-toggle="modal" data-bs-target="#cart" aria-current="page"
					href="#"><i class="fa-solid fa-cart-plus"
						style="font-size: 20px;"></i><span class="ms-0 cart-items">(0)</span></a>
				</li>
				<%
				if (user1 == null) {
				%>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="login.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="register.jsp">Register</a></li>
				<%
				} else {
				%>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page"
					href="<%=user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>"><%=user1.getUserName()%></a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="LogoutServlet">Logout</a></li>

				<%
				}
				%>
			</ul>
		</div>
	</div>
</nav>