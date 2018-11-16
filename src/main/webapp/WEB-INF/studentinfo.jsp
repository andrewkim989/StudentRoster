<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>${student.name}'s profile</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: rgb(171, 199, 244);
			padding-left: 30px;
			padding-bottom: 30px;
			padding-top: 10px;
		}
		#top {
			margin-left: 50px;
			margin-bottom: 30px;
		}
		#upper {
			margin-bottom: 20px;
		}
		#upper a {
			font-size: 25px;
			margin-left: 50px;
		}
		#top h1 {
			display: inline-block;
		}
		.next {
			display: inline-block;
			font-size: 30px;
			margin-left: 30px;
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
		}
		th {
			text-align: center;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			padding-left: 75px;
			padding-right: 75px;
			background-color: rgb(122, 237, 104);
			font-size: 18px;
		}
		tr td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			background-color: rgb(190, 242, 188);
			font-size: 18px;
		}
		#main {
			margin-left: 50px;
		}
		#studentinfo {
			display: inline-block;
			width: 400px;
		}
		#schedule {
			text-align: center;
			display: inline-block;
			vertical-align: top;
		}
		#addclass {
			text-align: center;
			padding-bottom: 20px;
		}
		#bottom {
			text-align: center;
		}
		#secretdiv {
			margin-left: 50px;
			width: 1000px;
		}
		#secretdiv a {
			display: block;
			height: 30px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "secretdiv"><a href = "https://derpicdn.net/img/view/2012/1/2/7__safe_edit_edited+screencap_screencap_fluttershy_a+bird+in+the+hoof_always+works_animated_artifact_bad+poker+face_book_bookcase_bookshelf_breaking+th.gif" target = "_blank"></a></div>
		<div id = "upper">
			<a href = "/students">Back to Students List</a>
		</div>
		<div id = "top">
			<h1>${student.name}'s Profile</h1>
			<a href = "/students/edit/${student.id}" class = "next">Edit Profile</a>
		</div>
		<div id = "main">
			<div id = "studentinfo">
				<h5>Age: ${student.age}</h5>
				<h5>Contact Information: </h5>
				<p>${student.contact.address}</p>
				<p>${student.contact.city}, ${student.contact.state}</p>
				<h5>Dormitory:</h5>
				<p><a href = "/dorms/${student.dormitory.id}">${student.dormitory.name}</a></p>
				<br>
				<h4>Add a new course</h4>
				<form action = "/students/${student.id}/addclass" method = "post">
					<select name = "name">
						<c:forEach items = "${menu}" var = "m">
							<option value = "${m.className}">${m.className}</option>
						</c:forEach>
					</select>
					<input type = "submit" value = "Add">
				</form>
			</div>
			<div id = "schedule">
				<h3>${student.name}'s Schedule</h3>
				<table>
				    <thead>
				        <tr>
				            <th>Class Name</th>
				            <th>Instructor</th>
				            <th>Action</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach items = "${student.getClasses()}" var = "c">
				        <tr>
				            <td><a href = "/classes/${c.getId()}">${c.getClassName()}</a></td>
				            <td>${c.getInstructorName()}</td>
				            <td><a href = "/students/${student.id}/dropclass/${c.id}">Drop</a></td>
				        </tr>
				        </c:forEach>
				    </tbody>
				</table>
			</div>
		</div>
		<br><br>
		<img src = "https://derpicdn.net/img/2018/3/31/1695599/medium.png" alt = "student six">
		<div id = "bottom">
			<h5>Source Image:</h5>
			<a href = "https://www.deviantart.com/cheezedoodle96/art/The-Student-Six-738403961">
			https://www.deviantart.com/cheezedoodle96/art/The-Student-Six-738403961</a>
		</div>
	</div>
</body>
</html>