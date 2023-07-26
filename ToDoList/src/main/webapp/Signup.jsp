<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup page</title>
<link rel ="stylesheet" href="css/bootstrap.css">
</head>
<body>
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
	margin-left:-6px;
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
	margin:10px 10px;;
}

.flex-item1{
	display:inline-flex;
	align-items:center;
	justify-content:center;
	width:360px;
	padding:100px;
	position:relative;
	top:64px;
	left:-64px;
	box-shadow:0 0 10 green;
}
#main-heading{
	font-size:60px;
	font-family:cursive;
}

#tagline{
	font-family:monospace;
	margin-left:76px;
	margin-top:-20px;
}
#mobile{
	margin-left:23px;
}
.back-btn{
display:inline;
width:56px;
position:relative;
top:41px;
left:17px;
}

#back-btn{
text-decoration:none;
}

</style>
<div>
<span id="main-heading">EuReka</span>
<div id="tagline"> Aspiration to Achievement...</div>
</div>


<div class="container">
	<div class="flex-item1  p-3 mt-3 shadow p-3 mb-5 bg-body rounded form-floating" >
		<form action="signup" class="loginform " method="post">
		<span id="login-heading"><h3>journey begins...</h3></span>
		<div id="user"><label class="form-label">UserName</label>: <input type="text" name="user" placeholder="Username" class="border border-success text-success rounded" ></div>
	    <div id="pass"><label class="form-label">Password</label>: <input type="password"  placeholder="Password" name="pass" class="border border-success text-success rounded"></div>
	     <div id="mobile"><label class="form-label signup-mobile-input">Mobile</label>: <input type="number"  placeholder="Mobile" name="mobile" class="border border-success text-primary rounded"></div>
			<a href="Login.jsp" id="back-btn">	<input type="button" value="Back"  class="back-btn btn btn-outline-success btn-sm"></a>
				<input type="submit" value="sign up" class="loginbtn btn btn-outline-success btn-sm">
			</form>
</div>
</div>
</body>
</html>
</body>
</html>