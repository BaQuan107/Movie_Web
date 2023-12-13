<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <body>
        <nav class="navbar navbar-expand-sm navbar-dark onactive">
            <a class="navbar-brand" href="index.jsp">
                <img src="./images/logo-default.png" alt="Logo" style="width:164px; height: 47px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">

                <ul class="navbar-nav ml-auto d-flex justify-content-between nav-width" id="collapsibleNavbar">
                    <div class="const-component-wrapper d-flex">
                        <li class="nav-item active">
                            <a class="nav-link ${(!!pageContext.request.requestURI.startsWith('/Movie_Web/index.jsp') || !!pageContext.request.requestURI.equals('/Movie_Web/'))?'active':''}" href="./index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${(!!pageContext.request.requestURI.startsWith('/Movie_Web/main/movie'))?'active':''}" href="movie">Movies</a>
                        </li>
                        <li class="nav-item ${(!!pageContext.request.requestURI.startsWith('/Movie_Web/about-us'))?'active':''}">
                            <a class="nav-link" href="#">About us</a>
                        </li>
                        <!-- them not-admin de an link nay -->
                        <li class="nav-item ${((sessionScope.account.role!=1)?'not-admin':'')}">
                            <a class="nav-link ${(!!pageContext.request.requestURI.startsWith('/Movie_Web/main/admin'))?'active':''}" href="admin-dashboard">Admin Manager</a>
                        </li>
                    </div>
                        <!--<h1>${pageContext.request.requestURI}</h1>-->
                    <c:if test="${(sessionScope.account==null)}">
                        <div class="connecting-to-web d-flex"> 
                            <li class="nav-item">
                                <a class="nav-link" href="login">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="signup">Sign up</a>
                            </li>
                        </div>
                    </c:if>
                    <c:if test="${(sessionScope.account!=null)}">
                        <div class="connected-to-web d-flex">
                            <div class="shopping-card-wrapper">
                                <!-- them class onclick de hien demo-card-film -->
                                <span class="shoping-card-title">Shopping Card</span>
                                <div class="demo-card-film">
                                    <div class="MyCard-header d-flex">
                                        <h6>Shopping Card</h6>
                                        <a href="shop-cart">View all card</a>
                                    </div>
                                    <div class="MyCard-content">
                                        
                                    </div>
                                </div>
                            </div>
                            <!-- add class onclick to appear avatar-down-->
                            <div class="avatar-wrapper">
                                <img src="${sessionScope.user_info.avatar}" onerror="this.onerror = null;this.src = './images/avatar.jpg';console.clear()" alt="avatar">
                                <div class="avatar-down">
                                    <div class="avatar__down-header">
                                        <img src="${sessionScope.user_info.avatar}" onerror="this.onerror = null;this.src = './images/avatar.jpg';console.clear()" alt="avatar">
                                        <div class="name__money-wrapper">
                                            <p>${sessionScope.user_info.fullname}</p>
                                            <span>${sessionScope.user_info.acc_money}</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="avatar__down-info">
                                        <a href="my-info">Your Info</a>
                                    </div>
                                    <hr>
                                    <div class="avatar__down-change-password">
                                        <a href="change-password">Change password</a>
                                    </div>
                                    <hr>
                                    <div class="avatar__down-setting">
                                        <a href="#">Setting</a>
                                    </div>
                                    <hr>
                                    <div class="avatar__down-singout">
                                        <a href="signout">Sign out</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </ul>
            </div>
        </nav>
    </body>
    <script src="./js/ajax.js"></script>
    <script>handleAjaxLoadMovieToHeader()</script>
</html>
