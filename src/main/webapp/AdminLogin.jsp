<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" >
<head>
    <style>
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }
        /* Hide ra
        dio buttons */
        input[type="radio"] {
            display: none;
        }
        .wrapper {
            /* Add your desired styles for the wrapper */
        }
        .title-text {
            /* Add your desired styles for the title text */
        }
        .form-container {
            /* Add your desired styles for the form container */
        }
        .slide-controls {
            /* Add your desired styles for the slide controls */
        }
        .form-inner {
            /* Add your desired styles for the form inner */
        }
        .field {
            /* Add your desired styles for the field */
        }
        .btn-layer {
            /* Add your desired styles for the button layer */
        }
    </style>
    <meta charset="utf-8">
    <title>Login & Signup Form | CodingNepal</title>
    <link rel="stylesheet" href="vendors/styles/LoginStyle.css">
    <link rel="stylesheet" href="vendors/styles/core.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<% String message = (String) request.getAttribute("message"); %>
<% if (message != null) { %>
<script>alert('<%= message %>');</script>
<% } %>
<div class="wrapper">
    <div class="title-text">
        <div class="title login">Admin Login</div>
        <div class="title signup">Admin SignUp</div>
    </div>
    <div class="form-container">

        <div class="form-inner">
            <form action="./LoginServlet" method="post" enctype="multipart/form-data" class="login" id="userLoginForm" >
                <img src="vendors/images/5573512_2919973.svg" width="300px" class="center">
                <div class="field">
                    <input type="text" placeholder="Admin Phone Number" name="phone" id="phone" required>
                </div>
                <div class="field">
                    <input type="password" name="password" placeholder="Password" id="userPassword" required>
                </div>
               
                <div class="field btn">
                    <div class="btn-layer"></div>
                    <input type="submit" value="Login">
                </div>

            </form>


        </div>
    </div>
</div>

<script>
    const loginText = document.querySelector(".title-text .login");
    const loginForm = document.querySelector("form.login");
    const loginBtn = document.querySelector("label.login");
    const signupBtn = document.querySelector("label.signup");
    const signupLink = document.querySelector("form .signup-link a");
    signupBtn.onclick = (()=>{
        loginForm.style.marginLeft = "-50%";
        loginText.style.marginLeft = "-50%";
    });
    loginBtn.onclick = (()=>{
        loginForm.style.marginLeft = "0%";
        loginText.style.marginLeft = "0%";
    });
    signupLink.onclick = (()=>{
        signupBtn.click();
        return false;
    });
</script>

<script>

    const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.onmouseenter = Swal.stopTimer;
            toast.onmouseleave = Swal.resumeTimer;
        }
    });
    Toast.fire({
        icon: "success",
        title: "Signed in successfully"
    });
</script>
<script>
    document.getElementById('loginBtn').addEventListener('click', function() {
        const userEmail = document.getElementById('userEmail').value;
        const userPassword = document.getElementById('userPassword').value;

        Swal.fire({
            title: "Do you want to login?",
            showCancelButton: true,
            confirmButtonText: "Login",
        }).then((result) => {
            if (result.isConfirmed) {
                // Here you can add code to handle the login process
                Swal.fire({
                    title: "Login successful!",
                    icon: "success",
                });
            }
        });
    });
</script>
</body>
</html>
