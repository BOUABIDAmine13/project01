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
    
  <%@include file="/vue/header2.jsp"  %>
  <div class="container-fluid">
    <div class="row">
  <%@include file="/vue/navBar.jsp"  %>
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">administration: <c:out value="${user.nom}"></c:out> </h1>
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
        <h3>print All product</h3>
        <hr width="100%">
        <div class="table-responsive">
          <table class="table table-striped table-sm">
            <thead>
              <tr>
                <th scope="col">id</th>
                <th scope="col">name</th>
                <th scope="col">price</th>
                <th scope="col">stocks</th>
                <th scope="col">pays</th>
                <th scope="col"></th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${produictModel.listProduit }" var="produit">
              <tr>
                <td><c:out value="${produit.id_produit}"></c:out></td>
                <td><c:out value="${produit.designation}"></c:out></td>
                <td><c:out value="${produit.prix}"></c:out></td>
                <td><c:out value="${produit.quantite_stock}"></c:out></td>
                <td><c:out value="${produit.quantite_achte}"></c:out></td>
                <td><a href="updateProduct?idProduit=${produit.id_produit}" class="btn"></a>Update</td>
                <td><a href="deleteProduct?idProduit=${produit.id_produit}" class="btn"></a>Delete</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
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