<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Student Roster Home Page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	    $(document).ready(function() {
	        $("img").hover(function() {
	        	$(this).attr("src", "https://derpicdn.net/img/2018/10/14/1856553/medium.png");
	        },
	        function(){
	        	$(this).attr("src", "https://derpicdn.net/img/2018/3/25/1690104/medium.png");
	        });
	    });
	</script>
	
	<style>
		#wrapper {
			background-color: rgb(171, 199, 244);
			text-align: center;
			padding: 20px;
		}
		a {
			font-size: 40px;
			color: black;
		}
		a:hover {
			text-decoration: none;
			color: black;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>The School of Friendship's Student Roster</h1>
		<br>
		<a href = "/students"><img src = "https://derpicdn.net/img/2018/3/25/1690104/medium.png"
		alt = "school of friendship"></a>
		<br><br>
		<h1><a href = "https://www.youtube.com/watch?v=8S14h4Wn4PY" target = "_blank">
		Click on the image to enter!</a></h1>
	</div>
</body>
</html>