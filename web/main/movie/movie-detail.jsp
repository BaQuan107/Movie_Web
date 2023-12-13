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
        <div id="page-movie-detail-box">
            <div class="container">
                <div class="MD-main">
                    <div class="MD__main-trailer">
                        <img src="https://i.ytimg.com/vi/${requestScope.movie.src}/maxresdefault.jpg" alt="">
                        <i class="fas fa-play-circle"></i>

                        <button type="button" class="" data-toggle="modal" data-target="#videoModal"><i
                                class="fas fa-play-circle"></i></button>

                        <c:if test="${sessionScope.user_info.movieOwn.contains(requestScope.movie.id)}">
                            <div id="videoModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
                                 aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <iframe src="https://www.youtube.com/embed/${requestScope.movie.src}">
                                        </iframe>
                                    </div>
                                </div>
                            </div> 
                        </c:if>
                        <c:if test="${!sessionScope.user_info.movieOwn.contains(requestScope.movie.id)}">
                            <div class="modal fade" id="videoModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Message</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <span>You haven't paid this film!</span>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class="MD__main-info">
                        <h1>${requestScope.movie.name}
                            <span>${requestScope.movie.price}$</span>
                        </h1>
                        <div class="info-rating">
                            <div class="IF-left">
                                <span class="IF-left-span">${requestScope.movie.length}min</span>
                                <span>Added: ${requestScope.movie.realse_year}</span>
                                <div class="view-like-wrapper">
                                    <div class="VL-view">
                                        <i class="fas fa-eye"></i>
                                        <span>${requestScope.movie.numberView}</span>
                                    </div>
                                    <!-- them liked de chuyen mau btn like -->
                                    <div class="VL-like">
                                        <!-- button dung before de chen icon ~ content dung unicode de hien icon like thay vi tag i-->
                                        <span>1+</span>
                                    </div>
                                </div>
                            </div>
                            <!-- rating -->
                            <div class="IF-right">
                                <div class="IF-right-wrapper">
                                    <c:forEach begin="${1}" end="${5}" var="i">
                                        <c:if test="${i<=requestScope.movie.rating}">
                                            <i class="fas fa-star voted"></i>
                                        </c:if>
                                        <c:if test="${i>requestScope.movie.rating}">
                                            <i class="fas fa-star"></i>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div class="IF-voted-quantity">
                                    <span>1 Voted</span>
                                </div>
                            </div> 
                        </div>
                        <div class="info-content">
                            <!-- them class show de hien het content -->
                            <div class="IC-left">
                                <div class="IC-left-wrapper">
                                    <p>
                                        <span>Director: <a href="#" >${requestScope.movie.director.fullName}</a></span> </br>
                                        <span>Main actor: 
                                            <c:forEach items="${requestScope.actorList}" var="a">
                                                <a href="#" >${a.fullName}</a>
                                                <c:if test="${a!=requestScope.actorList.get(requestScope.actorList.size()-1)}">
                                                    ,
                                                </c:if>
                                            </c:forEach>
                                        </span>
                                    </p>
                                    <p>${requestScope.movie.description}</p>
                                </div>
                                <!-- overflow:hiden, chi thay cai height voi set cai transition cho muot la dc-->
                                <span class="read-more">Read Mores</span>
                            </div>
                            <div class="IC-right">
                                <span>Tags: </span>
                                <c:forEach items="${requestScope.genreList}" var="g" >
                                    <a href="#">${g.genre_name}</a>
                                    <c:if test="${g!=requestScope.genreList.get(requestScope.genreList.size()-1)}">
                                        ,
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <c:if test="${sessionScope.user_info.movieOwn.contains(requestScope.movie.id)}">
                            <button class="btn btn_add-to-cart">
                                <span>PAID</span>
                                <i class="fas fa-check"></i>
                            </button>
                        </c:if>
                        <c:if test="${!sessionScope.user_info.movieOwn.contains(requestScope.movie.id)}">
                            <button class="btn btn_add-to-cart" onclick="handleAjaxShopCart(this)" data-id="${requestScope.movie.id}">
                                <i class="fas fa-shopping-cart"></i>
                                <span>${requestScope.listId.contains(requestScope.movie.id)?'CANCEL CART':'ADD TO CARD'}</span>
                            </button>
                        </c:if>
                    </div>
                    <div class="MD__main-comment">
                        <!-- onclick de hien cmt -->
                        <h1>Comment (<span>${requestScope.numOfCmt}</span>)</h1>

                        <div class="MDM-comment-wrapper">
                            <!-- hien dong cmt cua minh dau tien neu da login/ neu chua thi hien thong bao -->
                            <div class="myselft_cmt ${((sessionScope.account==null)?'':'show')}">
                                <p class="ms_mustbelog">You must be <a href="login">Logged in</a> to post a review.</p>
                                <div class="comment-item">
                                    <img src="./images/${sessionScope.user_info.avatar}" alt="avatar">
                                    <div class="comment-item-right">
                                        <input data-uiId="${sessionScope.user_info.id}" data-mId="${requestScope.movie.id}" onkeyup="handleAjaxAddCmt(event, this)" type="text" name="ms_cmt" placeholder="How do you feel about film...">
                                        <!-- ranh lam them cai btn binh luan + btn huy -->
                                    </div>
                                </div>
                            </div>
                            <!-- chua cac cmt -->
                            <div class="comment-list">
                                <div class="comment__item-wrapper">
                                    <c:forEach items="${requestScope.cmtList}" var="cm" >
                                        <div class="comment-item">
                                            <img src="./images/${cm.ui.avatar}" alt="">
                                            <div class="comment-item-right">
                                                <p>
                                                    <strong>${cm.ui.fullname}</strong>
                                                    <span>${cm.timeCmt}</span>
                                                </p>
                                                <p>${cm.cmt}</p>
                                                <div class="commnent-react">
                                                    <!-- to mau neu like -->
                                                    <i class="fas fa-thumbs-up"></i>
                                                    <span>1+</span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- load du lieu lay cmt tiep -->
                                <c:if test="${requestScope.numOfCmt > 2}">
                                    <span data-id="${requestScope.movie.id}" class="load-more" onclick="handleAjaxLoadCmt(this)">Read Mores</span>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="MD-other">
                    <h1>YOU MAY ALSO LIKE</h1>
                    <hr>
                    <div class="row">
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="movie-img-wrapper">
                                <a href="#">
                                    <div>
                                        <img src="./images/gallery-1.jpg" alt="movie-img">
                                    </div>
                                </a>
                            </div>
                            <div class="movie-description">
                                <h6><a href="#">Ant-Man and the Wasp</a></h6>
                                <p>2018, USA, Action</p>
                                <div class="description-star">
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="movie-price">
                                    <p>$29.00</p>
                                    <span>ADD TO CARD</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="movie-img-wrapper">
                                <a href="#">
                                    <div>
                                        <img src="./images/gallery-1.jpg" alt="movie-img">
                                    </div>
                                </a>
                            </div>
                            <div class="movie-description">
                                <h6><a href="#">Ant-Man and the Wasp</a></h6>
                                <p>2018, USA, Action</p>
                                <div class="description-star">
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="movie-price">
                                    <p>$29.00</p>
                                    <span>ADD TO CARD</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="movie-img-wrapper">
                                <a href="#">
                                    <div>
                                        <img src="./images/gallery-1.jpg" alt="movie-img">
                                    </div>
                                </a>
                            </div>
                            <div class="movie-description">
                                <h6><a href="#">Ant-Man and the Wasp</a></h6>
                                <p>2018, USA, Action</p>
                                <div class="description-star">
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="movie-price">
                                    <p>$29.00</p>
                                    <span>ADD TO CARD</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="movie-img-wrapper">
                                <a href="#">
                                    <div>
                                        <img src="./images/gallery-1.jpg" alt="movie-img">
                                    </div>
                                </a>
                            </div>
                            <div class="movie-description">
                                <h6><a href="#">Ant-Man and the Wasp</a></h6>
                                <p>2018, USA, Action</p>
                                <div class="description-star">
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="movie-price">
                                    <p>$29.00</p>
                                    <span>ADD TO CARD</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../layout/footer.jsp"%> 
        <script src="./js/script.js"></script>
        <script>
                                        handleAll();
                                        handleMovieDetail();
        </script>
        <script src="./js/ajax.js"></script>
    </body>
</html>