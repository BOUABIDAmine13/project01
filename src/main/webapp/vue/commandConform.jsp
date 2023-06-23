<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Order confirmation</title>
</head>
<body>
<%@include file="/vue/header.jsp"  %>
    <div class="container-fluid d-flex justify-content-center my-3">
        <div class="card p-2" style="width: 40rem;">
            <div class="row ">
              <div class="col" style="max-width: 15rem; higth:250px;">
                <img src="${commandModel.produit.urlImg}" class="img-fluid rounded" alt="produitImage">
              </div>
              <div class="col">
                <div class="card-body">
                  <p class="card-text text-break"><c:out value="${commandModel.produit.designation}"></c:out> </p>
                  <span>price: <c:out value="${commandModel.command.pPrix}"></c:out>$</span><br>
                  <span> Quantity: <c:out value="${commandModel.command.quantite}"></c:out></span><br>
                  <span>Shipping: <c:out value="${commandModel.command.sPrix}"></c:out>$</span><br>
                  <span>With: <c:out value="${commandModel.command.delevaryNome}"></c:out></span><br>
                  <span>PaymentType: <c:out value="${commandModel.command.paymentType}"></c:out></span><br>
                  <span class="fs-5 text-warning">Total: <c:out value="${commandModel.command.tPrix}"></c:out>$</span><br>
                  <hr class="my-3">
                  <span>name: <c:out value="${commandModel.user.nom}"></c:out></span><br>
                  <span>address: <c:out value="${commandModel.command.adress}"></c:out></span>
                  <div class="input-group w-auto justify-content-end aling-items-center">
                  </div>
                  <form class="my-3" action="saveCommand.dz" method="post">
                  <input type="hidden" value="${commandModel.user.id_user}" name="idClient">
                      <input type="hidden" value="${commandModel.produit.id_produit}" name="idProduit">
                      <input type="hidden" value="${commandModel.command.id_shipping}" name="idShipping">
                      <input type="hidden" value="${commandModel.command.quantite}" name="quantite">
                      <input type="hidden" value="${commandModel.command.adress}" name="adress">
                      <input type="hidden" value="${commandModel.command.paymentType}" name="paymentType">
                  	  <button type="submit" class="btn btn-primary">conform</button>
                      <a class="btn btn-outline-secondary" href="commandProduit.dz?Idproduit=${commandModel.produit.id_produit}">Go back</a>
                  </form>
                </div>
              </div>
            </div>
          </div>
    </div>
    <%@include file="/vue/footer.jsp"  %>
      <script src="js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>