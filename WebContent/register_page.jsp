<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register page</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/myStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style >
	.banner-background{
	clip-path: polygon(50% 0%, 100% 0, 100% 85%, 88% 100%, 59% 86%, 46% 100%, 12% 87%, 0 100%, 0 0);
	}
</style>


</head>
<body>

<%@ include file="normal_navbar.jsp" %>


	<main class="secondary-background banner-background " style="padding-bottom: 100px ;padding-top: 10px" >
		<div class="container" >
			<div class="col-md-5 offset-md-3">
				
				<div class="card">
					
					<div class="card-header text-center">
						<h3><span class="fa fa-user-plus"></span>Register here !</h3>
					</div>
					
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="POST">
						
							<div class="form-group">
								<label for="user_name">User name</label> 
								<input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter user name">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> 
								<input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
								
							</div>
							
							
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> 
								<input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
							</div>
							
							<div class="form-group">
								<label for="gender">Gender</label> 
								<input type="radio" id="gender" name="gender" value="male">Male
								<input type="radio" id="gender" name="gender" value="female">Female
							</div>
							
							<div class="form-group">
								<textarea name="about" class="form-control" id="" row="5" placeholder="Enter something about you"></textarea>	
							</div>
					
							
							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree to all terms and conditions</label>
							</div>
							
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							<br>
							
							<div id="loader" class="container text-center"  style="display: none;" >
								<span class="fa fa-refresh fa-spin fa-3x"></span>
								<h4>Please wait</h4>
							</div>
								
								
							<button id="submit-btn" type="submit" class="btn btn-primary">Register</button>
							
							
						</form>
					</div>
					
					
				</div>
			</div>
		</div>
	</main>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script >
		$(document).ready(function(){
			
			console.log("loaded !") 
			
			$('#reg-form').on('submit', function(event){
				event.preventDefault() ;
				
				let form = new FormData(this) ;
				
				$("#submit-btn").hide() ;
				$("#loader").show() ;
				
				
				
				// send to register servlet
				$.ajax({
					
					url:"RegisterServlet" ,
					type:'POST' ,
					data: form ,
					success: function (data, textStatus, jqXHR){
					console.log(data) 
					$("#submit-btn").show() ;
					$("#loader").hide() ;
					
					if(data.trim() == 'done'){
						swal("Successfully registered !", "Thank you, you will be redirected to login page", "success").then((value) => {
							window.location = "login_page.jsp" 
					});
					}
					else{
						swal(data) ;
						
					}
					
				},
				
					error: function(jqXHR,textStatus, errorThrown){
 
					$("#submit-btn").show() ;
					$("#loader").hide() ;
					
					swal("Something went wrong please try again later") ;
					
				},
					
				processData : false ,
				contentType: false
		
				});
	
			});

		});
	</script>

</body>
</html>