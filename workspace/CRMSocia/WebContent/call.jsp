<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/prism.css">
<link rel="stylesheet" href="css/chosen.css">

<title>Insert title here</title>
</head>
<body>
	<span><h1>LLAMADAS</h1></span>
	<input type="button" id="btnConSelect" name="btnConSelect" value="Existente" onclick="pintar(1);">
	<input type="button" id="btnSinSelect" name="btnSinSelect" value="Nuevo" onclick="pintar(0);">
	<div id="form1">
	
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
	<script src="js/chosen.jquery.js" type="text/javascript"></script>
	<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript"> 
		$(document).ready(function(){
			selectClient();
			
		});
			
		
	</script>
</body>
</html>