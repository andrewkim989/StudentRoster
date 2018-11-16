<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Edit Dormitory</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: rgb(171, 199, 244);
			padding: 25px;
			padding-left: 80px;
			height: 650px;
		}
		#main {
			display: inline-block;
			width: 280px;
		}
		img {
			margin-left: 100px;
			display: inline-block;
			vertical-align: top;
		}
		#main a {
			font-size: 30px;
		}
		.error {
			color: rgb(204, 67, 67);
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "main">
			<h1>Edit Dormitory</h1>
			<br>
			<div class = "error">${error}</div>
			<form action = "/dorms/edit/${dormitory.id}/process" method = "post">
				Name: <input type = "text" name = "name" value = "${dormitory.name}"><br><br>
				<input type = "submit" value = "Edit">
			</form>
			<br><br>
			<a href = "javascript:history.back()">Go Back</a>
		</div>
		<img src = "https://derpicdn.net/img/2017/5/18/1439192/medium.jpeg" alt = "Starlight's room">
	</div>
</body>
</html>