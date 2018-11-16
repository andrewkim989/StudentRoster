<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Edit ${student.name}'s info</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: rgb(171, 199, 244);
			padding: 25px;
			padding-left: 50px;
			height: 640px;
		}
		#main {
			display: inline-block;
			width: 500px;
		}
		img {
			display: inline-block;
			vertical-align: top;
			height: 400px;
			width: 700px;
		}
		#main a {
			font-size: 30px;
		}
		.wrong{
			color: red;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "main">
			<h1>Edit ${student.name}'s Profile</h1>
			<br>
			<div class = "error">
				<c:out value = "${error}"/>
			</div>
			<form action = "/students/edit/${student.id}/process" method = "post">
				Name: <input type = "text" name = "name" value = "${student.name}"><br><br>
				Age: <input type = "number" name = "age" value = "${student.age}"><br><br>
				Address: <input type = "text" name = "address" value = "${student.contact.address}"><br><br>
				City: <input type = "text" name = "city" value = "${student.contact.city}"><br><br>
				State: <input type = "text" name = "state" value = "${student.contact.state}"><br><br>
				<input type = "submit" value = "Edit Student info">
			</form>
			<br><br>
			<a href = "javascript:history.back()">Home</a>
		</div>
		<img src = "https://derpicdn.net/img/2018/9/22/1838514/medium.jpeg" alt = "students">
	</div>
</body>
</html>