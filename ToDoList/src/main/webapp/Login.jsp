<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<link rel ="stylesheet" href="css/bootstrap.css">
</head>
<style>
a{
font-decoration:none;
}
body
{
	background-image:url("web components/mainbb.jpg");
	background-size:cover;
	font-family:"Aclonica",sans-serif;
}
.container{	
	display:flex;
	flex-direction:column;
	align-items:center;
	height:100%;
	width:100%;
}
.loginform{
	display:inline-flex;
	flex-direction:column


}
.loginform>h6{
	position:relative;
	left:24px;
}

h3{
	left:10px;
	font-family:"Arial";
}

#user{
	margin-left:36px;
}

.loginbtn
{
	width:167px;
	position :relative;
	left:69px;
	margin:10px;
}
#login-heading>h3{
	margin:5px auto;
	font-family:monospace;
	margin:8px 70px;;
}

.flex-item1{
	display:inline-flex;
	align-items:center;
	justify-content:center;
	width:328px;
	padding:100px;
	position:relative;
	top:64px;
	left:-64px;
}
#main-heading{
	font-size:60px;
	font-family:cursive;
}

#tagline{
	font-family:monospace;
	margin-left:76px;
	margin-top:-22px;
}
a{
text-decoration:none;
}
</style>
<body>

<div>
<span id="main-heading">EuReka</span>
<div id="tagline"> Aspiration to Achievement...</div>
</div>


<div class="container">
	<div class="flex-item1  p-3 mt-3 shadow p-3 mb-5 bg-body rounded form-floating" >
		<form action="login" class="loginform " method="post">
		<span id="login-heading"><h3>Login here</h3></span>
		<div id="user"><label class="form-label">User</label>: <input type="text" name="user" placeholder="Username" class="border border-primary text-primary rounded"></div>
	    <div id="pass"><label class="form-label">Password</label>: <input type="password"  placeholder="Password" name="pass" class="border border-primary text-primary rounded"></div>
	    
	    
				<input type="submit" value="log In" class="loginbtn btn btn-outline-primary btn-sm">
				
		<h6><a href="Signup.jsp">click here</a> to signup if you are new </h6>
	</form>
</div>
</div>
</body>
</html>