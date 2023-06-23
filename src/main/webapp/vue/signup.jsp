<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Sing Up</title>
    <style>
        .modal-sheet .modal-dialog {
            width: 400px;
            transition: bottom .75s ease-in-out;
        }
        .modal-header{
            justify-content: left;
        }
    </style>
</head>
<body >
<%@include file="/vue/header.jsp"  %>    
        <div class="modal modal-sheet position-static d-block bg-body-secondary p-5  py-md-5" tabindex="-1" role="dialog" id="modalSignin">
        <div class="modal-dialog" role="document">
          <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <a href="/" class="mb-2 mb-lg-0 text-white text-decoration-none">
                    <svg class="bi me-2 text-white" width="60" height="55" role="img" aria-label="Bootstrap"><use xlink:href="#logo2"/></svg>
                </a>
              <h1 class="fw-bold mb-0 fs-3">Sing up for free</h1>
            </div>
            <div class="modal-body p-5 pt-0">
              <form class="" action="signup.dz" method="post">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control rounded-3" id="floatingInput" placeholder="name@example.com" name="userName">
                    <label for="floatingInput">User name</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="email" class="form-control rounded-3" id="floatingInput" placeholder="name@example.com" name="userEmail">
                  <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="password" class="form-control rounded-3" id="floatingPassword" placeholder="Password" name="userPassword">
                  <label for="floatingPassword">Password</label>
                </div>
                <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">Sing up</button>
                <a class="w-100 mb-2 btn btn-lg rounded-3 btn-outline-secondary" href="login.dz">Login</a>
                <small class="text-body-secondary">By clicking Sign up, you agree to the terms of use.</small>
                <!-- <hr class="my-4">
                <h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
                <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3" type="submit">
                  <svg class="bi me-1" width="18" height="18"><use xlink:href="#twitter"/></svg>
                  Sign up with Twitter
                </button>
                <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3" type="submit">
                  <svg class="bi me-1" width="18" height="18"><use xlink:href="#facebook"/></svg>
                  Sign up with Facebook
                </button> -->
              </form>
            </div>
          </div>
        </div>
      </div> 
<script src="js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>  