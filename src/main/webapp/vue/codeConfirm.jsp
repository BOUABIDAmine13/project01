<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <title>home page</title>
</head>
<body >
    <div class="container-fluid">
        <div class="row aling-items-center justify-content-center my-5">
          <div class="col-md-5">
              <div class="card border-primary mb-3 bg-light" style="width: 35rem;">
                  <div class="card-header text-bg-primary h5">confirm</div>
                  <div class="card-body">
                    <p class="card-text">number of 6 has been send to you email</p>
                    <form action="conformCode.dz" method="post">
                    <div class="row aling-items-center justify-content-center opt-bx">
                      <input type="text" class="col-1 form-control d-inline-flex mb-2 ms-1 me-1" maxlength="1" style="width: 40px;" name="nb1">
                      <input type="text" class="col-1 form-control d-inline-flex mb-2 ms-1 me-1" maxlength="1" style="width: 40px;" name="nb2">
                      <input type="text" class="col-1 form-control d-inline-flex mb-2 ms-1 me-1" maxlength="1" style="width: 40px;" name="nb3">
                      <input type="text" class="col-1 form-control d-inline-flex mb-2 ms-1 me-1" maxlength="1" style="width: 40px;" name="nb4">
                      <input type="text" class="col-1 form-control d-inline-flex mb-2 ms-1 me-1" maxlength="1" style="width: 40px;" name="nb5">
                      <input type="text" class="col-1 form-control d-inline-flex mb-2 ms-1 me-1" maxlength="1" style="width: 40px;" name="nb6">
                    </div>
                    <button class="btn btn-outline-primary me-3" type="submit" id="button-addon2">Conform</button>
                    <a href="#" class="card-link">resend</a>
                    </form>
                
                  </div>
                </div>
          </div>
      </div>
        </div>
      <script>
        const inputs = document.querySelectorAll(".opt-bx input");
        inputs.forEach((input,index)=>{
          input.dataset.index = index;
          input.addEventListener("paste",handleOtppaste);
          input.addEventListener("keyup",handleOtp);
        });
        function handleOtppaste(e){
          const data = e.clipboardData.getData("text");
          const value = data.split("");
          if(value.length === inputs.length) {
            inputs.forEach((input,index) => (input.value = value[index]));
            //submit();
          }
        }
        function handleOtp(e){
          const input = e.target;
          let value = input.value;
          input.value = "";
          input.value = value ? value[0] : "";
          let filedIndex = input.dataset.index;
          if(value.length > 0 && filedIndex < inputs.length-1){
            input.nextElementSibling.focus();
          }
          if(e.key === "Backspace" && filedIndex >0) {
            input.previousElementSibling.focus();
          }
          if(filedIndex == inputs.length-1){
            //submit();
          }
        }

        /*function submit() {
          console.log("submeting..");
          let opt = "";
          inputs.forEach((input) => {
            opt+=input.value;
            input.disabled = true;
            input.classList.add("disabled");
          });
          console.log(opt);
        }*/

      </script> 
<script src="js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>  