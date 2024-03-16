<%
User user = (User) session.getAttribute("current-user");
if(user == null){
	session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #e2e2e2;">
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-5">
				<!-- 	card -->
				<div class="card shadow p-0 m-0 mb-5 bg-body rounded">
					<div class="card-body">
						<h3 class="text-center mb-3">Order Summary</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-7 shadow p-0 m-0 mb-5 bg-body rounded">
				<!-- 	form details -->
				<div class="card">
					<div class="card-body">
						<h5 class="mb-2">Billing details</h5>
						<form action="orderPlaced.jsp">
						
						<input type="hidden" value="<%=user.getUserId()%>" name="uId">
						
                        <!-- Grid row -->
                        <div class="row">

                            <!-- Grid column -->
                            <div class="col-lg-6">

                                <!-- First name -->
                                <div class="md-form md-outline mb-0 mb-lg-4">
                                    <label for="firstName">First name</label>
                                    <input type="text" id="firstName" required class="form-control mb-0 mb-lg-2">
                                </div>

                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-lg-6">

                                <!-- Last name -->
                                <div class="md-form md-outline">
                                    <label for="lastName">Last name</label>
                                    <input type="text" id="lastName" required class="form-control">
                                </div>

                            </div>
                            <!-- Grid column -->

                        </div>
                        <!-- Grid row -->
						
                        <!-- Country -->
                        <div class="d-flex flex-wrap">
                            <div class="select-outline position-relative w-100">
                                <label>Country - <strong>INDIA</strong></label>


                            </div>
                        </div>

                        <!-- Address Part 1 -->
                        <div class="md-form md-outline mt-2">
                            <label for="form14">Address (Line 1)</label>
                            <input type="text" required id="form14" placeholder="House number and street name" class="form-control">
                        </div>

                        <!-- Address Part 2 -->
                        <div class="md-form md-outline mt-2">
                            <label for="form15">Address (Line 2)</label>
                            <input type="text" id="form15" placeholder="Apartment, suite, unit etc. (optional)"
                                   class="form-control">
                        </div>

                        <!-- Postcode / ZIP -->
                        <div class="md-form md-outline mt-3">
                            <label for="form16">Postcode / ZIP</label>
                            <input type="text" maxlength="6" minlength="6" required id="form16" class="form-control">
                        </div>

                        <!-- Town / City -->
                        <div class="md-form md-outline mt-2">
                            <label for="form17">Town / City</label>
                            <input type="text" required id="form17" class="form-control">

                        </div>

                        <!-- Phone -->
                        <div class="md-form md-outline mt-2">
                            <label for="form18">Phone</label>
                            <input type="number" value="<%=user.getUserPhone() %>" minlength="10" maxlength="10" required id="form18" class="form-control">
                        </div>

                        <!-- Email address -->
                        <div class="md-form md-outline mt-2">
                            <label for="form19">Email address</label>
                            <input type="email" value="<%=user.getUserEmail() %>" required id="form19" class="form-control">
                        </div>

                        <!-- Additional information -->
                        <div class="md-form md-outline mt-2">
                            <label for="form76">Additional information</label>
                            <textarea id="form76" class="md-textarea form-control" rows="4"></textarea>
                        </div>
							<div class="container text-center mt-3">
							<button type="submit" class="btn btn-primary col-md-3 me-3">Order Now</button>
							<a href="index.jsp" class="btn btn-warning col-md-3">Continue Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
	<%@include file="components/common_modals.jsp"%>
</body>
</html>