<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Create contact</title>
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
			width: 300px;
		}
		img {
			margin-left: 100px;
			display: inline-block;
			vertical-align: top;
		}
		#main a {
			font-size: 30px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "main">
			<h1>New Contact</h1>
			<br>
			<form:form action = "/contact/new/process" method = "post" modelAttribute = "contact">
				<h4>Student: ${student.name}</h4>
				<form:hidden value = "${student.id}" path = "student"/>
				<p><form:errors path = "address"/></p>
				<form:label path = "address">Address: </form:label>
				<form:input path = "address"/>
				<br>
				<p><form:errors path = "city"/></p>
				<form:label path = "city">City: </form:label>
				<form:input path = "city"/>
				<br>
				<p><form:errors path = "state"/></p>
				<form:label path = "state">State: </form:label>
				<form:input path = "state"/><br><br>
				<input type = "submit" value = "Create">
			</form:form>
			<br><br>
		</div>
		<img src = "https://derpicdn.net/img/2012/8/6/68332/medium.jpg"
		alt = "equestria">
	</div>
</body>
</html>