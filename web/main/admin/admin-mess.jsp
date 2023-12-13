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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="./css/all.css">
    </head>
    <body>
        <div id="page-heading">
            <!-- them onactive de thay doi size cua header -->
            <%@include file="../layout/header.jsp"%>
        </div>
        <div id="admin-wrapper">
            <%@include file="../layout/admin-sidebar.jsp" %>
            <div class="admin-main">
            <div class="main-cotainer">
                <div class="main-header">
                    <h1>Message</h1>
                    <ul>
                        <li class="breadcrumb-item"><a href="#">Admin</a></li>
                        <li class="breadcrumb-item active"><a href="#">Message</a></li>
                    </ul>
                </div>
                <div class="main-mess">
                    <div class="mess-left">
                        <div class="user-list">
                            <div class="user-item">
                                <div class="user-ava">
                                    <img src="./images/cho-long.jpg" alt="">
                                </div>
                                <div class="user-info">
                                    <span>Cho Long</span>
                                    <p>Ban: oki <span>13 phut</span></p>
                                </div>
                                <div class="check-watch">
                                    <span><i class="fas fa-check-circle"></i></span>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="mess-right">
                        <div class="MR-header">
                            <div class="account-mess">
                                <div class="account-ava">
                                    <a href="">
                                        <img src="./images/cho-long.jpg" alt="">
                                    </a>
                                </div>
                                <h4>Cho Long</h4>
                            </div>
                            <div class="control-mess">
                                <span class="info-mess"><i class="fas fa-info-circle"></i></span>
                            </div>
                        </div>
                        <div class="MR-content">
                            <div class="mess-list">
                                <div class="mess-item">
                                    <div class="mess-ava">
                                        <img src="./images/cho-long.jpg" alt="">
                                    </div>
                                    <p>đây bạn thử làm coi xem làm được nhiêu bài đây bạn thử làm coi xem làm được nhiêu bài</p>
                                    <div class="mess-react">
                                        <span><i class="fas fa-thumbs-up"></i></span>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="mess-send">
                            <div class="import-file">
                                <span><i class="fas fa-plus-circle"></i></span>
                            </div>
                            <div class="text-input">
                                <input type="text">
                            </div>
                            <div class="send-pos">
                                <svg width="20px" height="20px" viewBox="0 0 24 24" class="crt8y2ji"><path d="M16.6915026,12.4744748 L3.50612381,13.2599618 C3.19218622,13.2599618 3.03521743,13.4170592 3.03521743,13.5741566 L1.15159189,20.0151496 C0.8376543,20.8006365 0.99,21.89 1.77946707,22.52 C2.41,22.99 3.50612381,23.1 4.13399899,22.8429026 L21.714504,14.0454487 C22.6563168,13.5741566 23.1272231,12.6315722 22.9702544,11.6889879 C22.8132856,11.0605983 22.3423792,10.4322088 21.714504,10.118014 L4.13399899,1.16346272 C3.34915502,0.9 2.40734225,1.00636533 1.77946707,1.4776575 C0.994623095,2.10604706 0.8376543,3.0486314 1.15159189,3.99121575 L3.03521743,10.4322088 C3.03521743,10.5893061 3.34915502,10.7464035 3.50612381,10.7464035 L16.6915026,11.5318905 C16.6915026,11.5318905 17.1624089,11.5318905 17.1624089,12.0031827 C17.1624089,12.4744748 16.6915026,12.4744748 16.6915026,12.4744748 Z"></path></svg>
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
            handleAdmin();
        </script>
    </body>
</html>