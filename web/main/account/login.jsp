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
        <style>
            .form-group.success input {
                border-color: #09c372;
            }

            .form-group.error input {
                border-color: #ff3860;
            }
            .error {
                color: orange; /* Set the text color to red */
            }

            .google-login-button {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 10px 12px;
                background-color: #4285F4;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .google-login-button:hover {
                background-color: #3367D6;
            }

            .google-icon {
                width: 20px;
                height: 20px;
                margin-right: 10px;

            }
        </style>
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
                <div class="login-fail ${((requestScope.error==null)?'':'show')}">
                    <h3>${requestScope.error}</h3>
                    <span><i class="fas fa-times"></i></span>
                </div>
                <form action="login" method="post" id="formLogin">
                    <c:set value="${pageContext.request.cookies}" var="cookie"/>
                    <h1>Login</h1>
                    <div class="form-group">
                        <div class="form-control-wrapper ${((cookie.cname.value==null) ? '':'has-text')}">
                            <input type="text" name="username" class="form-control" id="username" value="${cookie.cname.value}" >
                            <label for="username">Username</label>
                            <div class="error"></div>
                        </div>
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                        <div class="form-control-wrapper ${((cookie.cpass.value==null) ? '':'has-text')}">
                            <input type="password" name="password" class="form-control" id="password" value="${cookie.cpass.value}">
                            <label for="password">Password</label>
                            <div class="error"></div>
                        </div>
                        <span class="form-message"></span>
                    </div>
                    <button type="submit" class="form-submit">Login</button>
                    <div class="other-wrapper d-flex justify-content-between">
                        <label class="keep-login" for="reminde-me">
                            Remind me
                            <input type="checkbox" ${(cookie.crem.value!=null?'checked':'')} name="reminde-me" id="reminde-me" value="On">
                            <span class="checkmark"></span>
                        </label>
                        <a href="forgot-pw">Forgot Password?</a>
                    </div>
                </form>
                <!-- login with google -->            
                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20https://www.googleapis.com/auth/userinfo.email
                   &redirect_uri=http://localhost:9999/Movie_Web/login-google&response_type=code
                   &client_id=460666027032-cn4b2kjs7rkt6216shud2t97fssl095l.apps.googleusercontent.com&approval_prompt=force"
                   class="google-login-button">
                    <img src="./images/google-icon.png"  class="google-icon" > Login With Google
                </a>        

                <div class="link-to-rest">
                    Don't have an account?
                    <a href="signup">Sign up</a>
                </div>
                <!-- them none de an hien the p thu 2 -->

                <div class="captcha-wrapper none">
                    <p>Trang này được Google reCAPTCHA bảo vệ để đảm bảo bạn không phải là robot.
                        <span>Tìm hiểu thêm.</span>
                    </p>
                    <p>Thông tin do Google reCAPTCHA thu thập sẽ tuân theo <span>Chính sách Quyền riêng tư</span> and <span>Điều khoản dịch vụ</span> của Google, và được dùng để cung cấp, duy trì và cải thiện dịch vụ reCAPTCHA cũng như các mục đích bảo mật nói chung (thông tin này không được dùng để cá nhân hóa quảng cáo của Google).</p>
                </div>
            </div>
        </div>
        <%@include file="../layout/footer.jsp"%> 
        <script src="./js/script.js"></script>
        <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
        <script>
            handleLogin();

            const form = document.getElementById('formLogin');
            const username = document.getElementById('username');

            const password = document.getElementById('password');


            form.addEventListener('submit', e => {
                e.preventDefault();
                validateInputs()

            });

            const setError = (element, message) => {
                const inputControl = element.parentElement;
                const errorDisplay = inputControl.querySelector('.error');

                errorDisplay.innerText = message;
                inputControl.classList.add('error');
                inputControl.classList.remove('success')
            }

            const setSuccess = element => {
                const inputControl = element.parentElement;
                const errorDisplay = inputControl.querySelector('.error');

                errorDisplay.innerText = '';
                inputControl.classList.add('success');
                inputControl.classList.remove('error');
            };
            const validateInputs = () => {
                const usernameValue = username.value.trim();

                const passwordValue = password.value.trim();


                if (usernameValue === '') {
                    setError(username, 'Username is required');
                } else {
                    setSuccess(username);
                }
                if (passwordValue === '') {
                    setError(password, 'Password is required');
                } else {
                    setSuccess(password);
                }

                if (usernameValue != '' && passwordValue != '') {
                    // All inputs are valid, submit the form
                    form.submit();
                }
            };

        </script>
    </body>
</html>