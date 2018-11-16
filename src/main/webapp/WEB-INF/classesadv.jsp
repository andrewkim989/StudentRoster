<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>All Classes</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	</script>
	<script> 
		$(document).ready(function(){
		    $("#newform").click(function(){
		        $("#newclass").slideToggle();
		    });
		    $("#secret").click(function(){
		        $("#secretdiv").slideToggle();
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
			text-align: center;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			width: 200px;
			background-color: rgb(67, 198, 194);
			font-size: 18px;
		}
		tr td {
			border: 1px solid black;
			border-collapse: collapse;
			text-align: center;
			padding: 10px;
			background-color: rgb(170, 224, 222);
			font-size: 18px;
		}
		#main a {
			padding-left: 5px;
			font-size: 18px;
		}
		.error {
			color: rgb(204, 67, 67);
			text-align: center;
		}
		#newclass {
			background-color: rgb(191, 72, 214);
			width: 300px;
			margin-left: 500px;
			padding: 20px;
			display: none;
			border-radius: 8px;
		}
		#secretdiv {
			background-color: rgb(255, 77, 136);
			width: 300px;
			margin-left: 500px;
			padding: 15px;
			display: none;
			border-radius: 8px;
			color: white;
		}
		.form {
			margin-left: 280px;
			font-size: 24px;
			cursor: pointer; 
			color: rgb(0, 102, 255);
		}
		.form:hover {
			text-decoration: underline;
		}
	</style>
	
</head>
<body>
	<div id = "wrapper">
		<h1>Classes List - Staff Version</h1>
		<div id = "top">
			<span class = "form" id = "secret">Back to Students List</span>
			<span class = "form" id = "newform">Add a new class</span>
		</div>
		<div id = "main">
			<div class = "error">${error}</div>
			<div id = "secretdiv">
				<p>Wow! You're really good at finding the secrets on this website!</p>
				<p>-Pinkie Pie</p>
			</div>
			<div id = "newclass">
				<form action = "/classes/create" method = "post">
					Class name: <br><input type = "text" name = "className"><br><br>
					Instructor name: <input type = "text" name = "instructorName"><br><br>
					<input type = "submit" value = "Create class">
				</form>
			</div>
			<table>
			    <thead>
			        <tr>
			            <th>Name</th>
			            <th>Instructor</th>
			            <th>Number of Students</th>
			            <th>Actions</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items = "${classes}" var = "c">
			        <tr>
			            <td><a href = "/classes/${c.id}">${c.className}</a></td>
			            <td>${c.instructorName}</td>
			            <td>${fn:length(c.students)}</td>
			            <td><a href = "/classes/edit/${c.id}">Edit</a> | 
		            		<a href = "/classes/delete/${c.id}">Delete</a></td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
		</div>
		<img src = "https://derpicdn.net/img/2018/6/2/1747908/medium.jpeg" alt = "Oh dragon my dragon">
	</div>
</body>
</html>