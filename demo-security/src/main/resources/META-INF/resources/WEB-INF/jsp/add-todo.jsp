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
    
     #Add-task-form .form-group{
       margin-bottom: 20px;
     }
     
     
     #Add-task-form label{
     display:block;
       margin-bottom: 5px;
     }
    
    
     #Add-task-form input{
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
      <h1>Add Task</h1>
       <div id="Add-task-form">
        <form action="add-todo" method="POST">
           <input type="hidden" name="username" id="username" value="${name}"/> 
           <div class="form-Group">
            <label for="name">Description </label>
            <input type="text" name="description" id="description">
           </div>        
            <div class="form-Group">
               <label for="End Date">End Date </label>
               <input type="date" name="targetDate" id="end-date">
           </div>
           <div class="form-Group">
               <label for="is Done">is Done? </label>
              <input type="radio" id="done" name="done" value="true">
              <label for="html">yes</label><br>
              <input type="radio" id="done" name="done" value="false" default>
              <label for="html">no</label>
           </div>        
              <input type="submit" value="Submit" class="btn"/> 
        
        </form>
        </div>
     </div>
  
  
  </body>
</html>