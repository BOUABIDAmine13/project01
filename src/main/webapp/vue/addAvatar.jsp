<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <style>
        .modal-sheet .modal-dialog {
            width: 450px;
            transition: bottom .75s ease-in-out;
        }
        .modal-sheet .modal-footer {
            padding-bottom: 2rem;
        }
        .modal-header{
            justify-content: left;
        }
    </style>
    <title>Add Profile Image</title>
</head>
<body>
<%@include file="/vue/header.jsp" %> 
<%-- <div class="container-fluid">
<div class="row aling-items-center justify-content-center my-5">
	<div class="card mb-3 pt-2 pb-2" style="max-width: 640px;">
	<h5 class="card-title align-self-center">add you image profile</h5>
      <hr>
  <div class="row g-0">
    <div class="col-md-4 ">
      <img src="img/03.jpg" class="img-fluid rounded-circle" alt="userAvatar" style="width: 175px; height: 175px;">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h6 class="card-title">id: ${user.id_user} name:${user.nom}</h6>
        <p class="card-text"><small class="text-muted">email:${user.email}</small></p>
        <form action="uploadAvatar.dz" method="post" enctype="multipart/form-data">
			<input type="hidden" class="form-control" id="pId" name="id_user" value="${user.id_user}">
			<input type="file" name="file" class="form-control mb-3">
			<input type="submit" value="upload" class="btn btn-primary">
		</form>
      </div>
    </div>
  </div>
</div>
</div>
</div> --%>

<div class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin">
        <div class="modal-dialog" role="document">
          <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-3 border-bottom-0">
                <a href="/" class="mb-2 mb-lg-0 text-white text-decoration-none">
                    <svg class="bi me-2 text-white" width="60" height="55" role="img" aria-label="Bootstrap"><use xlink:href="#logo2"/></svg>
                </a>
              <h1 class="fw-bold mb-0 fs-3">add your profile image</h1>
            </div>
            <div class="modal-body p-5 pt-0">
                <div class="text-center">
                    <img class="rounded-circle mb-1" src="img/logo.jpg" width="120" height="120">
                    <h6 class="mb-0">User Name:${user.nom}</h6>
                    <p class="mb-0">email:${user.email}</p>
                </div>
                <hr class="my-2">
              <form class="" action="uploadAvatar.dz" method="post" enctype="multipart/form-data">
              <input type="hidden" class="form-control" id="pId" name="id_user" value="${user.id_user}">
                <div class="mb-3">
                    <label for="formFile" class="form-label">Default image upload</label>
                    <input class="form-control" type="file" id="formFile" name="file">
                  </div>
                <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">upload</button>
              </form>
            </div>
          </div>
        </div>
      </div>
<script type="text/javascript">
	const img = document.querySelector("img"),
	input  = document.querySelector("input[type = 'file']");
	
	input.addEventListener("change", ()=> {
		img.src = URL.createObjectURL(input.files[0]);
	});
</script>
<script src="js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>