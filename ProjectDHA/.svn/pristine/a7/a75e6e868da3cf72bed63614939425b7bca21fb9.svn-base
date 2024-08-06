<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    .cart-container {
        margin: 20px auto;
        width: 80%;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }
    .cart-header {
        background-color: #333;
        color: #fff;
        padding: 20px;
        text-align: center;
        border-bottom: 1px solid #666;
    }
    .cart-items {
        padding: 20px;
    }
    .cart-item {
        border-bottom: 1px solid #ddd;
        padding: 15px 0;
        display: flex;
        align-items: center;
    }
    .product-image {
        flex: 0 0 100px;
        margin-right: 20px;
    }
    .product-image img {
        max-width: 100%;
        height: auto;
        border-radius: 5px;
    }
    .product-details {
        flex: 1;
    }
    .product-name {
        font-weight: bold;
        margin-bottom: 5px;
    }
    .product-price {
        font-weight: bold;
    }
    .product-quantity {
        display: flex;
        align-items: center;
    }
    .quantity-label {
        margin-right: 10px;
    }
    .quantity-buttons {
        display: flex;
        align-items: center;
    }
    .quantity-button {
        background-color: #f44336;
        color: #fff;
        border: none;
        padding: 5px;
        border-radius: 50%;
        cursor: pointer;
        margin: 0 5px;
    }
    .quantity-button:hover {
        background-color: #d32f2f;
    }
    .total {
        background-color: #f5f5f5;
        padding: 20px;
        border-top: 1px solid #ddd;
        text-align: right;
        font-weight: bold;
    }
    .total span {
        color: #f44336;
    }
    .back-to-products {
        text-align: center;
        margin-top: 20px;
    }
    .back-to-products button {
        background-color: #4caf50;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    .back-to-products button:hover {
        background-color: #388e3c;
    }
</style>
</head>
<body>
<div class="cart-container">
    <div class="cart-header">
        장바구니
    </div>
    <div class="cart-items">
        <div class="cart-item">
            <div class="product-image">
                <img src="product1.jpg" alt="Product Image">
            </div>
            <div class="product-details">
                <div class="product-name">상품명</div>
                <div class="product-quantity">
                    <span class="quantity-label">수량:</span>
                    <div class="quantity-buttons">
                        <button class="quantity-button" onclick="decreaseQuantity(this)">-</button>
                        <span class="quantity-number">1</span>
                        <button class="quantity-button" onclick="increaseQuantity(this)">+</button>
                    </div>
                </div>
                <div class="product-price">가격: 10,000원</div>
            </div>
            <div class="product-actions">
                <button onclick="removeItem(this)">삭제</button>
            </div>
        </div>
        <!-- 다른 상품들을 추가할 수 있습니다. -->
    </div>
    <div class="total">
        총합: <span id="total-price">10,000</span>원
    </div>
</div>
<div class="back-to-products">
    <button onclick="goToProductPage()">상품 페이지로 돌아가기</button>
</div>

<script>
    function removeItem(button) {
        // 여기에 상품 삭제 기능을 구현하세요.
        button.closest('.cart-item').remove();
        updateTotalPrice();
    }

    function increaseQuantity(button) {
        var quantityElement = button.parentElement.querySelector('.quantity-number');
        var quantity = parseInt(quantityElement.textContent);
        quantityElement.textContent = quantity + 1;
        updateTotalPrice();
    }

    function decreaseQuantity(button) {
        var quantityElement = button.parentElement.querySelector('.quantity-number');
        var quantity = parseInt(quantityElement.textContent);
        if (quantity > 1) {
            quantityElement.textContent = quantity - 1;
            updateTotalPrice();
        }
    }

    function updateTotalPrice() {
        // 여기에 총 가격을 업데이트하는 기능을 구현하세요.
        // 예를 들어, 모든 상품의 가격을 합산하여 총 가격을 업데이트할 수 있습니다.
        var totalPrice = 0;
        var productPrices = document.querySelectorAll('.product-price');
        var quantityNumbers = document.querySelectorAll('.quantity-number');
        productPrices.forEach(function(productPrice, index) {
            var price = parseInt(productPrice.textContent.replace('가격: ', '').replace('원', '').replace(',', ''));
            var quantity = parseInt(quantityNumbers[index].textContent);
            totalPrice += price * quantity;
        });
        document.getElementById('total-price').textContent = totalPrice.toLocaleString();
    }

    function goToProductPage() {
        // 여기에 상품 페이지로 돌아가는 동작을 구현하세요.
        alert("상품 페이지로 돌아갑니다.");
    }

    // 페이지 로드 시 총 가격 업데이트
    window.onload = function() {
        updateTotalPrice();
    };
</script>
</body>
</html>

