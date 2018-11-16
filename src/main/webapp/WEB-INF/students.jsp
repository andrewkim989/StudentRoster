<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Main Page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	    $(document).ready(function() {
	        $("#secret").click(function () {
	        	console.log("hi");
	        	$("#secretmessage").show();
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
		#message {
			width: 1000px;
			margin: 10px;
			margin-left: 150px;
			padding: 15px;
			border-radius: 10px;
			color: black;
			background-color: rgb(77, 148, 255);
		}
		#message a {
			color: black;
		}
		#secret:hover {
			cursor: pointer;
		}
		#secretmessage {
			display: none;
		}
		#top {
			font-size: 25px;
		}
		#top a {
			margin-left: 190px;
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
			text-align: left;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			padding-left: 10px;
			padding-right: 150px;
			background-color: rgb(66, 244, 223);
			font-size: 18px;
		}
		tr td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			background-color: rgb(237, 241, 248);
			font-size: 18px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "message">
			<h3>Welcome to the School of Friendship Student Roster!</h3>
			<h5>This website is used to keep track of all of the students currently enrolled
			in the School of Friendship created by Twilight Sparkle. (That's me!)</h5>
			<h5>Feel free to add new students or edit student's information if you need to!
			Enjoy your stay, and please don't screw up the roster! I spent so many hours trying
			to add all of the students to this website, and I would hate it if somebody
			messed up all of the hard work I put on this site! =(</h5>
			<br>
			<h5 id = "secret">-Twilight Sparkle</h5>
			<div id = "secretmessage">
				<h5>P.S.: There are 10 secrets me and my friends put on this website. You found the
				first one. Can you find the rest?</h5>
				<h5>Hint: One of them is in the front page. The other eight secrets are placed in
				web pages with tables in them.</h5>
				<h5>Hint 2: Not all of the pages can be accessed by clicking on the links provided on
				the website. Try adding something "secret" in the URL to access them!</h5>
				<h5>Good luck!</h5>
			</div>
		</div>
		<div id = "top">
			<a href = "/students/new">Add a student</a>
			<a href = "/dorms">Dormitories Index</a>
			<a href = "/classes">Classes Index</a>
		</div>
		<table>
		    <thead>
		        <tr>
		            <th>Name</th>
		            <th>Age</th>
		            <th>Address</th>
		            <th>City</th>
		            <th>State</th>
		            <th>Actions</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items = "${students}" var = "s">
		        <tr>
		            <td><a href = "/students/${s.id}">${s.name}</a></td>
		            <td>${s.age}</td>
		            <td>${s.contact.address}</td>
		            <td>${s.contact.city}</td>
		            <td>${s.contact.state}</td>
		            <td><a href = "/students/edit/${s.id}">Edit</a></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		<img src = "https://derpicdn.net/img/2018/4/3/1697700/medium.jpeg" alt = "all students">
	</div>
</body>
</html>