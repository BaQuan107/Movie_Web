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
        <div id="page-loading">
            <i class="fas fa-spinner"></i>
            <p>Loading...</p>
        </div>
        <div id="page-heading">
            <!-- them onactive + bo container de thay doi size cua header -->
            <%@include file="../layout/header.jsp"%> 
        </div>
        <div id="page-movies-box">
            <div class="left-content">
                <form>
                    <button data-toggle="collapse" data-target="#LC-filter">Filter <i class="fas fa-dot-circle"></i></button>
                    <div id="LC-filter" class="collapse">
                        <input onchange="handleAjaxMain(this)" type="checkbox" name="isPaid" id="isPaid" value="on">
                        <label for="isPaid">Have owned</label>
                    </div>
                    <button data-toggle="collapse" data-target="#LC-sort">Sort By <i class="fas fa-dot-circle"></i></button>
                    <div id="LC-sort" class="collapse">
                        <select name="sort-select" id="sort-select" onchange="handleAjaxMain(this)">
                            <option value="nameUP">Name &#xf062;</option>
                            <option value="nameDown">Name &#xf063;</option>
                            <option value="priceUP">Price &#xf062;</option>
                            <option value="priceDown">Price &#xf063;</option>
                        </select>
                    </div>
                    <button data-toggle="collapse" data-target="#LC-choice-list">Type Of Film <i class="fas fa-dot-circle"></i></button>
                    <div id="LC-choice-list" class="collapse">
                        <c:forEach items="${requestScope.listGenre}" var="l">
                            <input onchange="handleAjaxMain(this)" type="checkbox" name="typeOfFilm" id="value${l.id}" value="${l.id}">
                            <label for="value${l.id}">${l.genre_name}</label><br/>
                            <hr>
                        </c:forEach>
                    </div>
                </form>
            </div>
            <div class="right-content">
                <div class="RC-search-header">
                    <form onsubmit="handleInputSubmit(this)">
                        <select name="RC-search-type">
                            <option value="All">All</option>
                            <option value="Name">Name</option>
                            <option value="Actor">Actor</option>
                            <option value="Director">Director</option>
                            <option value="Country">Country</option>
                            <option value="Price">Price</option>
                        </select>
                        <div class="RC-search_wrapper">
                            <input onkeydown="handleInputSubmit(event, this)" id ="somebutton" type="text" name="RC-ip-search" id="" placeholder="Find ...">
                        </div>
                    </form>
                </div>
                <div class="RC-search-content">
                    <div class="row">
                        <c:forEach items="${requestScope.listMovie}" var="m">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="movie-img-wrapper">
                                    <a href="movie-detail?id=${m.id}">
                                        <div>
                                            <img src="https://i.ytimg.com/vi/${m.src}/maxresdefault.jpg" alt="movie-img">
                                        </div>
                                    </a>
                                </div>
                                <div class="movie-description">
                                    <h6><a href="movie-detail?id=${m.id}">${m.name}</a></h6>
                                    <p>${m.realse_year}, ${m.country}, Action</p>
                                    <div class="description-star">
                                        <c:forEach begin="${1}" end="${5}" var="i">
                                            <c:if test="${i<=m.rating}">
                                                <i class="fas fa-star voted"></i>
                                            </c:if>
                                            <c:if test="${i>m.rating}">
                                                <i class="fas fa-star"></i>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="movie-price">
                                        <p>$${m.price}</p>
                                        <c:if test="${sessionScope.user_info.movieOwn.contains(m.id)}">
                                            <span class="movie-paid">PAID</span>
                                        </c:if>
                                        <c:if test="${!sessionScope.user_info.movieOwn.contains(m.id)}">
                                            <c:if test="${requestScope.listId!=null && requestScope.listId.contains(m.id)}">
                                                <span onclick="handleAjaxShopCart(this)" data-id="${m.id}">CANCEL CART</span>
                                            </c:if>
                                            <c:if test="${requestScope.listId==null || !requestScope.listId.contains(m.id)}">
                                                <span onclick="handleAjaxShopCart(this)" data-id="${m.id}">ADD TO CART</span>
                                            </c:if>
                                        </c:if>
                                    </div>
                                    <c:if test="${sessionScope.account.role==1}">
                                        <div class="movie-action">
                                            <span data-id="${m.id}" onclick="handleGetDataUpdate(this)"><i class="fas fa-edit"></i></span>
                                            <span data-id="${m.id}" onclick="handleGetDataDelete(this)"><i class="fas fa-trash-alt"></i></span>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="RC-pagination">
                    <c:if test="${requestScope.page!=1}">
                        <a href="movie?page=${requestScope.page-1}" data-index="0">&laquo;</a>
                    </c:if>
                    <c:forEach begin="${1}" end="${requestScope.num}" var="n">
                        <a class="${((n==requestScope.page)?'active':'')}" href="movie?page=${n}" data-index="${n}">${n}</a>
                    </c:forEach>
                    <c:if test="${requestScope.page!=requestScope.num}">
                        <a href="movie?page=${requestScope.page+1}" data-index="0">&raquo;</a>
                    </c:if>
                </div>
            </div>
        </div>
        <%@include file="../layout/footer.jsp"%> 
    </body>
    <script src="./js/script.js"></script>
    <script>
                                                handleAll();
                                                preventDefaultSubmit();
                                                window.addEventListener('load', (event) => {
                                                    let loading = document.getElementById('page-loading');
                                                    loading.style.display = 'none';
                                                });
    </script>
    <script src="./js/ajax.js"></script>
</html>