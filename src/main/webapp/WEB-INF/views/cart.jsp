<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
    <title>Cart</title>
</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container padding-bottom-3x mb-1">
    <!-- Shopping Cart-->
    <c:choose>
        <c:when test="${not empty cart.cartItem}">
            <div class="table-responsive shopping-cart">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Product Name</th>
                        <th class="text-center">Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center"><a class="btn btn-sm btn-outline-danger" href="#">Clear Cart</a></th>
                    </tr>
                    </thead>

                    <c:forEach var="item" items="${cart.cartItem}">
                        <tr>
                            <td class="text-center text-lg text-medium"><h5>${item.productInfo.productName}</h5></td>
                            <td class="text-center text-lg text-medium"><h5>${item.quantity}</h5></td>
                            <td class="text-center text-lg text-medium"><h5>${item.productInfo.price*item.quantity}</h5>
                            </td>
                            <td class="text-center">—</td>
                            <td class="text-center"><a class="remove-from-cart"
                                                       href="delete?code=${item.productInfo.productCode}"><i
                                    class="fa fa-trash"></i></a></td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
            <div class="shopping-cart-footer">
                <div class="column text-lg"><span class="text-medium">Sub Total: ${cart.subTotal}</span></div>
                <div class="column text-lg"><span class="text-medium">Taxes: ${cart.taxes}</span></div>
                <div class="column text-lg"><span class="text-medium">Total: ${cart.totalPrice}</span></div>
            </div>
            <div class="shopping-cart-footer">
                <div class="column"><a class="btn btn-outline-secondary" href="index"><i class="icon-arrow-left"></i>&nbsp;Back
                    to Shopping</a></div>

                <div class="column"><a class="btn btn-success" href="/Restaurant_war_exploded/checkout">Checkout</a></div>
            </div>


        </c:when>
        <c:otherwise>
            There are no items in your cart
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>