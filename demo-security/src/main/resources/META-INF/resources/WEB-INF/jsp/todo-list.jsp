<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
    <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet" >
		<link href="webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css" rel="stylesheet" >
		
		<title>List</title>
		<%@ include file="./common/header.jspf" %> 
		<style type="text/css">
		table{
		margin:auto;
		}
		
		   th{
		   padding:20px;
		   font-size:25px;
		   
		   }
		   
		   td{
		     padding:20px;
		   }
		   #table-todo thead{
		     border-bottom: 1px dotted black;
		     margin-bottom:20px;
		   }
		
		
		.btn{
		   
		  margin-left:10px;
		   margin-top:20px;
		
		}
		
		#container .center{
		max-width:700px;
		margin:auto;
		text-align: center
			}
			
			#container .center a{
			display:flex;
			align-items:center;
			justify-content: center;
			text-align:center;
			}
		</style>
		
   </head>
   <body>
     <jsp:include page="header.jsp">  
        <jsp:param name="name" value="${name}" />  
     </jsp:include>
      <div id="container">
         <table id="table-todo">
          <thead>
				<th>Id</th>
				<th>User</th>
				<th>Course</th>
				<th>End Date</th>
				<th>is Done?</th>
				<th>Update</th>
				<th>Delete</th>
		 	</thead>
            <tbody>
              <c:forEach var="todo" items="${todoList}">
              <tr>
                <td>${todo.id}</td>
                <td>${todo.username}</td>
                <td>${todo.description}</td>
                <td>${todo.targetDate}</td>
                <td>${todo.done}</td>
                 <td><a href="/update-task?id=${todo.id}" class="btn btn-success">Update</button></td>
                <td><a href="/delete-todo?id=${todo.id}" class="btn btn-warning">Delete</td>
               
              </tr>
              </c:forEach>
           </tbody>
         </table>
         <!-- open in form  -->
         <div class="center">
           <a href="/add-task?username=${name}" class="btn btn-success">Add TODO</a>
         </div>
      </div>  


    </body>
</html>