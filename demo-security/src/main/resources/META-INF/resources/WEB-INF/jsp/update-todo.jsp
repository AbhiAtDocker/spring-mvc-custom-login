<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
     <%@ include file="./common/header.jspf" %>  
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
    
     <jsp:include page="header.jsp"/> 
     <div id="container">
      <h1>Add Task</h1>
       <div id="Add-task-form">
        <form:form action="update-todo" method="POST" modelAttribute="todo">
           <form:hidden path="username"/> 
           <form:hidden path="id"/> 
           <div class="form-Group">
            <form:label path="description">Description </form:label>
            <form:input type="text" path="description" />
           </div>        
            <div class="form-Group">
               <form:label path="targetDate">End Date </form:label>
               <form:input type="date" path="targetDate" />
           </div>
           <div class="form-Group">
              <form:label path="done">is Done? </form:label>
              <form:radiobutton path="done" value="true" label="yes"/>
              <form:radiobutton path="done" value="false"  label="no"/>
             
           </div>        
              <input type="submit" value="Submit" class="btn"/> 
        
        </form:form>
        </div>
     </div>
  
  
  </body>
</html>