<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <title>Products</title>
<style>
	.cursor-pointer{
		cursor: pointer;
	}
</style>
<style>
        .carousel-item{
            height: 32rem;
            position: relative;
            background-color: black;
            color: white;
        }
        .overlay-image{
            position:absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background-position: center;
            background-size: cover;

            opacity: 0.75;
        }
        .marketing .col-lg-4 {
            margin-bottom: 1.5rem;
            text-align: center;
        }
        /* rtl:begin:ignore */
        .marketing .col-lg-4 p {
            margin-right: .75rem;
            margin-left: .75rem;
        }
        .featurette-divider {
            margin: 5rem 0; /* Space out the Bootstrap <hr> more */
        }
    </style>
</head>
<body class="bg-body-secondary">
<%@include file="/vue/header.jsp"  %>    		
        <!--
            products block<%= session.getAttribute("user")%>
        -->
        <c:if test="${not empty produitModel.listProduit}">
        <div class="container my-5">
        <div class="row">
         <div class="col-3 me-3 bg-light rounded-3 h-50">
         <div class="container-fluid w-100  p-3 ">
	<div class="card p-0" style="width: 18rem;">
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="card-link">Card link</a>
			    <a href="#" class="card-link">Another link</a>
			  </div>
			  <hr>
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="card-link">Card link</a>
			    <a href="#" class="card-link">Another link</a>
			  </div>
			   <hr>
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="card-link">Card link</a>
			    <a href="#" class="card-link">Another link</a>
			  </div>
		</div>         
		</div>
         </div>
        <div class="col-9 p-3 bg-light rounded-3 " style="width: 66%;">
        <div class="row row-cols-2 row-cols-md-3 g-4 aling-items-center justify-content-center">
			<div class="col w-100 d-inline-flex justify-content-between">
			<p class="fs-5">products type</p>
				<div class="dropdown">
				  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
				    moste note
				  </a>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				    <li><a class="dropdown-item" href="#">Action</a></li>
				    <li><a class="dropdown-item" href="#">Another action</a></li>
				    <li><a class="dropdown-item" href="#">Something else here</a></li>
				  </ul>
				</div>			
			</div>
        	<c:forEach items="${produitModel.listProduit}" var="produit">
                <div class="col" style="max-width: 13rem;">
                  	<a href="commandProduit.dz?Idproduit=${produit.id_produit}" class="text-decoration-none">
                  		<div class="card" style="width: 12.5rem; height: auto;">
                    		<img src="${produit.urlImg}" class="card-img-top" alt="produitImg" width="100" height="200">
                    		<div class="card-body">
                      		<p class="card-text text-break"><c:out value="${produit.designation}"></c:out></p>
                      		<h3 class="card-title text-danger fs-3"><c:out value="${produit.prix }"></c:out>$</h3><h5 class="text-secondary text-decoration-line-through fs-6"><c:out value="${produit.prix }"></c:out></h5>
                    	</div>
                  		</div>
                	</a>
                </div>
        	</c:forEach>
        	</div>
        </div>
        </div>
        
        	</div>
        </c:if>
         <c:if test="${empty produitModel.listProduit}">
         	<div class="container-fluid my-5">
			<div class="row aling-items-center justify-content-center">
			    <div class="col">
			    </div>
			    <div class="col-5">
			      <div class="card text-dark bg-warning my-3 aling-self-center justify-self-center" style="max-width: 30rem;">
				  <div class="card-body">
				    <h5 class="card-title">Products Not Exist</h5>
				    <p class="card-text">the product that you search not exist in out web site whit word "<c:out value="${motCle}"></c:out>".</p>
				  </div>
				</div>
			    </div>
			    <div class="col">
			    </div>
			  </div>
         	</div>	
       	 </c:if>
<%@include file="/vue/footer.jsp"  %>
<script src="js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>  