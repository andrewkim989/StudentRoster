<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Dormitories List- Secret Version!</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	</script>
	<script> 
		$(document).ready(function(){
		    $("#newform").click(function(){
		        $("#newdorm").slideToggle();
		    });
		    $("#secret").click(function(){
		        $("#sleep").slideToggle();
		    });
		});
	</script>
	<style>
		#wrapper {
			background-color: rgb(171, 199, 244);
			padding: 30px;
		}
		h1 {
			text-align: center;
		}
		#top a {
			font-size: 25px;
			margin-left: 270px;
		}
		img {
			margin: 0px auto;
			display: block;
			padding-top: 30px;
		}
		table {
			border: 1px solid black;
			border-collapse: collapse;
			margin: auto;
			margin-top: 30px;
		}
		th {
			width: 200px;
			text-align: center;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			background-color: rgb(249, 209, 144);
			font-size: 18px;
		}
		tr td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			background-color: rgb(247, 228, 197);
			font-size: 18px;
			text-align: center;
		}
		.error {
			color: rgb(204, 67, 67);
			text-align: center;
		}
		#newdorm {
			background-color: rgb(112, 161, 229);
			width: 300px;
			margin-left: 500px;
			padding: 20px;
			display: none;
			border-radius: 8px;
		}
		#main a {
			padding-left: 5px;
			font-size: 18px;
		}
		.form {
			margin-left: 300px;
			font-size: 24px;
			cursor: pointer; 
			color: rgb(0, 102, 255);
		}
		.form:hover {
			text-decoration: underline;
		}
		#sleep {
			display: none;
			text-align: center;
		}
		#secret:hover {
			cursor: help;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>Dormitories List - Staff Version</h1>
		<div id = "top">
			<a href = "/students/secret">Back to Students List</a>
			<span class = "form" id = "newform">Add a new dormitory</span>
		</div>
		<div id = "main">
			<div class = "error">
				<c:out value = "${error}"/>
			</div>
			<div id = "newdorm">
				<form action = "/dorms/create" method = "post">
					Name: <input type = "text" name = "name"><br><br>
					<input type = "submit" value = "Create Dormitory">
				</form>
			</div>
			<table>
			    <thead>
			        <tr>
			            <th>Name</th>
			            <th id = "secret">Number of Students</th>
			            <th>Actions</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items = "${dormitories}" var = "d">
			        <tr>
			            <td><a href = "/dorms/${d.id}">${d.name}</a></td>
			            <td>${fn:length(d.students)}</td>
			            <td><a href = "/dorms/edit/${d.id}">Edit</a> | 
		            		<a href = "/dorms/delete/${d.id}">Delete</a></td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
		</div>
		<div id = "sleep">
			<img src = "https://derpicdn.net/img/2018/9/29/1843845/medium.jpeg" alt = "sleeping">
			<h3>You have found a secret!</h3>
		</div>
		<img src = "https://derpicdn.net/img/2018/4/3/1697928/medium.png" alt = "Maud's room">
	</div>
</body>
</html>