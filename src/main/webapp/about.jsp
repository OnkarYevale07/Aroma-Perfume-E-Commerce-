<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<div class="container-fluid m-0 p-0"></div>
	<%@include file="components/navbar.jsp"%>
	<div class="container pt-3 contact-container shadow p-3 mb-5 bg-body rounded"
		style="background: #e2e2e2 !important;">
		<div class="row col-md-12 text-center mb-3 pb-5">
			<h3 class="mb-5 contact-heading">- We Strive To Serve You With
				Only THE BEST! -</h3>
			<p id="contact-para">We invite you to connect with us, allowing
				the essence of our enchanting scents to weave a tapestry of
				olfactory delight in your life.</p>
			<p id="contact-para">Our team is dedicated to providing an
				unforgettable sensory experience, and we’re thrilled to hear from
				you.</p>
			<p id="contact-para">Whether you have a question or simply wish
				to share your thoughts, we welcome all inquiries with open arms. We
				cherish every opportunity to engage with our valued community.</p>
			<p id="contact-para">Our dedicated team of customer service
				professionals is always at your disposal to provide you with fast
				support so that you can have a simplified shopping experience with
				us at Belvish.</p>
		</div>
		<div class="row col-md-12 my-5 px-5">
			<div class="col-md-4 contact-card-text d-flex">
				<div class="left">
					<i class="fa-solid fa-location-arrow"></i>
				</div>
				<div class="right">
					<h4>Location</h4>
					<p>B-9, Kore Nagar, Warananagar, Kolhapur-416114</p>
				</div>
			</div>
			<div class="col-md-4 contact-card-text d-flex">
				<div class="left">
					<i class="fa-solid fa-phone"></i>
				</div>
				<div class="right">
					<h4>Support</h4>
					<p>
						Mobile/ Whatsapp: +91 86984 24630<br> Mail: cares@aroma.com
					</p>
				</div>
			</div>
			<div class="col-md-4 contact-card-text d-flex">
				<div class="left">
					<i class="fa-regular fa-clock p-0"></i>
				</div>
				<div class="right">
					<h4>Get In Touch</h4>
					<p>Tuesday - Sunday 11AM to 08PM. Please note that we are not
						operational on Mondays. All order placed after Sunday 4pm onwards
						will start processing on consecutive Tuesdays. In case Tuesday is
						a public holiday then the orders will be processed on the next
						business day.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-12 py-5 d-flex bg-grey" style="background: #e2e2e2;">
		<div class="left col-md-6 ps-3">
			<img src="img/banner1.jpg"
				style="border: 2px solid #000; border-radius: 20px;"
				class="col-md-12" alt="">
		</div>
		<div class="right col-md-6">
			<h4 class="ms-2 text-center contact-heading">Still Having
				Queries?</h4>
			<p class="ms-2 text-center mb-0 contact-form-para">
				You may simply complete the form below and click ‘send’ to submit an
				enquiry. Our customer service team <br>will get in touch with
				you within 3 business days.
			</p>
			<div class="row col-md-12">
				<!--    <form> -->
				<div class="row m-0">
					<div class="col m-2">
						<input type="text" class="form-control" style="border: none;"
							placeholder="Your name*" required>
					</div>
					<div class="col m-2">
						<input type="number" class="form-control" style="border: none;"
							placeholder="Your phone*" required>
					</div>
				</div>
				<div class="row m-0">
					<div class="col m-2">
						<input type=email class="form-control" style="border: none;"
							placeholder="Your email*" required>
					</div>
					<div class="col m-2">
						<input type="text" class="form-control" style="border: none;"
							placeholder="Subject" required>
					</div>
					<div class="row m-0">
						<div class="col mx-0 p-2 m-2">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								style="border: none;" rows="3" placeholder="Your message"
								required></textarea>
						</div>
					</div>
					<div class="row mt-0 ms-2 ps-0">
						<div class="col mt-0">
							<button type="submit" class="btn btn-primary fs-4 border-0"
								style="background: palevioletred; height: 6vh; width: 10vw; font-weight: 400;">Submit</button>
						</div>
					</div>


					<!--     </form> -->
				</div>
			</div>
		</div>

	</div>
	<%@include file="components/footer.jsp"%>
	<%@include file="components/common_modals.jsp"%>
</body>
</html>