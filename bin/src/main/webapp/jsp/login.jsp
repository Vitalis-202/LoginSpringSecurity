<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V14</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form action="/login" method="post" class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-32">
						INGRESO
					</span>

					<span class="txt1 p-b-11">
						Usuario
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
						<input class="input100" type="text" name="username" required>
						<span class="focus-input100"></span>
					</div>
					
					<span class="txt1 p-b-11">
						Contraseña
					</span>
					<div class="wrap-input100 validate-input m-b-12" data-validate = "Password is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="password" required>
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-b-48">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Recuerdame
							</label>
						</div>

						<div>
							<a href="#" class="txt3">
								Olvidaste tu contraseña?
							</a>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName }" value="${ _csrf.token }">
					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="Ingresar">
					</div>

				</form>
				<c:if test="${ param.error != null }">
					<p>Datos Incorrectos</p>
				</c:if>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>

	

</body>
</html>