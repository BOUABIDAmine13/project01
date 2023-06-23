<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>admin page</title>
    <link href="dashboard.css" rel="stylesheet">
    <style type="text/css">
    	body {
			  font-size: .875rem;
			}
			
			.feather {
			  width: 16px;
			  height: 16px;
			}
			.sidebar {
			  position: fixed;
			  top: 0;
			  /* rtl:raw:
			  right: 0;
			  */
			  bottom: 0;
			  /* rtl:remove */
			  left: 0;
			  z-index: 100; /* Behind the navbar */
			  padding: 48px 0 0; /* Height of navbar */
			  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
			}
			
			@media (max-width: 767.98px) {
			  .sidebar {
			    top: 5rem;
			  }
			}
			
			.sidebar-sticky {
			  height: calc(100vh - 48px);
			  overflow-x: hidden;
			  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
			}
			
			.sidebar .nav-link {
			  font-weight: 500;
			  color: #333;
			}
			
			.sidebar .nav-link .feather {
			  margin-right: 4px;
			  color: #727272;
			}
			
			.sidebar .nav-link.active {
			  color: #2470dc;
			}
			
			.sidebar .nav-link:hover .feather,
			.sidebar .nav-link.active .feather {
			  color: inherit;
			}
			
			.sidebar-heading {
			  font-size: .75rem;
			}
			
			/*
			 * Navbar
			 */
			
			.navbar-brand {
			  padding-top: .75rem;
			  padding-bottom: .75rem;
			  background-color: rgba(0, 0, 0, .25);
			  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
			}
			
			.navbar .navbar-toggler {
			  top: .25rem;
			  right: 1rem;
			}
			
			.navbar .form-control {
			  padding: .75rem 1rem;
			}
			
			.form-control-dark {
			  color: #fff;
			  background-color: rgba(255, 255, 255, .1);
			  border-color: rgba(255, 255, 255, .1);
			}
			
			.form-control-dark:focus {
			  border-color: transparent;
			  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
			}
    	
    </style>
</head>
<body>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="logo" fill="#ffffff" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path d="M348.942 1024c48.585-82.459 111.338-150.57 197.146-217.768.775-.647 1.628-1.393 2.855-2.237 28.017-19.522-1.295-34.805-27.262-53.248-38.042-26.928-70.984-70.072-63.234-76.664 9.545-8.132 27.065 40.858 100.188 68.129 41.662 15.529 51.472 8.309 101.012-15.107.334-.128.628-.216.893-.353 14.617-8.809 29.351-17.314 44.419-25.152 80.225-41.898 146.637-103.405 172.731-150.306l.049.039c87.867-147.981 48.166-308.823-27.968-401.379-7.299-8.848-18.197-18.904-24.338-24.946-9.427 10.644-20.944 29.184-14.793 51.09 10.251 36.62 6.936 71.523-12.694 94.066 20.924 63.921-.726 137.475-49.353 179.569-25.133 16.167-50.942 27.105-85.041 27.595-78.577 1.118-134.581-30.666-203.456-59.212-69.767-28.91-143.959-43.006-219.514-40.573C156.915 380.235 68.52 407.571.002 458.66V128.137C.002 57.369 57.251.001 128.138.001h767.728c70.768 0 128.136 57.249 128.136 128.136v767.728c0 70.768-57.249 128.136-128.136 128.136H348.944zM0 854.128v-30.443c13.71.069 28.695-1.356 45.05-4.494 114.912-22.072 170.769-103.445 170.769-103.445 19.345-24.22 26.075-11.566 15.627 7.063-11.095 19.845-57.172 95.42-171.584 124.016-20.514 5.137-40.653 7.527-59.863 7.303zm357.954-296.735c-10.055 16.019-31.156 20.836-47.185 10.771-15.99-10.035-20.865-31.156-10.81-47.175 10.065-16.039 31.215-20.856 47.205-10.82 16.039 10.065 20.856 31.185 10.791 47.224zm341.363-339.312c31.745 90.878 107.908 51.119 91.369-35.374-8.927-46.705 14.087-72.161 14.087-72.161-79.165-30.46-128.607 41.25-105.456 107.535z"/>
        </symbol>
        </svg>
  <%@include file="/vue/header2.jsp"  %>
  <div class="container-fluid">
    <div class="row">
  <%@include file="/vue/navBar.jsp"  %>
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">admin: admin name</h1>
          <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group me-2">
              <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
              <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
            </div>
            <button type="button" class="btn btn-sm btn-outline-secondary">
              <span data-feather="calendar" class="align-text-bottom"></span>
              <span class="timeShow"></span>
            </button>
          </div>
        </div>
        <h3>add new product</h3>
        <hr width="100%">
        <div class="container w-50 mt-5">
        <div class="card">
            <div class="card-body">
              
              <form action="addProduits.dz" method="post">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="productName" placeholder="example" name="designation">
                    <label for="productName">Product name</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" step="0.01" min="0" class="form-control" id="price" name="prix" placeholder="name">
                    <label for="price">Price</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="quantity" name="quantite_stock" placeholder="name@example.com">
                    <label for="quantity">Quantity</label>
                </div>
                <div class="form-floating mb-2">
                    <select class="form-select" id="floatingSelect" name="categorie" aria-label="Floating label select example">
                      <option selected value="general">Open this select menu</option>
                      <option value="clothes">Clothes</option>
                      <option value="glasses">Glasses</option>
                      <option value="shoes">Shoes</option>
                    </select>
                    <label for="floatingSelect">Works with selects</label>
                  </div>
                <button type="submit" class="btn btn-primary">save</button>
              </form>
            </div>
        </div>
    </div>
      </main>
    </div>
  </div>
  <script>
    const timeShow = document.querySelector('.timeShow');
    
    function getDateTime(){
        var today = new Date();
        var dateNow = today.getFullYear()+'-'+today.getMonth()+'-'+today.getDate()+' '+today.getHours()+':'+today.getMinutes()+':'+today.getSeconds();
        return dateNow;
    }
    setInterval(function(){
        dateNow = getDateTime();
        document.querySelector('.timeShow').innerHTML = dateNow;
    }, 1000);
  </script>
<script src="js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>   
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@4.2.1/dist/chart.umd.min.js" integrity="sha384-gdQErvCNWvHQZj6XZM0dNsAoY4v+j5P1XDpNkcM3HJG1Yx04ecqIHk7+4VBOCHOG" crossorigin="anonymous"></script><script src="js/dashboard.js"></script>
</body>
</html>