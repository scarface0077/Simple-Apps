<%@page import="dao.GetConnection"%>
<%@page import="dao.EditDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Tasks</title>
<link rel ="stylesheet" href="css/bootstrap.css">
</head>
<style>
.data-table{
text-align:center;
}
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
*
{
margin:0px;
padding:0px;
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

div{
display:inline;}

.data-area{
display:flex;
border:1px solid black;
position:relative;
left: -25px;
align-items:center;
justify-content:space-evenly;
margin:5px;

}
.task{
	width:400px;
	display:inline;
}
.task-row{
display:flex;
flex-direction:row;
justify-content:space-between;
}

.add-item{
margin-left:10px}

.addtask{
height:24px;
padding:2px;
margin-left:5px;
}
</style>

<body>
<%
HttpSession hs= request.getSession();
if( hs.getAttribute("user")==null)
{
	PrintWriter pw= response.getWriter();
	pw.write("<html><body><h4>Session expired, login required</h4></body></html>");
	RequestDispatcher rd= request.getRequestDispatcher("Login.jsp");
	rd.include(request, response);
}

%>
<header class="header shadow p-3 mb-5 bg-body rounded navbar bg-light">
<h1  >Welcome <%=hs.getAttribute("usern") %></h1> 
</div>
</header>
	<div class="main-body navbar navbar-expand-lg bg-light p-2">
		
		<div class="flex-item1">
			<form action="index.jsp">
				<input type="submit" class="navbar-brand btn btn-info " value="Back">
			</form>
		</div>
		<div class="flex-item2">
		<form action="logout">
			<input type="submit" class="navbar-brand btn btn-info" value="LogOut">
		</form>
		</div>
		</div>	
		<%
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		ResultSet rs= EditDao.editDetails(id,hs);
		if(rs==null) System.out.println("rs is null");
		rs.next();
		%>
		<section class="data-area rounded border form-group ">
<form action="edit" method="post">
	<input type="number" name="id" class="task add-item rounded" value="<%= rs.getInt(1) %>" hidden>
	<input type="text" name="task" class="add-item rounded"  value="<%= rs.getString(2) %>">
	<input type="number" name="priority" class="add-item rounded" min=1 max=5 value="<%= rs.getInt(3) %>">
	<input type="text" name="date" class="add-item rounded"  value="<%= rs.getString(4) %>">
	<input type="submit" class="addtask btn btn-sm btn-success" value="Update">
</form>
			
		
		
	
	
		</section>
	<section class="dataarea">
		<table class="data-table table table-dark table-hover table-active rounded ">
		<tr>
		<th>Task</th>
		<th>Priority</th>
		<th>Due Date</th>
		<th>Edit</th>
		<th>Done/Delete</th>
		</tr>
		<%
		Connection con= GetConnection.getConnection();
		String user= (String)hs.getAttribute("user");
		String sql="SELECT * FROM " +user;
		Statement st= con.createStatement();
		ResultSet rs1=st.executeQuery(sql);
		while(rs1.next()){
		%>
		<tr>
		<td><%=rs1.getString(2) %></td>
		<td><%=rs1.getInt(3) %></td>
		<td><%=rs1.getString(4) %></td>
		<td><a href="Edit.jsp?id=<%=rs1.getInt(1)%>"><button class="btn btn-info">Edit</button></a></td>
		<td><a href="delete?id=<%=rs1.getInt(1)%>"><button class="btn btn-info">Delete</button></a></td>
		</tr>
		<%}
		con.close();
		%>
		</table>
		
		
		</section>
</body>
</html>














