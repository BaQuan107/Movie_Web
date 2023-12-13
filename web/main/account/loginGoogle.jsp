<html>
    <head>

        <title>Login</title>
        <meta name="google-signin-client_id" content="460666027032-cn4b2kjs7rkt6216shud2t97fssl095l.apps.googleusercontent.com">
        <style>
            .google-login-button {
                display: inline-block;
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
        <h1>login</h1>

        <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20https://www.googleapis.com/auth/userinfo.email
           &redirect_uri=http://localhost:9999/Movie_Web/login-google&response_type=code
           &client_id=460666027032-cn4b2kjs7rkt6216shud2t97fssl095l.apps.googleusercontent.com&approval_prompt=force"
           class="google-login-button">
            <img src="./images/google-icon.png"  class="google-icon" > Login With Google
        </a>




        <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
    </body>
</html>