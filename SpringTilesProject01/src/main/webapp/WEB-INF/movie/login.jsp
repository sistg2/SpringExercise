<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link href="../css/chat.css" rel="stylesheet">
<script src="../vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.login').click(function(){
		var id = $('#id').val();
		if(id.trim()=="") {
			$('#id').focus();
			return;
		}
		var pwd = $('#password').val();
		if(pwd.trim()=="") {
			$('#password').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/login_ok.do',
			data:{id:id, pwd:pwd},
			success:function(response) {
				var res = response.trim();
				if(res=="NOID") {
					alert("Wrong ID!!");
					$('#id').val("");
					$('#password').val("");
					$('#id').focus();
				} else if (res=="NOPWD") {
					alert("Wrong Password!!");
					$('#password').val("");
					$('#password').focus();
				} else {
					location.href="../main/main.do";
				}
			}
		});
	});
});
</script>
</head>
<body class="bg-gradient-primary">
<div class="container">
	<!-- Outer Row -->
	<div class="row justify-content-center">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-12">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Login</h1>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user" id="id" placeholder="ID">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-user" id="password" placeholder="Password">
								</div>
								<input type="button" class="btn btn-primary btn-user btn-block login" value="Login" >
								<hr>
								<div class="text-center">
									<a class="small" href="#">Create an Account!</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>
<!-- Bootstrap core JavaScript-->
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>
</body>
</html>