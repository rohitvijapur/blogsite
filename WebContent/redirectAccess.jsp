
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>redirected</title>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"crossorigin="anonymous">
<link href="css/myStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style >
	.banner-background{
	clip-path: polygon(50% 0%, 100% 0, 100% 85%, 88% 100%, 59% 86%, 46% 100%, 12% 87%, 0 100%, 0 0);
	}
	body{
		background:url(img/dark.jpg);
		background-size: cover ;
		background-attachment: fixed ;
		
	}
	.written{
		border-bottom: 1px solid #e2e2e2 ;
	}

	.lining{
		margin-bottom:20px ; 
	}
</style>


</head>
<body>
	<%@ include file="normal_navbar.jsp"%>
		
		<div class="container written text-center text-white">
		<h3>Please login to access the contents </h3>
			<a href="login_page.jsp" class="btn btn-outline-light btn-lg lining">
					<span class="	fa fa-user-circle"></span> Login
				</a>
		</div>
		
	
</body>
</html>