<%@page import="metier.entities.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/vue/svgs.jsp"  %>
      <header class="navber p-3 text-bg-dark">
        <div class="container">
          <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="index.dz" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
              <svg class="bi me-2 text-white" width="50" height="45" role="img" aria-label="Bootstrap"><use xlink:href="#logo"/></svg>
            </a>
            <ul class="nav me-3 col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
              <li><a href="index.dz" class="nav-link px-2 text-secondary">Home</a></li>
              <li><a href="charche.dz?motcle=" class="nav-link px-2 text-white">Products</a></li>
              <li><a href="DeliveryForm.dz" class="nav-link px-2 text-white">Delivery</a></li>
              <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
              <li><a href="#" class="nav-link px-2 text-white">About</a></li>
            </ul>
    
            <form class="d-inline-flex w-50 col-8 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search" action="charche.dz" method="get">
              <input type="search" class="form-control form-control-dark text-bg-dark w-75" placeholder="Search..." aria-label="Search" name="motcle">
              <button class="btn btn-warning ms-2">Search</button>
            </form>
    
            <div class="text-end ms-3">
            <%
            	User user = null;
				if(session.getAttribute("user") == null){%>
              <a href="login.dz" class="btn btn-outline-light me-2">Login</a>
              <a href="signup.dz" class="btn btn-success">SignUp</a>
              <%}else {
				user = (User)session.getAttribute("user");
				String userName = null;
				String sessionID = null;
				Cookie[] cookies = request.getCookies();
				if(cookies != null){
					for(Cookie cookie : cookies){
						if(cookie.getName().equals("user")) userName = cookie.getValue();
						if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
					}%> 
              <a href="/" class=" text-decoration-none">
                <img src="${user.urlImg}" class="bi me-2 rounded-circle" width="50" height="45">
              </a>
              <a href="logout.dz" class="btn btn-outline-light me-2">Logout</a>
              <%}}				%>
            </div>
          </div>
        </div>
      </header>