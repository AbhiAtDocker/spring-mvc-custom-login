<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
  <head>
  
     <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
      integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    /> 
    <title>Login Page</title>
    <style>
    
    #container{
    border: #333 solid 1px;
    width:50%;
    padding: 10px;
    margin:0 auto;
   
    
    }
    
     #login-form .form-group{
       margin-bottom: 20px;
     }
     
     
     #login-form label{
     display:block;
       margin-bottom: 5px;
     }
    
    
     #login-form input{
       padding: 10px;
       width:100%;
     }
    
    .btn:hover{
    background-color: lightyellow;
    }
  
    
    </style>
     
  </head>
  <body>
     <div id="container">
       ${param} === > ${param.error} ==== ${param.logout} 
       <div class="error">
           <c:if test="${param eq 'error'}">
			Invalid username and password.
			</c:if>
		</div>
		<div class="logout"> 
		   <c:if test="${param == 'logout'}">
			You have been logged out.
		   </c:if>
		</div>
      <h1>Login Form</h1>
       <div id="login-form">
        <form action="login" method="POST">
           <div class="form-Group">
            <label for="name">Name </label>
            <input type="text" name="username" id="name">
           </div>        
            <div class="form-Group">
               <label for="password">Password </label>
               <input type="password" name="password" id="password">
           </div>        
              <input type="submit" value="Submit" class="btn"/> 
        
        </form>
        </div>
     </div>
  
  
  </body>
</html>