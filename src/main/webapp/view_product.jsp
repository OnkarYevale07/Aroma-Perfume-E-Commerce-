<%@page import="com.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.helper.FactoryProvider"%>
<%
int pId = Integer.parseInt(request.getParameter("pid"));
ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
List<Product> list = pDao.getProductById(pId);
Product product = list.get(0);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products Details</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background: #e2e2e2;">
	<%@include file="components/navbar.jsp"%>

	<div class="container mt-5 shadow p-3 mb-5 bg-body rounded"
		style="background: #fff">
		<div class="row p-3">
			<div class="col-md-4">
				<div class="container text-center"
					style="height: 100%; width: 100%;">
					<img src="<%=product.getpPhoto()%>" class="card-img-top m-2"
						alt="Product image">
				</div>
			</div>
			<div class="col-md-8 text-dark">
				<h1 class="text-dark"><%=product.getpName()%></h1>
				<p class="fw-bold">
					<span><%=product.getpDesc()%></span><br>
				</p>
				<span class="text-success fw-bold">Special Price</span><br> <span
					class="fw-bold fs-3">₹<%=product.getPriceAfterApplyingDiscount()%></span>
				<span class="text-gray fs-6 ms-1 text-decoration-line-through">M.R.P
					: ₹<%=product.getpPrice()%></span> <span class="fw-bold text-success fs-6"><%=product.getpDiscount()%>%
					off</span><br>
				<p>
					<span class="fw-bold fs-6">Available offers</span><br>
				<p>
					Special PriceGet extra ₹131 off (price inclusive of
					cashback/coupon)<a href="#" data-bs-toggle="modal"
						data-bs-target="#add-category-modal" class="text-primary">T&C</a>
				</p>
				</p>
				<p>
					Combo OfferBuy 2 or more items save 5%See all products<a href="#"
						class="text-primary" data-bs-toggle="modal"
						data-bs-target="#add-category-modal">T&C</a>
				</p>
				<p>
					Combo OfferBuy 3 or more items save 10%See all products<a href="#"
						class="text-primary" data-bs-toggle="modal"
						data-bs-target="#add-category-modal">T&C</a>
				</p>
				<p>
					Bank OfferGet ₹25* instant discount for the 1st Flipkart Order
					using Flipkart UPI<a href="#" class="text-primary"
						data-bs-toggle="modal" data-bs-target="#add-category-modal">T&C</a>
				</p>
				<a class="text-primary">View 5 more offers</a><br>
				<br>
				<%
				if (product.getpQuantity() <= 10) {
				%>
				<span class="fw-bold text-danger fs-6"> Hurry Up!! Only <%=product.getpQuantity()%>
					Qty left in Stock
				</span><br>
				<%
				} else {
				%>
				<span class="fw-bold text-success fs-6"> Hurry Up!! Only <%=product.getpQuantity()%>
					Qty left in Stock
				</span><br>
				<%
				}
				%>


				<div class="container mt-3 d-flex">
					<button class="btn custom-bg text-white w-50 mx-4"
						onclick="add_to_cart(<%=product.getpId()%>,'<%=product.getpName()%>',<%=product.getPriceAfterApplyingDiscount()%>)">Add
						to Cart</button>
					<button class="btn btn-warning w-50">
						<a href="index.jsp" class="text-decoration-none text-dark">Continue
							Shopping</a>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="text-center my-3 px-5 col-md-8 offset-md-2">
		<h1 class="text-center m-0 p-2 mx-5 text-white"
			style="font-family: 'Truculenta', sans-serif; font-weight: 600; font-style: italic; color: #000 !important;">─────
			⋆⋆⋆ SIMILAR PRODUCTS ⋆⋆⋆ ─────</h1>
	</div>
	<div class="container d-flex flex-wrap offset-md-2">
		<%
		ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
		List<Product> pList = productDao.getProductsById(product.getCategory().getCategoryId());
		%>
		<!-- traversing products -->
		<%
		int count = 0;
		for (Product p : pList) {
			count++;
			if (count > 6) {
				break;
			} else {
		%>

		<div class="col-md-3 m-2">

			<div class="card product-card shadow p-0 m-0 mb-5 bg-body rounded">
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



	<!-- 	Terms and Conditions modal start -->
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Terms &
						Conditions</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<span class="fw-bold">Frequently Asked Questions</span><br> <span
						class="fw-bold">What is the offer?</span><br> Rs. 25 Instant
					Discount on first Flipkart UPI transaction on the Platform as a
					reward for using Flipkart UPI on the Platform<br> <span
						class="fw-bold">What is the offer duration?</span><br>
					March’2024<br> <span class="fw-bold">What other
						conditions should apply to avail the offer?</span><br> Categories :
					All Categories excluding Recharges & Bill Payments, FK Travel<br>
					Minimum Transaction Value: Rs. 250<br> Maximum Discount : INR
					25 (Instant)<br> Applicable only for first Flipkart UPI
					transaction on Flipkart platform<br> Available only on Android
					device<br> Applicable only during the Offer Duration<br>
					Applicable only on Flipkart UPI as Payment Mode<br> <span
						class="fw-bold">How do I check if a product is an eligible
						product?</span><br> Offer is applicable on select products listed on
					the platform.<br> Customers will be shown the offer callout on
					the Product and Payment page, for all eligible products. Please
					check before making a purchase.<br> Offer is not applicable on
					Recharges & Bill Payments, FK Travel.<br> <span
						class="fw-bold">Is there a limit on the number of
						transactions?</span><br> Applicable only for first Flipkart UPI
					transaction on Flipkart platform<br> <span class="fw-bold">TERMS
						AND CONDITIONS</span><br> Offer Details The Offer Validity:
					March’2024 Under this Offer, Customer will get Rs. 25 Instant
					Discount on first Flipkart UPI transaction on the Flipkart platform
					The Net Cart Value (NCV) shall mean the total value of only the
					eligible product/s in the cart after all applicable discounts and
					exchange offer redemptions. The minimum Net Cart Value (NCV) to
					avail the base offers is INR 250 Offer Discount shall be applicable
					as follows a. Minimum Transaction Value: Rs. 250 b. Maximum
					Discount : INR 25 (Instant) Purchase of Product/s must be made
					using Flipkart UPI as payment mode. Savings will be calculated on
					the net paid amount by the customer post any other Savings,
					exchange offer redemptions and refunds. The offer is applicable for
					Android Users (mobile Flipkart Application). Offer is not valid on
					the purchase of Jewelry, Gold or Silver coins. Detailed Terms and
					Conditions The Offer is not applicable for Cash-on-delivery
					transactions or orders converted from Cash On Delivery to Prepaid.
					In case of cancellation of Your order, the transaction will not
					qualify for the Offer. If you cancel part of your order, you will
					qualify for the Offer only on the net amount You pay basis
					eligibility. Flipkart/Flipkart Advanz reserves the right to
					disqualify the Customer from the benefits of the Offer, if any
					fraudulent activity is identified as being carried out for availing
					the benefits under the said Offer or otherwise by use of the
					Payment instrument. Any person availing this Offer shall be deemed
					to have accepted these terms and conditions. Flipkart Advanz and
					Flipkart reserve the right, at any time, without prior notice and
					without assigning any reason whatsoever, to add/alter/modify/change
					or vary these terms and conditions or to replace, wholly or in
					part, this offer by another offer, whether similar to this Offer or
					not, or to extend or withdraw it altogether. Nothing herein amounts
					to a commitment by Flipkart Advanz to conduct further, similar or
					other offers. You understand that Flipkart may share Your
					transactional data with Flipkart Advanz for purposes of this Offer
					and for checking Your eligibility for their products and services
					and by participating in this Offer, You expressly consent to this
					sharing of Your data for these purposes. Any query regarding the
					Offer will be entertained only till 30th April 2024. Post such
					date, Flipkart Advanz and Flipkart will not entertain any
					correspondence or communication regarding this Offer from any
					persons. Flipkart/Flipkart Advanz do not endorse any of the
					products or brands being offered under the Offer and will not
					accept any liability pertaining to the quality, merchantability,
					fitness, delivery or after sales service of such products which
					shall be at the sole liability to sellers on the Platform. All the
					existing offers, gifts, discounts etc. that are being offered can
					be availed by the Customer as part of this exclusive offer as
					mentioned in the communication. Pictures of products shown in the
					communication sent to the customer either through mailers or
					advertised on the website, are representative only and may not bear
					a resemblance to the actual products. None of the parties shall
					under any circumstances be responsible towards the same. Products
					offered under this Offer are subject to availability from the
					respective participating merchants/sellers on the Platform and
					accordingly, Flipkart Advanz or Flipkart in no circumstances shall
					be liable for non-availability of any of the products. Under no
					circumstance will the Offer/discount being offered under this Offer
					be settled with cash in lieu by Flipkart or by Flipkart Advanz.
					Returned transactions, disputed or unauthorized/fraudulent
					transactions will not be considered for the Offer Flipkart Advanz
					will not entertain any correspondence regarding the validity or
					acceptability of any additional benefits offered by seller(s) on
					products/services made available by it and the same shall be at the
					sole risk and consequences of such seller(s) and without reference
					to Flipkart Advanz. The Customer agrees that Flipkart, Flipkart
					Advanz or the seller(s) shall not be liable for any transaction
					failure issues. By participating in this Offer you agree to be
					bound by these terms and conditions of the Offer, standard terms
					and conditions, terms of use, privacy policy (as amended from time
					to time) of the Platform, any other documents as may be applicable
					while using the Platform and the terms and conditions of the
					respective seller shall be applicable on the Customer. The Customer
					shall indemnify and hold Flipkart, Flipkart Advanz and/ or
					seller(s) harmless against all damages, liabilities, costs,
					expenses, claims, suits and proceedings (including reasonable
					attorneys fee) that may be suffered by Flipkart and/ or seller as a
					consequence of (i) violation of these terms and conditions, of the
					terms of user agreement, privacy policy (subject to change)
					published on the Platform, by Customer; (ii) violation of
					applicable laws by Customer; and (iii) any action or inaction
					resulting in willful misconduct or negligence on the part of the
					Customer. All government Levies like Sales Tax, TDS, any Local Tax,
					Octroi etc., shall be payable by the Customer as applicable at the
					time of the respective Offer. This Offer shall be subject to all
					applicable laws, rules and regulations which are in existence and
					which may be promulgated anytime by any statutory authority. Any
					dispute arising out of the offer shall be subject to the exclusive
					jurisdiction of courts of Bangalore, India. All liability with
					respect to the products purchased lies with the respective sellers
					and Flipkart Advanz shall not be in any way responsible for the
					same. This Offer is valid only in India. The minimum age of such a
					Customer shall be 18 years. This document is an electronic record
					in terms of Information Technology Act, 2000, and the Rules
					thereunder as applicable and the amended provisions pertaining to
					electronic records in various statutes as amended by the
					Information Technology Act, 2000. This electronic record is
					generated by a computer system and does not require any physical or
					digital signatures.<br> <br>
					<div class="container text-center">
						<button type="button" class="btn btn-secondary col-md-6"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- 	Terms and conditions modal end-->




	<%@include file="components/footer.jsp"%>
	<%@include file="components/common_modals.jsp"%>
</body>
</html>