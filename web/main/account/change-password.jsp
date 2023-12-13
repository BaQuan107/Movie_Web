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
</head>
<body>
    <div id="page-heading">
        <!-- them onactive + bo container de thay doi size cua header -->
        <%@include file="../layout/header.jsp"%>
    </div>
    
    <div id="page-my-info-change-password-box">
        
        <div class="container">
            <h2>Change password</h2>
            <div class="form-wrapper">
                <div class="error__mess-wrapper">
                    <span>${requestScope.mess}</span>
                    <i class="fas fa-times" onclick="document.querySelector('.error__mess-wrapper').style.display = 'none';"></i>
                </div>
                <form action="change-password" method="post">
                    <div class="PMI-wrapper">
                        <label for="oldPassword">Old Password</label>
                        <input type="password" name="oldPassword" value="" id="oldPassword" required>
                    </div>
                    <div class="PMI-wrapper">
                        <label for="newPassword">New Password</label>
                        <input type="password" name="newPassword" value="" id="newPassword" required>
                    </div>
                    <div class="PMI-wrapper">
                        <label for="cfNewPassword">Confirm New Password</label>
                        <input type="password" name="cfNewPassword" value="" id="cfNewPassword" required>
                    </div>
                    <input type="submit" value="Save">
                </form>
            </div>
        </div>
    </div>
    <%@include file="../layout/footer.jsp"%> 
    <script src="./js/script.js"></script>
    <script>
        handleAll();
        handleChangePassword();
    </script>
</body>
</html>