<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login - MyCart</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #e2e2e2;">
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-5 shadow mb-5 bg-body rounded">
					<div class="card-header custom-bg text-white">
						<h3 class="text-center">Login Here</h3>
					</div>
					<div class="card-body mx-5">
					<%@include file="components/message.jsp" %>
						<form action="LoginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" name="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="container text-center">
							<p>Not registered? <a href="register.jsp" class="text-primary">Create an account</a></p></div>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success me-2">Submit</button>
								<button type="reset" class="btn btn-outline-warning ">Reset</button>
							</div>
						</form>
					</div>
					<!--<div class="card-footer"></div>  -->
				</div>
			</div>
		</div>
	</div>
		<%@include file="components/footer.jsp"%>
	<%@include file="components/common_modals.jsp" %>
</body>
</html>