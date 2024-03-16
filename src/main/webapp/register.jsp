<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #e2e2e2;">
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">

		<div class="row mt-5">
			<div class="col-md-6 offset-md-3">
				<div class="card shadow mb-5 bg-body rounded">
				<%@include file="components/message.jsp" %>
				<div class="card-header custom-bg text-white">
						<h3 class="text-center">Register Here</h3>
					</div>
					<div class="card-body px-5">
						<div class="mb-2 text-center">
							<img style="height: 100px; width: 100px"
								src="img/register_logo.png" />
						</div>
						<form action="RegisterServlet" method="post">
							<div class="mb-2">
								<label for="name" class="form-label">User Name</label> <input
									type="text" name="user_name" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>
							<div class="mb-2">
								<label for="email" class="form-label">User Email</label> <input
									type="email" name="user_email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>
							<div class="mb-2">
								<label for="password" class="form-label">User Password</label> <input
									type="password" name="user_password" class="form-control"
									id="password" aria-describedby="emailHelp"
									placeholder="Enter here">
							</div>
							<div class="mb-2">
								<label for="phone" class="form-label">User Phone</label> <input
									type="number" name="user_phone" class="form-control" id="phone"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>
							<div class="mb-2">
								<label for="phone" class="form-label">User Address</label>
								<textarea name="user_address" style="height: 150px"
									class="form-control" placeholder="Enter your address"></textarea>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success me-2">Register</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<%@include file="components/footer.jsp"%>
	<%@include file="components/common_modals.jsp" %>
</body>
</html>