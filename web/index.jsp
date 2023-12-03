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
            <%@include file="./main/layout/header.jsp"%> 
            <div class="PH-slider container">
                <div class="slider-containers">
                    <div class="slider-container">
                        <div class="slider1 slider-PLclone">
                            <a href="#">
                                <img src="./images/slider-5-570x364.jpg" alt="1" width="570" height="364">
                            </a>
                            <h6>
                                <a href="#">IT (2017)</a>
                            </h6>
                            <p>2017, USA, Drama, Horror, Thriller</p>
                        </div>
                        <div class="slider1 slider-Lclone">
                            <a href="#">
                                <img src="./images/slider-6-570x364.jpg" alt="1" width="570" height="364">
                            </a>
                            <h6>
                                <a href="#">IT (2017)</a>
                            </h6>
                            <p>2017, USA, Drama, Horror, Thriller</p>
                        </div>
                        <div class="slider1">
                            <a href="#">
                                <img src="./images/slider-1-570x364.jpg" alt="1" width="570" height="364">
                            </a>
                            <h6>
                                <a href="#">IT (2017)</a>
                            </h6>
                            <p>2017, USA, Drama, Horror, Thriller</p>
                        </div>
                        <div class="slider1">
                            <a href="#">
                                <img src="./images/slider-2-570x364.jpg" alt="1" width="570" height="364">
                            </a>
                            <h6>
                                <a href="#">IT (2017)</a>
                            </h6>
                            <p>2017, USA, Drama, Horror, Thriller</p>
                        </div>
                        <div class="slider1">
                            <a href="#">
                                <img src="./images/slider-3-570x364.jpg" alt="1" width="570" height="364">
                            </a>
                            <h6>
                                <a href="#">IT (2017)</a>
                            </h6>
                            <p>2017, USA, Drama, Horror, Thriller</p>
                        </div>
                        <div class="slider1">
                            <a href="#">
                                <img src="./images/slider-4-570x364.jpg" alt="1" width="570" height="364">
                            </a>
                            <h6>
                                <a href="#">IT (2017)</a>
                            </h6>
                            <p>2017, USA, Drama, Horror, Thriller</p>
                        </div>
                        <div class="slider1">
                            <a href="#">
                                <img src="./images/slider-5-570x364.jpg" alt="1" width="570" height="364">
                            </a>
                            <h6>
                                <a href="#">IT (2017)</a>
                            </h6>
                            <p>2017, USA, Drama, Horror, Thriller</p>
                        </div>
                        <div class="slider1">
                            <a href="#">
                                <img src="./images/slider-6-570x364.jpg" alt="1" width="570" height="364">
                            </a>
                            <h6>
                                <a href="#">IT (2017)</a>
                            </h6>
                            <p>2017, USA, Drama, Horror, Thriller</p>
                        </div>
                        <div class="slider1 slider-Fclone">
                            <a href="#">
                                <img src="./images/slider-1-570x364.jpg" alt="1" width="570" height="364">
                            </a>
                            <h6>
                                <a href="#">IT (2017)</a>
                            </h6>
                            <p>2017, USA, Drama, Horror, Thriller</p>
                        </div>
                        <div class="slider1 slider-SFclone">
                            <a href="#">
                                <img src="./images/slider-2-570x364.jpg" alt="1" width="570" height="364">
                            </a>
                            <h6>
                                <a href="#">IT (2017)</a>
                            </h6>
                            <p>2017, USA, Drama, Horror, Thriller</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="PH-dot-items">
                <span class="dot-item active" data-index="1"></span>
                <span class="dot-item" data-index="2"></span>
                <span class="dot-item" data-index="3"></span>
            </div>
        </div>
        <div id="page-content">
            <div class="watch-movies">
                <div class="container">
                    <h1>watch movies online</h1>
                    <hr>
                    <div class="btn-controller">
                        <button class="btn active" data-choice="top_rate">Top Rated</button>
                        <button class="btn" data-choice="new_release">New Realeases</button>
                        <button class="btn" data-choice="coming_soon">Coming soon</button>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-sm-6 col-12 top_rate new_release">
                            <div class="movie-img-wrapper">
                                <img src="./images/gallery-1.jpg" alt="movie-img">
                                <div class="play-interact">
                                    <a href="#">
                                        <i class="fas fa-play-circle"></i>
                                    </a>
                                </div>
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
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12 top_rate new_release">
                            <div class="movie-img-wrapper">
                                <img src="./images/gallery-2.jpg" alt="movie-img">
                                <div class="play-interact">
                                    <a href="#">
                                        <i class="fas fa-play-circle"></i>
                                    </a>
                                </div>
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
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12 top_rate new_release">
                            <div class="movie-img-wrapper">
                                <img src="./images/gallery-3.jpg" alt="movie-img">
                                <div class="play-interact">
                                    <a href="#">
                                        <i class="fas fa-play-circle"></i>
                                    </a>
                                </div>
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
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12 top_rate coming_soon">
                            <div class="movie-img-wrapper">
                                <img src="./images/gallery-4.jpg" alt="movie-img">
                                <div class="play-interact">
                                    <a href="#">
                                        <i class="fas fa-play-circle"></i>
                                    </a>
                                </div>
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
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12 top_rate new_release">
                            <div class="movie-img-wrapper">
                                <img src="./images/gallery-5.jpg" alt="movie-img">
                                <div class="play-interact">
                                    <a href="#">
                                        <i class="fas fa-play-circle"></i>
                                    </a>
                                </div>
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
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12 top_rate coming_soon">
                            <div class="movie-img-wrapper">
                                <img src="./images/gallery-6.jpg" alt="movie-img">
                                <div class="play-interact">
                                    <a href="#">
                                        <i class="fas fa-play-circle"></i>
                                    </a>
                                </div>
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
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12 top_rate coming_soon">
                            <div class="movie-img-wrapper">
                                <img src="./images/gallery-7.jpg" alt="movie-img">
                                <div class="play-interact">
                                    <a href="#">
                                        <i class="fas fa-play-circle"></i>
                                    </a>
                                </div>
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
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12 top_rate coming_soon">
                            <div class="movie-img-wrapper">
                                <img src="./images/gallery-8.jpg" alt="movie-img">
                                <div class="play-interact">
                                    <a href="#">
                                        <i class="fas fa-play-circle"></i>
                                    </a>
                                </div>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="coming-soon">
                <div class="container">
                    <h1>coming soon</h1>
                    <hr>
                    <div class="row">
                        <div class="col-lg-6 col-12">
                            <div class="CM-video-overlay">
                                <img src="./images/index-1.jpg" alt="video-img">
                                <a href="#">
                                    <i class="fas fa-play-circle"></i>
                                </a>
                                <a href="#">Deadpool 2</a>
                                <span>The Trailer</span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-12">
                            <div class="CM-information">
                                <h3>
                                    <a href="#">Deadpool 2</a>
                                </h3>
                                <ul>
                                    <li>1h 59min</li>
                                    <li>
                                        <a href="#">Action</a>,
                                        <a href="#">Adventure</a>,
                                        <a href="#">Comedy</a>
                                    </li>
                                    <li> May 18, 2018 (USA)</li>
                                </ul>
                                <p>After losing Vanessa (Morena Baccarin), the love of his life, 4th-wall breaking mercenary
                                    Wade Wilson aka Deadpool (Ryan Reynolds) must assemble a team and protect a young,
                                    full-figured mutant Russell Collins aka Firefist (Julian Dennison) from Cable (Josh
                                    Brolin).</p>
                                <p>Director:
                                    <span>David Leitch</span>
                                </p>
                                <p>Writers:
                                    <span>Rhett Reese, Paul Wernick</span>
                                </p>
                                <p>Stars:
                                    <span>Ryan Reynolds, Josh Brolin, Morena Baccarin</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <button class="btn">ADD TO WATHCLIST</button>
                </div>
            </div>
            <div class="box-office">
                <div class="container">
                    <h1>TOP BOX OFFICE</h1>
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
            <div class="newsletter">
                <div class="container">
                    <h1>newsletter</h1>
                    <hr>
                    <div class="row justify-content-center text-center">
                        <div class="col-12 col-lg-9 col-xl-6">
                            <p>Enter your email address to receive all news, updates on new arrivals, special offers and
                                other discount information.</p>
                            <form>
                                <input type="text" name="email" placeholder="Your e-mail...">
                                <button class="btn">SUBCRIBE</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="recent-news">
                <div class="container">
                    <h1>recent news</h1>
                    <hr>
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="RN-news-wrapper">
                                <img src="./images/index-8.jpg" alt="new-img">
                                <div class="new-description">
                                    <h4>
                                        <a href="#">"Better Call Saul" Writer Offers Advice</a>
                                    </h4>
                                    <p>December 26, 2018</p>
                                    <p>âBetter Call Saulâ writer Gennifer Hutchison offered some advice to Jason Blum after the Blumhouse Productions chief said in an interview that heâs âtryingâ to hire a woman...</p>
                                    <a href="#" class="new-cmt-icon">
                                        <i class="fas fa-comment"></i>
                                        <span>2</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="RN-news-wrapper">
                                <img src="./images/index-8.jpg" alt="new-img">
                                <div class="new-description">
                                    <h4>
                                        <a href="#">"Better Call Saul" Writer Offers Advice</a>
                                    </h4>
                                    <p>December 26, 2018</p>
                                    <p>âBetter Call Saulâ writer Gennifer Hutchison offered some advice to Jason Blum after the Blumhouse Productions chief said in an interview that heâs âtryingâ to hire a woman...</p>
                                    <a href="#" class="new-cmt-icon">
                                        <i class="fas fa-comment"></i>
                                        <span>2</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="RN-news-wrapper">
                                <img src="./images/index-8.jpg" alt="new-img">
                                <div class="new-description">
                                    <h4>
                                        <a href="#">"Better Call Saul" Writer Offers Advice</a>
                                    </h4>
                                    <p>December 26, 2018</p>
                                    <p>âBetter Call Saulâ writer Gennifer Hutchison offered some advice to Jason Blum after the Blumhouse Productions chief said in an interview that heâs âtryingâ to hire a woman...</p>
                                    <a href="#" class="new-cmt-icon">
                                        <i class="fas fa-comment"></i>
                                        <span>2</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn">VIEW ALL BLOG POSTS</button>
                </div>
            </div>
            <div class="our-partners">
                <div class="container">
                    <h1>our partners</h1>
                    <hr>
                    <div class="row justify-content-center">
                        <div class="col-md-3 col-sm-6 col-6">
                            <img src="./images/partner-1.png" alt="img-partners">
                        </div>
                        <div class="col-md-3 col-sm-6 col-6">
                            <img src="./images/partner-1.png" alt="img-partners">
                        </div>
                        <div class="col-md-3 col-sm-6 col-6">
                            <img src="./images/partner-1.png" alt="img-partners">
                        </div>
                        <div class="col-md-3 col-sm-6 col-6">
                            <img src="./images/partner-1.png" alt="img-partners">
                        </div>
                    </div>
                </div>
            </div>
            <div class="testimonials">
                <div class="container">
                    <h1>testimonials</h1>
                    <hr>
                    <div class="T-review-show">
                        <div class="T-review-container d-flex">
                            <div class="T-reviewer">
                                <img src="./images/index-12.jpg" alt="review-img">
                                <p>Sharon Willis</p>
                                <p>"One of the best online movie streaming services that Iâve seen! Thank you for the constant updates of your movies and TV shows catalog. I recommend MOOV to everyone!"</p>
                            </div>
                            <div class="T-reviewer">
                                <img src="./images/index-12.jpg" alt="review-img">
                                <p>Sharon Willis</p>
                                <p>"One of the best online movie streaming services that Iâve seen! Thank you for the constant updates of your movies and TV shows catalog. I recommend MOOV to everyone!"</p>
                            </div>
                            <div class="T-reviewer">
                                <img src="./images/index-12.jpg" alt="review-img">
                                <p>Sharon Willis</p>
                                <p>"One of the best online movie streaming services that Iâve seen! Thank you for the constant updates of your movies and TV shows catalog. I recommend MOOV to everyone!"</p>
                            </div>
                            <div class="T-reviewer">
                                <img src="./images/index-12.jpg" alt="review-img">
                                <p>Sharon Willis</p>
                                <p>"One of the best online movie streaming services that Iâve seen! Thank you for the constant updates of your movies and TV shows catalog. I recommend MOOV to everyone!"</p>
                            </div>
                            <div class="T-reviewer">
                                <img src="./images/index-12.jpg" alt="review-img">
                                <p>Sharon Willis</p>
                                <p>"One of the best online movie streaming services that Iâve seen! Thank you for the constant updates of your movies and TV shows catalog. I recommend MOOV to everyone!"</p>
                            </div>
                            <div class="T-reviewer">
                                <img src="./images/index-12.jpg" alt="review-img">
                                <p>Sharon Willis</p>
                                <p>"One of the best online movie streaming services that Iâve seen! Thank you for the constant updates of your movies and TV shows catalog. I recommend MOOV to everyone!"</p>
                            </div>
                        </div>
                    </div>
                    <div class="T-dot-items d-flex justify-content-center">
                        <span class="T-dot-item active" data-index="1"></span>
                        <span class="T-dot-item" data-index="2"></span>
                        <span class="T-dot-item" data-index="3"></span>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="./main/layout/footer.jsp"%> 
        <a href="#" class="btn-move-up active">
            <i class="fas fa-chevron-up"></i>
        </a>
        <div class="page-controll-mess">
            <span><i class="fab fa-facebook-messenger"></i></span>
        </div>
        <div id="page-mess">
            <div class="mess-header">
                <div class="account-mess">
                    <div class="account-ava">
                        <a href="">
                            <img src="./images/cho-long.jpg" alt="">
                        </a>
                    </div>
                    <h4>A zai hop phap</h4>
                </div>
                <div class="control-mess">
                    <span class="close-mess"><i class="fas fa-times"></i></span>
                </div>
            </div>
            <div class="mess-content">
                <div class="mess-list">
                    <div class="mess-item">
                        <div class="mess-ava">
                            <img src="./images/cho-long.jpg" alt="">
                        </div>
                        <p>đây bạn thử làm coi xem làm được nhiêu bài</p>
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
        <script src="./js/script.js"></script>
        <script>
            handleAll();
            handleIndex();
        </script>
    </body>

</html>