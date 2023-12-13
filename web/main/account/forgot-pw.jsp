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
    </head>
    <body>
        <div id="form-content">
            <div class="form-background">
                <img src="./images/unnamed.jpg" alt="bg">
            </div>
            <div class="logo-wrapper">
                <a href="./index.jsp" class="fixed-logo">
                    <img src="./images/logo-default.png" alt="logo-img">
                </a>
            </div>
            <div class="form-wrapper mx-auto">
                <form action="signup" method="post">
                    <h1>Forgot Password</h1>
                    <c:if test="${requestScope.mess==null}">
                        <div class="form-group">
                            <div class="form-control-wrapper">
                                <input type="text" name="username" class="form-control" id="username" value="">
                                <label for="username">User Name</label>
                            </div>
                            <span class="form-message input_un">${requestScope.errorU}</span>
                        </div>
                    </c:if>
                    <c:if test="${requestScope.mess!=null}">
                        <div class="form-group">
                            <div class="form-control-wrapper">
                                <input data-un="${requestScope.mess}" type="text" name="code" class="form-control" id="code" value="">
                                <label for="code">Receipt Code</label>
                            </div>
                            <span class="form-message input_un">${requestScope.errorC}</span>
                        </div>
                        <div class="form-group">
                            <div class="form-control-wrapper">
                                <input type="password" name="password" class="form-control" id="password"  value="">
                                <label for="password">Password</label>
                            </div>
                            <span class="form-message input_pw">${requestScope.errorP}</span>
                        </div>
                        <div class="form-group">
                            <div class="form-control-wrapper">
                                <input type="password" name="password_confirmation" class="form-control" id="password_confirmation" value="">
                                <label for="password_confirmation">Confirm Password</label>
                            </div>
                            <span class="form-message re_password">${requestScope.errorRP}</span>
                        </div>
                    </c:if>
                    <button class="form-submit">Submit</button>
                    <div class="other-wrapper d-flex justify-content-between">
                        <label class="keep-login" for="agree-policy">
                            Confirm captcha.
                            <input type="checkbox" name="agree-policy" id="agree-policy">
                            <span class="checkmark"></span>
                            <p class="agree-error"></p>
                        </label>
                        <a href="#">Help</a>
                    </div>
                </form>
                <div class="link-to-rest">
                    Already a Member?
                    <a href="login">Go to login</a>
                </div>
            </div>
        </div>
        <%@include file="../layout/footer.jsp"%> 
        <script src="./js/script.js"></script>
        <script>
            handleForgotPw();
        </script>
    </body>
</html>