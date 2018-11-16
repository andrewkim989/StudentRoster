<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Main Page - Secret Version!</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
			background-color: rgb(77, 148, 255);
		}
		#message a {
			color: rgb(204, 0, 0);
			text-decoration: none;
			cursor: auto;
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
			<h5>Pst! Hey you! If you see this message and you're one of the staff members, then that's
			great! Feel free to add, edit, or delete the students in the roster! Unless you are
			Rainbow Dash. </h5>
			<h5>If you're one of the students or not affiliated with the School of Friendship at all,
			then I advice that you stay out of this website, please! If you try and mess up with the
			roster, then I'll find you, and I'll cast a memory wipe spell on you so that you'll never
			return to this website again!
			<a href = "https://derpicdn.net/img/view/2013/12/17/499719__safe_artist-colon-dtkraus_edit_twilight+sparkle_the+crystal+empire_animated_creepy_evil_evil+grin_evil+wanker_gendo+pose_hooves+together_pony_p.gif">Muhahahaha!</a></h5>
			<br>
			<h5>-Twilight Sparkle</h5>
		</div>
		<div id = "top">
			<a href = "/students/new">Add a student</a>
			<a href = "/dorms/secret">Dormitories Index</a>
			<a href = "/classes/secret">Classes Index</a>
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
		            <td><a href = "/students/edit/${s.id}">Edit</a> | 
		            	<a href = "/students/delete/${s.id}">Delete</a></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		<img src = "https://derpicdn.net/img/2018/3/25/1690123/medium.png" alt = "outside school">
	</div>
</body>
</html>