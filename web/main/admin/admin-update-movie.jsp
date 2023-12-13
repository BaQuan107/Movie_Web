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
                        <h1>Add movie</h1>
                        <ul>
                            <li class="breadcrumb-item"><a href="#">Admin</a></li>
                            <li class="breadcrumb-item active"><a href="#">Add movies</a></li>
                        </ul>
                    </div>
                    <div class="main-form">
                        <c:set var="m" value="${requestScope.movie}" />
                        <form>
                            <div class="form-group row">
                                <label for="inputName3" class="col-sm-2 col-form-label custom-label-ip">Movie Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control custom-label-ip" id="inputName3"
                                           placeholder="Name..." name="name" value="${m.name}" data-id="${m.id}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputRealseYear3" class="col-sm-2 col-form-label custom-label-ip">Realse
                                    Year</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control custom-label-ip" id="inputRealseYear3"
                                           placeholder="Realse Year..." name="RealseYear" value="${m.realse_year}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputLength3" class="col-sm-2 col-form-label custom-label-ip">Length</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control custom-label-ip" id="inputLength3"
                                           placeholder="Length..." name="Length" value="${m.length}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputCountry3" class="col-sm-2 col-form-label custom-label-ip">Country</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control custom-label-ip" id="inputCountry3"
                                           placeholder="Country..." name="Country" value="${m.country}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputRating3" class="col-sm-2 col-form-label custom-label-ip">Rating</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control custom-label-ip" id="inputRating3"
                                           placeholder="Rating..." name="Rating" value="${m.rating}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPrice3" class="col-sm-2 col-form-label custom-label-ip">Price</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control custom-label-ip" id="inputPrice3"
                                           placeholder="Price..." name="Price" value="${m.price}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputSrc3" class="col-sm-2 col-form-label custom-label-ip">Src</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control custom-label-ip" id="inputSrc3"
                                           placeholder="Src..." name="Src" value="${m.src}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputDescription3"
                                       class="col-sm-2 col-form-label custom-label-ip">Description</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control custom-label-ip" id="inputDescription3"
                                           placeholder="Description..." name="Description" value="${m.description}">
                                </div>
                            </div>
                            <div id="director-data" class="form-group row">
                                <label for="" class="col-sm-2 col-form-label custom-label-ip">Director</label>
                                <div class="col-sm-10">
                                    <div class="form-check form-check-inline">
                                        <input data-type="add-new" class="form-check-input custom-label-ip" type="radio" name="director-action"
                                               id="inlineRadio1" value="add-new">
                                        <label class="form-check-label custom-label-ip" for="inlineRadio1">Add new</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input data-type="choose-exist" class="form-check-input custom-label-ip" type="radio" name="director-action"
                                               id="inlineRadio2" value="choose-exist">
                                        <label class="form-check-label custom-label-ip" for="inlineRadio2">Add exist
                                            person</label>
                                    </div>

                                    <div class="result-wrapper">
                                        <div
                                            class="alert alert-warning alert-dismissible fade show custom-label-ip mt-3 result-item"
                                            role="alert">
                                            <div class="Result-infoWraper">
                                                <p>${m.director.id}</p>
                                                <p>${m.director.fullName}</p>
                                                <p>${m.director.birth}</p>
                                                <p>${m.director.nationality}</p>
                                            </div>
                                            <button type="button" class="close custom-close" data-dismiss="alert"
                                                    aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="Choose-Ewrapper">

                                        <input class="form-control custom-label-ip custom-search" id="search-info"
                                               type="text" placeholder="Search.." onkeyup="handleAjaxSearchDirector(this)">

                                        <div class="custom-tableWrapper">
                                            <table id="Choose-existed"
                                                   class="table table-striped table-hover custom-label-ip">
                                                <thead class="">
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">FullName</th>
                                                        <th scope="col">Birth</th>
                                                        <th scope="col">Country</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="customm-tableBody">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="Add-Nwrapper row">
                                        <div id="add-New" class="col-md-9 form-row">
                                            <div class="col-md-4 mb-3">
                                                <label for="validationCustom01" class="custom-label-ip">Full Name</label>
                                                <input type="text" class="form-control custom-label-ip"
                                                       id="validationCustom01" name="NFullName" placeholder="Full Name"
                                                       value="">
                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label for="validationCustom02" class="custom-label-ip">Birth</label>
                                                <input type="date" class="form-control custom-label-ip"
                                                       id="validationCustom02" name="NBirth" placeholder="Birth" value="">
                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label for="validationCustom03" class="custom-label-ip">Country</label>
                                                <input type="text" class="form-control custom-label-ip"
                                                       id="validationCustom03" name="NCountry" placeholder="Country" value="">
                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="col-md-3 btn btn-outline-primary custom-btn-addN" onclick="handleAdd(this, 'director')">Add
                                            new</button>
                                    </div>

                                </div>
                            </div>
                            <div id="actor-data" class="form-group row">
                                <label for="" class="col-sm-2 col-form-label custom-label-ip">Actor</label>
                                <div class="col-sm-10">
                                    <div class="form-check form-check-inline">
                                        <input data-type="add-new" class="form-check-input custom-label-ip" type="radio" name="actor-action"
                                               id="inlineRadio3" value="add-new">
                                        <label class="form-check-label custom-label-ip" for="inlineRadio3">Add new</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input data-type="choose-exist" class="form-check-input custom-label-ip" type="radio" name="actor-action"
                                               id="inlineRadio4" value="choose-exist">
                                        <label class="form-check-label custom-label-ip" for="inlineRadio4">Add exist
                                            person</label>
                                    </div>

                                    <div class="result-wrapper">
                                        <c:forEach items="${m.actorL}" var="a">
                                            <div
                                                class="alert alert-warning alert-dismissible fade show custom-label-ip mt-3 result-item"
                                                role="alert">
                                                <div class="Result-infoWraper">
                                                    <p>${a.id}</p>
                                                    <p>${a.fullName}</p>
                                                    <p>${a.birth}</p>
                                                    <p>${a.nationality}</p>
                                                </div>
                                                <button type="button" class="close custom-close" data-dismiss="alert"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <div class="Choose-Ewrapper">
                                        <input class="form-control custom-label-ip custom-search" id="search-info"
                                               type="text" placeholder="Search.." onkeyup="handleAjaxSearchActor(this)">

                                        <div class="custom-tableWrapper">
                                            <table id="Choose-existed"
                                                   class="table table-striped table-hover custom-label-ip">
                                                <thead class="">
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">FullName</th>
                                                        <th scope="col">Birth</th>
                                                        <th scope="col">Country</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="customm-tableBody">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="Add-Nwrapper row">
                                        <div id="add-New" class="col-md-9 form-row">
                                            <div class="col-md-4 mb-3">
                                                <label for="validationCustom01" class="custom-label-ip">Full Name</label>
                                                <input type="text" class="form-control custom-label-ip"
                                                       id="validationCustom01" name="NFullName" placeholder="Full Name"
                                                       value="">
                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label for="validationCustom02" class="custom-label-ip">Birth</label>
                                                <input type="date" class="form-control custom-label-ip"
                                                       id="validationCustom02" name="NBirth" placeholder="Birth" value="">
                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label for="validationCustom03" class="custom-label-ip">Country</label>
                                                <input type="text" class="form-control custom-label-ip"
                                                       id="validationCustom03" name="NCountry" placeholder="Country" value="">
                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="col-md-3 btn btn-outline-primary custom-btn-addN" onclick="handleAdd(this, 'actor')">Add
                                            new</button>
                                    </div>

                                </div>
                            </div>
                            <div id="genre-data" class="form-group row">
                                <label for="" class="col-sm-2 col-form-label custom-label-ip">Genre</label>
                                <div class="col-sm-10">
                                    <div class="form-check form-check-inline">
                                        <input data-type="add-new" class="form-check-input custom-label-ip" type="radio" name="genre-action"
                                               id="inlineRadio5" value="add-new">
                                        <label class="form-check-label custom-label-ip" for="inlineRadio5">Add new</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input data-type="choose-exist" class="form-check-input custom-label-ip" type="radio" name="genre-action"
                                               id="inlineRadio6" value="choose-exist">
                                        <label class="form-check-label custom-label-ip" for="inlineRadio6">Add exist
                                            genre</label>
                                    </div>

                                    <div class="result-wrapper">
                                        <c:forEach items="${m.genreL}" var="g">
                                            <div
                                                class="alert alert-warning alert-dismissible fade show custom-label-ip mt-3 result-item"
                                                role="alert">
                                                <div class="Result-infoWraper">
                                                    <p>${g.id}</p>
                                                    <p>${g.genre_name}</p>
                                                </div>
                                                <button type="button" class="close custom-close" data-dismiss="alert"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <div class="Choose-Ewrapper">
                                        <input class="form-control custom-label-ip custom-search" id="search-info"
                                               type="text" placeholder="Search.." onkeyup="handleAjaxSearchGenre(this)">

                                        <div class="custom-tableWrapper">
                                            <table id="Choose-existed"
                                                   class="table table-striped table-hover custom-label-ip">
                                                <thead class="">
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Genre Name</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="customm-tableBody">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="Add-Nwrapper row">
                                        <div id="add-New" class="col-md-3 form-row">
                                            <div class="col-md-12 mb-3">
                                                <label for="validationCustom07" class="custom-label-ip">Genre Name</label>
                                                <input type="text" class="form-control custom-label-ip"
                                                       id="validationCustom07" name="NGenreName" placeholder="Genre Name"
                                                       value="">
                                                <div class="valid-feedback">
                                                    Looks good!
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="col-md-3 btn btn-outline-primary custom-btn-addN" onclick="handleAdd(this, 'genre')">Add
                                            new</button>
                                    </div>

                                </div>
                            </div>


                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <button type="button" class="btn btn-primary custom-btn">Update</button>
                                </div>
                            </div>
                        </form>
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
            handleSubmitAddMovie('update');
        </script>
    </body>
</html>