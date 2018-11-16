<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>${dormitory.name}</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
			margin-left: 130px;
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
			padding-left: 15px;
			padding-right: 300px;
			background-color: rgb(242, 128, 238);
			font-size: 18px;
		}
		tr td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			background-color: rgb(239, 201, 238);
			font-size: 18px;
		}
		#addstudent {
			padding-top: 20px;
			text-align: center;
		}
		#secret:hover {
			cursor: auto;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>${dormitory.name}</h1>
		<div id = "top">
			<a href = "/dorms">Back to Dormitory List</a>
			<a href = "/dorms/edit/${dormitory.id}">Edit Dormitory Name</a>
			<a href = "/students">Back to Students List</a>
		</div>
		<div id = "main">
			<div id = "addstudent">
				<form action = "/dorms/${dormitory.id}/addstudent">
				<select name = "name">
					<c:forEach items = "${menu}" var = "m">
						<option value = "${m}">${m}</option>
					</c:forEach>
				</select>
				<br><br>
				<input type = "submit" value = "Add">
			</form>
			</div>
			<table>
			    <thead>
			        <tr>
			            <th>Name</th>
			            <th>Action</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items = "${added}" var = "s">
			        <tr>
			            <td><a href = "/students/${s.id}">${s.name}</a></td>
			            <td><a href = "/dorms/${dormitory.id}/removestudent/${s.id}">Remove</a></td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
		</div>
		<a href = "https://www.youtube.com/watch?v=Oa6_ZMBFUpQ" target = "_blank" id = "secret">
		<img src = "https://derpicdn.net/img/2015/7/12/935945/medium.png" alt = "Luna's room"></a>
	</div>
</body>
</html>