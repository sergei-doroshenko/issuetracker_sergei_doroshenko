<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="org.training.issuetracker.domain.User" %>

<div class="logo">
	<h2>Issue Tracker</h2>
</div><!--end logo-->
<div id="user-info" class="user-info">
	
	<div id="error"></div>
     <form id="auth-form">
     <% 
		User user = (User) session.getAttribute("user");
		if (user == null) {
	%>		
	        <label>Name:</label>
	        <input name="login" id="login" class="login" type="text" value="My name"/>
	        <label>Password:</label>
	        <input name="password" id="password" class="password" type="password" />
	        <input id="authsubmit" class="authsubmit" type="submit" value="Log in" />
	   <% } else { %>
	   		<a class="logout" href="'details.jsp?id=<%=user.getId() %>&action=openUser"><%= user.getFirstName() + " " + user.getLastName() %></a>
	      	<a href="Login.do" class="logout">log out</a>
	   <%  } %>           
     </form>
    
</div><!--end user-info-->
		