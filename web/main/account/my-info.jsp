<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="./js/ajax.js"></script>
    </head>
    <body>
        <!-- appear when some page is load -->
<!--        <div id="page-loading">
            <i class="fas fa-spinner"></i>
            <p>Loading...</p>
        </div>-->
        <div id="page-heading">
            <!-- them onactive + bo container de thay doi size cua header -->
            <%@include file="../layout/header.jsp"%> 
        </div>
        <div id="page-my-info-change-password-box">
            <div class="container">
                <h2>Your Information</h2>
                <div class="form-wrapper">
                    <form id="form-submit" action="my-info" method="post"  enctype="multipart/form-data">
                        <div class="PMI-wrapper">
                            <img src="${sessionScope.user_info.avatar}" onerror="this.onerror = null;this.src = './images/avatar.jpg';console.clear()" alt="avatar">
                            <label for="avatar">
                                <div class="change-avatar">
                                    <i class="fas fa-camera"></i>
                                </div>
                                <input type="file" name="avatar" id="avatar">
                            </label>
                        </div>
                        <div class="PMI-wrapper">
                            <label for="fullname">Full Name</label>
                            <input type="text" name="fullname" value="${sessionScope.user_info.fullname}" id="fullname">
                        </div>
                        <div class="PMI-wrapper">
                            <label for="email">Email</label>
                            <input type="text" name="email" value="${sessionScope.user_info.email}" id="email">
                        </div>
                        <div class="PMI-wrapper">
                            <label for="phone">Phone Number</label>
                            <input type="text" name="phone" value="${sessionScope.user_info.phone}" id="phone">
                        </div>
                        <div class="PMI-wrapper">
                            <label for="male">Male</label>
                            <input type="radio" name="gender" value="1" id="male" ${((sessionScope.user_info.gender==true)?'checked':'')}/> 
                            &nbsp; &nbsp; &nbsp;
                            <label for="female">Female</label>
                            <input type="radio" name="gender" value="0" id="female" ${((sessionScope.user_info.gender==false)?'checked':'')}/>
                        </div>
                        <div class="PMI-wrapper">
                            <label for="birthday">Birthday</label>
                            <input type="date" name="birthday" value="${sessionScope.user_info.birth}" id="birthday" >
                        </div>
                        <div class="PMI-wrapper">
                            <div class="money-wrapper">
                                <label for="money">Account Money</label>
                                <a href="#">Earn more money</a>
                            </div>
                            <input type="text" name="money" value="$${sessionScope.user_info.acc_money}" id="money" readonly>
                        </div>
                        <input type="submit" value="Update" >
                    </form>
                </div>
            </div>
        </div>
        <%@include file="../layout/footer.jsp"%> 
        <script src="./js/script.js"></script>
        <script>
            handleAll();
            handleMyInfo();
        </script>
    </body>
</html>