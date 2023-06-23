<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>delevry formalir</title>
    <style>
        .container {
            max-width: 900px;
        }
    </style> 
</head>
<body class="bg-body-secondary">
<%@include file="/vue/header.jsp" %> 
    <div class="container">
        <main>
          <div class="py-5 text-center">
            <svg class="bi me-2 text-white" width="72" height="57" role="img" aria-label="Bootstrap"><use xlink:href="#logo2"/></svg>
            <h2>Delivery Subscription</h2>
            <p class="lead">The request will be studied and the response will be within a maximum of one week.<br>The Subscription will be annual, and the products will be deliverd weekly.</p>
          </div>
      
          <div class="row g-5">
            <div class="col-md-5 col-lg-4 order-md-last">
            </div>
            <div class="col-md-7 col-lg-8">
              <h4 class="mb-3">From for Subscription</h4>
              <form class="needs-validation" novalidate action="saveDelevry.dz" method="post">
                <div class="row g-3">
                   <div class="col-sm-6">
                    <label for="firstName" class="form-label">First name</label>
                    <input type="text" class="form-control" id="firstName" placeholder="" value="" required name="fName">
                    <div class="invalid-feedback">
                      Valid first name is required.
                    </div>
                  </div>
      
                  <div class="col-sm-6">
                    <label for="lastName" class="form-label">Last name</label>
                    <input type="text" class="form-control" id="lastName" placeholder="" value="" required name="lName">
                    <div class="invalid-feedback">
                      Valid last name is required.
                    </div>
                  </div>
      
                  <div class="col-12">
                    <label for="username" class="form-label">Campeny name</label>
                    <div class="input-group has-validation">
                      <span class="input-group-text">@</span>
                      <input type="text" class="form-control" id="username" placeholder="Username" required name="cName">
                    <div class="invalid-feedback">
                        Campeny name is required.
                      </div>
                    </div>
                  </div>
      
                  <div class="col-12">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="you@example.com" required name="email">
                    <div class="invalid-feedback">
                      Please enter a valid email address for shipping updates.
                    </div>
                  </div>
                  <div class="col-12">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="1234 Main St" required name="address">
                    <div class="invalid-feedback">
                      Please enter your Campeny address.
                    </div>
                  </div>
                  
                  <div class="col-12">
                    <label for="address" class="form-label">Price</label>
                    <input type="number" step="0.01" min="0" class="form-control" id="price" name="prix" placeholder="$15.5">
                    <div class="invalid-feedback">
                      Price.
                    </div>
                  </div>
                  </div> 
                  
                <hr class="my-4">
      
                <div class="form-check">
                  <input type="checkbox" class="form-check-input" id="same-address" name="shippingAddress">
                  <label class="form-check-label" for="same-address">Shipping the products in same address of the Company</label>
                </div>
                <div class="form-check">
                  <input type="checkbox" class="form-check-input" id="save-info">
                  <label class="form-check-label" for="save-info">Save this information for next time</label>
                </div>
                <div class="row gy-3">
                </div>
                <hr class="my-4">
                <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
              </form>
            </div>
          </div>
        </main>
      
        <footer class="my-5 pt-5 text-body-secondary text-center text-small">
          <p class="mb-1"><c:out value="&copy" escapeXml="false"></c:out> 2022<c:out value="-" escapeXml="true"></c:out>2023 Happey Elephant</p>
          <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
          </ul>
        </footer>
      </div>
      <script>
        (() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()
      </script>
      <script src="js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>   
</body>
</html>