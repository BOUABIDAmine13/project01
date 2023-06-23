<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
	<%@include file="/vue/header.jsp"  %>
    <div class="container-fluid d-flex justify-content-center my-3">
        <div class="card p-2" style="width: 40rem;">
            <div class="row ">
              <div class="col" style="max-width: 15rem; higth:250px;">
                <img src="${produitModel.produit.urlImg}" class="img-fluid rounded" alt="produitImage">
              </div>
              <div class="col">
                <div class="card-body">
                  <p class="card-text text-break"><c:out value="${produitModel.produit.designation }"></c:out> </p>
                  <h3 class="card-title text-danger fs-4  d-inline-flex me-2">$<c:out value="${produitModel.produit.prix }"></c:out></h3>
                  <h5 class="text-decoration-line-through fs-6 text-secondary d-inline-flex">$-</h5>
                  <hr class="my-0">
                  <div class="mt-2 mb-3">
                    <span class="me-2">Quintety</span>
                    <div class="minus text-light bg-secondary rounded-circle border-dark d-inline-flex justify-content-center" style="width: 25px; height: 25px;cursor: pointer;">-</div>
                    <span class="num">01</span>
                    <span class="plus text-light bg-secondary rounded-circle border-dark d-inline-flex justify-content-center" style="width: 25px; height: 25px;cursor: pointer;">+</span>
                  </div>
                  <div class="input-group w-auto justify-content-end aling-items-center">
                  </div>
                  <form action="bayProduct.dz" method="get" class="needs-validation">
                  <div class="mb-2"><span>Shipping</span></div>
                  <select class="form-select form-select-sm mb-2" aria-label=".form-select-sm example"name="shipping">
                  <c:forEach items="${shippongModel.listDelevary}" var="company">
                    <option value="${company.id_delevery}"><c:out value="${company.compenyName }"></c:out>: $<c:out value="${company.prix}"></c:out></option>
                    </c:forEach>
                  </select>
                  <input type="text" name="adresss" maxlength="30" class="form-control mb-2" placeholder="add your adress" required>
                  <input type="tel" name="phoneNumber" maxlength="10" pattern="[0]{1}[5-7]{1}[0-9]{8}" class="form-control mb-2" placeholder="add phone number 05/06/07" required>
                   <h6 class="mb-3">Payment</h6>
	                <div class="my-3">
	                  <div class="form-check form-check-inline">
	                    <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required value="On Delivery">
	                    <label class="form-check-label" for="credit">On Delivery</label>
	                  </div>
	                  <div class="form-check form-check-inline">
	                    <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required value="Credit card">
	                    <label class="form-check-label" for="debit">Credit card</label>
	                  </div>
	                </div>
                  <input type="hidden" name ="quntity" value="01">
                  <input type="hidden" name ="idProduct" value="${produitModel.produit.id_produit}">
                  <button type="submit" class="btn btn-primary">Bay Now</button>
                  <a class="btn btn-outline-secondary" href="addToBasket?idProduct=${produitModel.produit.id_produit}">Add to the basket</a>
                  </form>
                </div>
              </div>
            </div>
          </div>
    </div>
    <div class="continer-fluid d-flex justify-content-center">
        <div class="card" style="width: 40rem;">
            <div class="card-header">
              Comments Area
            </div>
            <%if(session.getAttribute("user") != null){ %>
            <div class="card-body">
                <form action="addComment.dz" method="post">
                    <div class="form-floating mb-3">
                        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2"rows="10" name="commant"></textarea>
                        <label for="floatingTextarea2">Comments</label>
                    </div>
                    <input type="hidden" value="${produitModel.produit.id_produit }" name="idProduit">
                    <button type="submit" class="btn btn-primary">Add Commente</button>
                </form>
            </div>
            <%} %>
            <ul class="list-group list-group-flush ">
            <c:forEach var="comment" items="${commentModel.listComments}" >
                <li class="list-group-item p-2">
                    <div class="row row-cols-3">
                        <div class="col-2">
                            <img src="${comment.user.urlImg }" class="rounded-circle" alt="" style="width: 70px; height: 70px;">
                        </div>
                        <div class="col-8 align-self-start p-0 text-break">
                            <sup class="text-body-secondary fs-6 fw-bold">${comment.user.nom }</sup>
                            <h6 class="my-0">
                                ${comment.commant}
                            </h6>
                        </div>
                        <div class="col-2 align-self-end p-0">
                            <span class="text-body-secondary">${comment.date}</span>
                        </div>
                    </div>
                </li> 
                </c:forEach>
              </ul>
        </div>
    </div>
    <%@include file="/vue/footer.jsp"  %>
    <script>
        const plus = document.querySelector(".plus"),
            minus = document.querySelector(".minus"),
            num = document.querySelector(".num"),
        	input = document.querySelector("input[type='hidden']");

            let a = 1;
            
            plus.addEventListener("click",()=>{
                a++;
                a = (a<10) ? "0"+a : a;
                num.innerText = a;
                input.value = a;
            });
            minus.addEventListener("click",()=>{
                if(a>1) {
                a--;
                a = (a<10) ? "0"+a : a;
                num.innerText = a;
                }
                input.value = a;
            });
    </script>
    <script src="js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>