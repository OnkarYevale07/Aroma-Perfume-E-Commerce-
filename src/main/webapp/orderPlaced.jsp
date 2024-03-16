<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Placed</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
<div style="position: absolute; top:30%; left:50%;transform:translate(-50%,-50%);">
<div class="text-center"><img alt="Order Confirm Icon" src="img/okgif.gif" style="height: 20vh; width: 15vw;"></div>
<h1 class="text-center mt-5">Order Placed Successfully!!!</h1>
<script type="text/javascript">
function clearCart(){
	localStorage.removeItem('cart');
	console.log("Cart Removed Successfully!!!");
}
clearCart();

</script>
<h1 class="text-center mt-2"><a href="index.jsp"><button class="btn btn-warning">Continue Shopping</button></a></h1>
</div>
</body>
</html>