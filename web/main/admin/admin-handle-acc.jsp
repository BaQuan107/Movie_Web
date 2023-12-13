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
        <div id="admin-wrapper">
            <%@include file="../layout/admin-sidebar.jsp" %>
            <div class="admin-main">
                <div class="main-cotainer">
                    <div class="main-header">
                        <h1>Block account</h1>
                        <ul>
                            <li class="breadcrumb-item"><a href="#">Admin</a></li>
                            <li class="breadcrumb-item active"><a href="#">Block account</a></li>
                        </ul>
                    </div>
                    <div class="main-form">
                        <div class="search-wrapper">
                            <select class="custom-select custom__own-select custom-label-ip" id="inputGroupSelect01" onchange="handleAjaxSearchAcc(this)">
                                <option value="All" selected>All</option>
                                <option value="Block">Block</option>
                                <option value="Unblock">Unblock</option>
                            </select>
                            <input class="form-control custom-label-ip custom-search" id="search-info" type="text"
                                   placeholder="Search.." onkeyup="handleAjaxSearchAcc(this)">
                        </div>
                        <div class="result_acc-wrapper">
                            <table class="table table-striped table-hover custom-label-ip">
                                <thead class="">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">FullName</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Birth</th>
                                        <th scope="col">Acc Money</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody class="customm-tableBody">
                                    
                                </tbody>
                            </table>

                            <nav id="pagination" aria-label="Page navigation">
                                <ul class="pagination custom-nav">
                                    
                                </ul>
                            </nav>
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