<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Login</title>
    <style>
        .modal-sheet .modal-dialog {
            width: 400px;
            transition: bottom .75s ease-in-out;
        }
        .modal-sheet .modal-footer {
            padding-bottom: 2rem;
        }
        .modal-header{
            justify-content: left;
        }
    </style>
</head>
<body >
<%@include file="/vue/header.jsp" %> 
        <div class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin">
        <div class="modal-dialog" role="document">
          <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <a href="/" class="mb-2 mb-lg-0 text-white text-decoration-none">
                    <svg class="bi me-2 text-white" width="60" height="55" role="img" aria-label="Bootstrap"><use xlink:href="#logo2"/></svg>
                </a>
              <h1 class="fw-bold mb-0 fs-3">Login now</h1>
            </div>
            <div class="modal-body p-5 pt-0">
              <form class="" action="login.dz" method="post">
                <div class="form-floating mb-3">
                  <input type="email" class="form-control rounded-3" id="floatingInput" placeholder="name@example.com" name="userEmail" value="${email}">
                  <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="password" class="form-control rounded-3" id="floatingPassword" placeholder="Password" name="userPassword">
                  <label for="floatingPassword">Password</label>
                </div>
                <c:if test="${!empty message }">
                      <div class="alert alert-danger mb-3"  role="alert">
						  <c:out value="${message}"></c:out> 
                    </div>
                 </c:if>
                <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">Login</button>
                <small class="text-body-secondary">Don't have a account.</small>
                <hr class="my-1 mb-2">
                <a class="w-100 mb-2 btn btn-lg rounded-3 btn-outline-secondary" href="signup.dz">Sing up</a>
              </form>
            </div>
          </div>
        </div>
      </div>
        <script type="text/javascript">
        console.log(${message }+5)
        </script>
<script src="js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>  