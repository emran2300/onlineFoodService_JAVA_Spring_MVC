<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Food Order Place</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        @media (min-width: 1025px) {
            .h-custom {
                height: 100vh !important;
            }
        }
    </style>
<body>
<jsp:include page="header.jsp"/>


<section class="h-100 h-custom" style="background-color: #8fc4b7;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-8 col-xl-6">
                <div class="card rounded-3">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img3.webp" class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;" alt="Sample photo">
                    <div class="card-body p-4 p-md-5">
                        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Registration Info</h3>

                        <form:form class="px-md-2" modelAttribute="newFood" action="addOnDb" method="POST" >

                            <div class="form-outline mb-4">
                                <form:input path="productName" type="text" id="form3Example1q" class="form-control" />
                                <label class="form-label" for="form3Example1q">Name</label>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-4">

                                    <div class="form-outline datepicker">
                                        <form:input
                                                path="price"
                                                type="text"
                                                class="form-control"
                                                id="exampleDatepicker1"
                                                pattern="[0-9]*"
                                        />
                                        <label for="exampleDatepicker1" class="form-label">Price</label>
                                    </div>

                                </div>
                                <div class="col-md-6 mb-4">

                                    <form:select path="categoryId" class="select">
                                        <option value="1" disabled>Category</option>
                                        <c:forEach var="category" items="${categoryList}">
                                            <option value="${category.categoryId}">${category.categoryName}</option>
                                        </c:forEach>

                                    </form:select>

                                </div>
                            </div>

                            <div class="row mb-4 pb-2 pb-md-0 mb-md-5">
                                <div class="form-group">
                                    <form:textarea path="description" class="form-control" id="exampleFormControlTextarea1" rows="3"></form:textarea>
                                    <label for="exampleFormControlTextarea1">Description</label>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-success btn-lg mb-1">Add</button>
                            <button type="reset" class="btn btn-success btn-lg mb-1" value="Reset">Clear</button>

                        </form:form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
