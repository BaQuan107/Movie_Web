<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    </head>
    <body>
        <div id="page-heading">
            <!-- them onactive de thay doi size cua header -->
            <%@include file="../layout/header.jsp"%> 
        </div>
        <div id="page-shop-card-box">
            <div class="container">
                <h2>Shopping Card</h2>
                <div class="shopping-card-list">
                    <div class="card-mess"></div>
                    <div class="SCL-heading">
                        <div class="markAll-wrapper">
                            <input type="checkbox" id="markAll" onclick="handleCheckAll(this)" checked>
                            <label for="markAll">Choose All</label>
                        </div>
                        <input onkeyup="handldeSearchCart(this)" type="text" name="card-find-film" id="">
                        <p><span>3 items</span> in Card</p>
                    </div>
                    <c:forEach items="${requestScope.cartList}" var="c">
                        <div class="shopping-card-item">
                            <input data-id="${c.movie.id}" onclick="handleCheckItem(this)" type="checkbox" name="item-index" checked>
                            <a href="movie-detail?id=${c.movie.id}">
                                <img src="https://i.ytimg.com/vi/${c.movie.src}/maxresdefault.jpg" alt="movie-img">
                            </a>
                            <div class="card-film-info">
                                <h3><a href="movie-detail?id=${c.movie.id}">${c.movie.name}</a></h3>
                                <p class="card-director">${c.movie.director.fullName}</p>                      
                            </div>
                            <div class="card__film-created">
                                <h3>Created At:</h3>
                                <p>${c.createdAt}</p>
                            </div>
                            <div class="price-delete-wrapper">
                                <p>$${c.movie.price}</p>
                                <span class="trash_delete-cart" onclick="handleAjaxShopCart(this)" data-id="${c.movie.id}"><i class="fas fa-trash"></i></span>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="shopping-card-total">
                    <p>Toltal: <span>$29.00</span></p>
                </div>
                <div class="btn-nav">
                    <a href="movie">CONTINUE SHOPPING</a>
                    <button type="button" class="btn btn-primary checkout" data-toggle="modal" data-target="#checkoutModal">
                        CHECK OUT
                    </button>

                    <div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- <span>Buy Successfully!</span> -->
                                    <!-- <span>Not enough money!</span> -->
                                    <span>Do you really want to checkout?</span>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="checkout-btn" type="button" class="btn btn-primary">Yes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../layout/footer.jsp"%> 
        <script src="./js/script.js"></script>
        <script src="./js/ajax.js"></script>
        <script>
                                    handleAll();
                                    handleMoneys();
                                    handleCountItem();
                                    handleCheckout();
        </script>

    </body>
</html>