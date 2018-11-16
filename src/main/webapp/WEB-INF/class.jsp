<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>${c.className}</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	</script>
	<script> 
		$(document).ready(function(){
		    $("#secret").click(function() {
                $("img").attr("src", $("img").attr("data-alt-src"));
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
		h2 {
			text-align: center;
		}
		#top {
			margin: 20px;
		}
		#top a {
			font-size: 25px;
			margin-left: 140px;
		}
		img {
			margin: 0px auto;
			display: block;
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
			padding-left: 100px;
			padding-right: 100px;
			background-color: rgb(171, 130, 229);
			font-size: 18px;
		}
		tr td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			text-align: center;
			background-color: rgb(220, 211, 234);
			font-size: 18px;
		}
		#addstudent {
			text-align: center;
			padding-bottom: 15px;
		}
		#secret {
			width: 800px;
			height: 30px;
			margin: 0 auto;
		}
		#secret:hover {
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>${c.className} - ${c.instructorName}</h1>
		<div id = "top">
			<a href = "/classes">Back to Classes List</a>
			<a href = "/classes/edit/${c.id}">Edit Class Information</a>
			<a href = "/students">Back to Students List</a>
		</div>
		<div id = "main">
			<div id = "addstudent">
				<h2>Add Student</h2>
				<form action = "/classes/${c.id}/addstudent" method = "post">
					<select name = "name">
						<c:forEach items = "${menu}" var = "m">
							<option value = "${m.name}">${m.name}</option>
						</c:forEach>
					</select>
					<input type = "submit" value = "Add">
				</form>
			</div>
			<h2>Students taking this class</h2>
			<table>
			    <thead>
			        <tr>
			            <th>Name</th>
			            <th>Action</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items = "${c.getStudents()}" var = "s">
			        <tr>
			            <td><a href = "/students/${s.id}">${s.name}</a></td>
			            <td><a href = "/classes/${c.id}/dropclass/${s.id}">Remove</a></td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
			<div id = "secret"></div>
			<img src = "https://derpicdn.net/img/2018/3/25/1690158/medium.png" alt = "Twilight's classroom"
			data-alt-src = "https://derpicdn.net/img/2018/8/19/1810841/medium.jpeg">
		</div>
	</div>
</body>
</html>