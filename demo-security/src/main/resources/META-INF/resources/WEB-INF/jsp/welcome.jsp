<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
 <title>
   Welcome Page
 </title>
 <%@ include file="./common/header.jspf" %>  
</head>
<body>
   <jsp:include page="header.jsp">  
     <jsp:param name="name" value="${name}" />  
</jsp:include>
  <div id="message">
  <h2>Welcome! <span>${name}</span></h2>
  <a href="/get-todo-list?user=${name}" class="btn-1">Manage Your TODO List</a>
 </div>
</body>




</html>