<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>CRM-Socia</title>
	<script src="js/jquery.min.js"></script>
	<script src="js/script.js"></script>
</head>
<body>
	<span><h1>Login de prueba</h1></span>
	<form>
		<table>
			<tr>
				<td>Usuario: </td>
				<td><input type="text" id="user" name="user"></td>
			</tr>
			<tr>
				<td>Contraseņa: </td>
				<td><input type="password" id="passwd" name="passwd" ></td>
			</tr>
			<tr id="mostrar">
				<td colspan="2" id="result"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="btnLogin" name="btnLogin" value="Entrar" onclick="validar();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>