<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Add a new student</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: rgb(171, 199, 244);
			padding: 25px;
			padding-left: 80px;
		}
		#main {
			display: inline-block;
			width: 280px;
		}
		img {
			margin-left: 100px;
			display: inline-block;
			vertical-align: top;
			height: 600px;
			width: 716px;
		}
		#main a {
			font-size: 30px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "main">
			<h1>New Student</h1>
			<br>
			<form:form action = "/students/new/process" method = "post" modelAttribute = "student">
				<form:errors path = "name"/><br>
				<form:label path = "name">Name: </form:label>
				<form:input path = "name"/><br><br>
				<form:errors path = "age"/><br>
				<form:label path = "age">Age: </form:label>
				<form:input path = "age"/><br><br>
				<input type = "submit" value = "Create">
			</form:form>
			<br><br>
			<a href = "javascript:history.back()">Go Back</a>
		</div>
		<img src = "https://derpicdn.net/img/2018/3/26/1690888/medium.png"
		alt = "Student Six looking at you">
		<br><br><br><br><br>
		<h5>Image Source:</h5><a href = "https://www.deviantart.com/cheezedoodle96/art/The-Student-Six-738403961">
		https://www.deviantart.com/cheezedoodle96/art/The-Student-Six-738403961</a>
	</div>
</body>
</html>