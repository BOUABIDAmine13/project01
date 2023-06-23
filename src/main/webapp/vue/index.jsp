<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="icon" type="">
    <title>home page</title>
    <!-- <style type="text/css">
	body {
		background-image: url("img/back-img2.jpg");
		background-repeat: no-repeat;
		background-size: 100%
	}
</style> -->
<style>
	.cursor-pointer{
		cursor: pointer;
	}
</style>
<style>
        .carousel-item{
            height: 25rem;
            position: relative;
            background-color: black;
            color: white;
            data-bs-interval="";
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
        
        .list-group{
        	width: 80%;
        }
    </style>
</head>
<body class="bg-body-secondary">
<%@include file="/vue/header.jsp"  %>
<div class="container">
<div class="mb-0 row ">
	 <div class="col d-flex justify-content-center">
	 	<div class="list-group my-3">
	  <a href="getProduits.dz?gatigiry=clothes" class="list-group-item list-group-item-action"><svg class="bd-placeholder-img me-1" width="25" height="25" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><use xlink:href="#shirt"/></svg>Clothes</a>
	  <a href="getProduits.dz?gatigiry=shoes" class="list-group-item list-group-item-action"><svg class="bd-placeholder-img me-1" width="25" height="25" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><use xlink:href="#shoes"/></svg>Shoes</a>
	  <a href="getProduits.dz?gatigiry=glasses" class="list-group-item list-group-item-action"><svg class="bd-placeholder-img me-1" width="25" height="25" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><use xlink:href="#glasses"/></svg>Glasses</a>
	  <a href="getProduits.dz?gatigiry=makeups" class="list-group-item list-group-item-action"><svg class="bd-placeholder-img me-1" width="25" height="25" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><use xlink:href="#makeups"/></svg>Makeups</a>
	  <a href="getProduits.dz?gatigiry=accessories" class="list-group-item list-group-item-action"><svg class="bd-placeholder-img me-1" width="25" height="25" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><use xlink:href="#smartphone"/></svg>Phone accessories</a>
	  <a href="getProduits.dz?type=man" class="list-group-item list-group-item-action"><svg class="bd-placeholder-img me-1" width="25" height="25" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><use xlink:href="#man"/></svg>Man</a>
	  <a href="getProduits.dz?type=woman" class="list-group-item list-group-item-action"><svg class="bd-placeholder-img me-1" width="25" height="25" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><use xlink:href="#woman"/></svg>Woman</a>
	  <a href="getProduits.dz?type=baby" class="list-group-item list-group-item-action"><svg class="bd-placeholder-img me-1" width="25" height="25" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><use xlink:href="#baby"/></svg>babys</a>	
	</div>
	 </div>
 	<div class="col-7">
          <div id="carouselExampleCaptions" class="carousel carousel-dark  slide carousel-fade w-100 my-3" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner rounded-3">
              <div class="carousel-item active">
                
                <img src="img/back/back1.jpeg" class="d-block w-100" alt="">
                <div class="carousel-caption d-none d-md-block">
                  <h2>Delivery in the time</h2>
                  <p>with external partners who are specialized in delivery.</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="img/back/back7.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h2>seasonal sale</h2>
                  <p>get a discount in a variety of seasons.</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="img/back/back6.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h2>products of all kinds</h2>
                  <p>Diversity of products for all people.</p>
                </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
          </div>
           <div class="col">
           <p class="text-center my-3">What new in our website.</p>
           <div class="card my-3">
			  <div class="card-body">
			    This is some text within a card body.
			  </div>
			  </div>
			  <div class="card my-3">
			  <div class="card-body">
			    This is some text within a card body.
           </div>
           </div>
           <div class="card my-3">
			  <div class="card-body">
			    This is some text within a card body.
           </div>
    </div>
    </div>
    </div>
    </div>
    <div class="container marketing w-75 mb-4">
    <div class="card" style="height: 25rem;">
  	<div class="card-header fs-5 fw-bold">Most orders products</div>
        <div class="row p-3">
		  <div class="col-sm-3">
		    <div class="card" style="height: 15rem">
		      <div class="card-body">
		        <h5 class="card-title">Special title treatment</h5>
		        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
		        <a href="#" class="btn btn-primary">Go somewhere</a>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-3">
		    <a href="commandProduit.dz?Idproduit=${produit.id_produit}" class="text-decoration-none">
           		<div class="card p-2" style="height: 20rem;">
             		<img src="img/produitsImg/44.jpg" class="card-img-top" alt="produitImg" width="100" height="200">
             		<div class="card-body">
               			<p class="card-text text-truncate mb-1"><c:out value="prodiuts nufsdfsdfsdfsdjjjjjjjjjjjjjjjj"></c:out></p>
               			<h3 class="card-title text-danger fs-4 mb-0"><c:out value="15$"></c:out>$</h3><h5 class="text-secondary text-decoration-line-through fs-6"><c:out value="17$"></c:out></h5>
               		</div>
           		</div>
         	</a>
		  </div>
		  <div class="col-sm-3">
		    <div class="card" style="height: 15rem">
		      <div class="card-body">
		        <h5 class="card-title">Special title treatment</h5>
		        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
		        <a href="#" class="btn btn-primary">Go somewhere</a>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-3">
		    <div class="card" style="height: 15rem">
		      <div class="card-body">
		        <h5 class="card-title">Special title treatment</h5>
		        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
		        <a href="#" class="btn btn-primary">Go somewhere</a>
		      </div>
		    </div>
		  </div>
		</div>
		</div>
        </div>
        
        
        <div class="container marketing w-75">
    <div class="card" style="height: 25rem;">
  	<div class="card-header fs-5 fw-bold">Offers in products</div>
        <div class="row p-3">
		  <div class="col-sm-3">
		    <div class="card" style="height: 15rem">
		      <div class="card-body">
		        <h5 class="card-title">Special title treatment</h5>
		        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
		        <a href="#" class="btn btn-primary">Go somewhere</a>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-3">
		    <a href="commandProduit.dz?Idproduit=${produit.id_produit}" class="text-decoration-none">
           		<div class="card p-2" style="height: 20rem;">
             		<img src="img/produitsImg/44.jpg" class="card-img-top" alt="produitImg" width="100" height="200">
             		<div class="card-body">
               			<p class="card-text text-truncate mb-1"><c:out value="prodiuts nufsdfsdfsdfsdjjjjjjjjjjjjjjjj"></c:out></p>
               			<h3 class="card-title text-danger fs-4 mb-0"><c:out value="15$"></c:out>$</h3><h5 class="text-secondary text-decoration-line-through fs-6"><c:out value="17$"></c:out></h5>
               		</div>
           		</div>
         	</a>
		  </div>
		  <div class="col-sm-3">
		    <div class="card" style="height: 15rem">
		      <div class="card-body">
		        <h5 class="card-title">Special title treatment</h5>
		        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
		        <a href="#" class="btn btn-primary">Go somewhere</a>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-3">
		    <div class="card" style="height: 15rem">
		      <div class="card-body">
		        <h5 class="card-title">Special title treatment</h5>
		        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
		        <a href="#" class="btn btn-primary">Go somewhere</a>
		      </div>
		    </div>
		  </div>
		</div>
		</div>
        </div>
        <hr class="featurette-divider">
        <%@include file="/vue/footer.jsp"  %>
<script src="js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>  