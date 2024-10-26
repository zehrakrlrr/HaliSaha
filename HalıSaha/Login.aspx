<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="test.Login" %>

<!DOCTYPE html>
<html lang="tr">
<head>
	<title>Kullanıcı Girişi</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="login-form-v1/Login_v1/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login-form-v1/Login_v1/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login-form-v1/Login_v1/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login-form-v1/Login_v1/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="login-form-v1/Login_v1/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login-form-v1/Login_v1/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login-form-v1/Login_v1/css/util.css">
	<link rel="stylesheet" type="text/css" href="login-form-v1/Login_v1/css/main.css">
<!--===============================================================================================-->
    <link href="login-form-v1/Login_v1/css/main.css" rel="stylesheet" />
    <link href="login-form-v1/Login_v1/css/util.css" rel="stylesheet" />
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					 <img src="login-form-v1/__MACOSX/Login_v1/images/bigayazilimanaliz_logo.jpg" />
				</div>
               
				<form class="login100-form validate-form" runat="server">
					<span class="login100-form-title">
						Kullanıcı Girişi
					</span>

					<div class="wrap-input100 validate-input" data-validate = "kullanıcı adı gerekli">
						
						<asp:TextBox ID ="txtUserName"  CssClass="input100" runat="server" placeholder="Kullanıcı Adı"></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Şifre gereklidir">
					<asp:TextBox ID ="TxtSifre"  CssClass="input100" runat="server" placeholder="Şifre"></asp:TextBox>

						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						
						
						<asp:Button ID ="Button1" runat="server" onclick="Button1_Click" Text="Giriş" CssClass="login100-form-btn" />
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Kullanıcı Adı ve Şifre
						</span>
						<a class="txt2" href="#">
							Unuttum
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="#">
							Yeni Hesap Oluştur.
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="login-form-v1/Login_v1/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="login-form-v1/Login_v1/vendor/bootstrap/js/popper.js"></script>
	<script src="login-form-v1/login-form-v1/Login_v1/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<!--===============================================================================================-->
	<script src="login-form-v1/Login_v1/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="login-form-v1/Login_v1/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
    </script>
<!--===============================================================================================-->
	<script src="login-form-v1/Login_v1/js/main.js"></script>

</body>
</html>
