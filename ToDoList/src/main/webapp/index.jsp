<%@page import="dao.GetConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel ="stylesheet" href="css/bootstrap.css">
</head>
<style>
.header{
color:$cyan-100;
margin:1px;
font-family:"Aclonica",sans-serif;
display:"flex";
align-item:center;
justify-content:space-between;
flex-direction:column;
background-color:rgb(132,58,184);
}
body{
	background-image:url("web components/mainbb.jpg");
	background-size:cover;
}

.main-body{
pading:10px;
	display:flex;
	flex-direction:row;
	justify-content:space-between;
	align-items:flex-start;
	margin:0px;
	gap:10px;
	
}
a{
text-decoration:none;
}
.flex-item1{
	display:flex;
	flex-direction:row;
	justify-content:space-between;
	align-items:flex-start;
	margin:0px;
	gap:10px;
}

.data-table{
	text-align:center;
}
</style>
<body>

<%
try{
String usern="";
HttpSession hs= request.getSession();
String user= (String)hs.getAttribute("user");
if(user==null)
{
	PrintWriter pw= response.getWriter();
	pw.write("<html><body><h4>Session expired, login required</h4></body></html>");
	RequestDispatcher rd= request.getRequestDispatcher("Login.jsp");
	rd.include(request, response);
}
else{
	usern=(String)hs.getAttribute("user");
	usern=user.replace('_', ' ');
	hs.setAttribute("usern", usern);
}

%>
<header class="header shadow p-3 mb-5 bg-body rounded navbar bg-light">
<h1  >Welcome <%=usern %></h1> 
</div>
</header>
	<div class="main-body navbar navbar-expand-lg bg-light p-2">
		
		<div class="flex-item1">
			<form action="Add.jsp">
				<input type="submit" class="navbar-brand btn btn-info " value="Add Task">
			</form>
		</div>
		<div class="flex-item2">
		<form action="logout">
			<input type="submit" class="navbar-brand btn btn-info" value="LogOut">
		</form>
		</div>
		</div>	
		<div>
		<section class="data=area">
		<table class="data-table table table-dark table-hover table-active">
		<tr>
		<th>Task</th>
		<th>Priority</th>
		<th>Due Date</th>
		<th>Edit</th>
		<th>Done/Delete</th>
		</tr>
		<%
		Connection con= GetConnection.getConnection();
		 user= (String)hs.getAttribute("user");
		String sql="SELECT * FROM " +user;
		Statement st= con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getInt(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><a href="Edit.jsp?id=<%=rs.getInt(1)%>"><button class="btn btn-info">Edit</button></a></td>
		<td><a href="delete?id=<%=rs.getInt(1)%>"><button class="btn btn-info">Delete</button></a></td>
		</tr>
		<%} 
		con.close();
		
}catch(NumberFormatException e){
	PrintWriter pw= response.getWriter();
	pw.write("<html><body><h4>Invalid Data Input</h4></body></html>");
	RequestDispatcher rd= request.getRequestDispatcher("Add.jsp");
	rd.include(request, response);
	
}
		%>
		</table>
		
		
		</section>
		
		</div>
</body>
</html>



