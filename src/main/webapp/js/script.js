/*alert("Testing");*/
// add item into cart
function add_to_cart(pid, pname, price) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		// no cart yet
		let products = [];
		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		/*console.log("Product is added for the first time");*/
		showToast("Item is added to cart");
	} else {
		// cart is already present
		let pcart = JSON.parse(cart);
		let oldProduct = pcart.find((item) => item.productId == pid);
		if (oldProduct) {
			// we have to increase the quantity
			oldProduct.productQuantity = oldProduct.productQuantity + 1;
			pcart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product quantity is increased");
			showToast(oldProduct.productName + " quantity is increased , Quantity = " + oldProduct.productQuantity);
		} else {
			// we have to add the product
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product is added");
			showToast("Product is added to cart");

		}
	}
	updateCart();
}

// Update cart
function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		console.log("Cart is empty !!")
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>Cart does not have any items </h3>");
		$(".checkout-btn").addClass('disabled');
	} else {
		// there is some in cart to show
		console.log(cart);
		$(".cart-items").html(`(${cart.length})`);
		let table = `
		<table class='table'>
		<thead class='thead-light'>
		<tr>
		<th>Item Name</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Total Price</th>
		<th>Action</th>
		</tr>
		</thead>		
		`;
		let totalPrice = 0;
		cart.map((item) => {
			if(item.productQuantity >0){
			table += `<tr>
			<td>${item.productName}</td>
			<td>${item.productPrice}</td>
			<td><button onclick='decreaseQuantity(${item.productId})' class="btn btn-outline-secondary btn-sm text-dark"><i class="fa-solid fa-minus"></i></button>&nbsp;&nbsp;&nbsp; ${item.productQuantity}&nbsp;&nbsp;&nbsp; <button onclick='add_to_cart(${item.productId})' class="btn btn-outline-secondary btn-sm text-dark"><i class="fa-solid fa-plus"></i></button></td>
			<td>${item.productQuantity * item.productPrice}</td>
			<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
			</tr>`

			totalPrice += item.productPrice * item.productQuantity;
							
			}
		})



		table = table + `
		<tr><td colspan='5' class='text-end fw-bold m-5'> Total Price : ${totalPrice}</td></tr>
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").removeClass("disabled");

	}
}
// delete item from cart
function deleteItemFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newCart = cart.filter((item) => item.productId != pid);
	localStorage.setItem('cart', JSON.stringify(newCart));
	updateCart();
	showToast("Item is removed from cart");
}
$(document).ready(function() {
	updateCart();
})


/*toast*/
function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 2000);
}
/*toast*/



function goToCheckout() {
	window.location = "checkout.jsp";
}
function decreaseQuantity(pid) {
	let cart = localStorage.getItem("cart");
	let pcart = JSON.parse(cart);
	let oldProduct = pcart.find((item) => item.productId == pid);
	if (oldProduct) {
		// we have to increase the quantity
		if(oldProduct.productQuantity <= 0){
			deleteItemFromCart(pid);
			updateCart();
		}else{
			oldProduct.productQuantity = oldProduct.productQuantity - 1;
			updateCart();
		pcart.map((item) => {
			if (item.productId === oldProduct.productId) {
				item.productQuantity = oldProduct.productQuantity;
			}
		})}
		localStorage.setItem("cart", JSON.stringify(pcart));
		console.log("Product quantity is decreased");
		showToast(oldProduct.productName + " quantity is decreased , Quantity = " + oldProduct.productQuantity);
		updateCart();
	}
	
		updateCart();
}

/*Redirecting links*/
function viewCategories(){
	window.location = "categories.jsp";
}
function viewUsers(){
	window.location = "users.jsp";
}
function viewProducts(){
	window.location = "products.jsp";
}
function viewProduct(pId){
	window.location = "view_product.jsp?pid="+pId;
}
/*Redirecting links*/
