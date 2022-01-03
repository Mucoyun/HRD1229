<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style>
		*{
			margin: 0; padding: 0;
		}
		a{
			text-decoration: none;
			color: white;
			font-weight: bold;
		}
		a:HOVER{
			color: red;
			font-weight: bold;
		}
		html, body{
			width: 100%;
			height: 100%;
			overflow: hidden;
		}
		header{
			width: 100%;
			height: 10%;
			background-color: blue;
			color: white;
			text-align: center;
			position: relative;
		}header h1{
			position: absolute;
			top: 50%; left: 50%;
			transform: translate(-50%, -50%);
			width: 100%;
		}
		
		nav{
			width: 100%;
			height: 5%;
			background-color: purple;
			color: white;
			text-align: center;
			position: relative;
		}nav ul{
			position: absolute;
			top: 50%; left: 50%;
			transform: translate(-50%, -50%);
			width: 100%;
			list-style: none;
		}nav ul li{
			display: inline-block;
			padding: 0 2%;
		}nav ul li a{
			text-decoration: none;
			color: white;
			font-weight: bold;
		}nav ul li a:HOVER{
			color: red;
			font-weight: bold;
		}
		
		section{
			width: 100%;
			height: 80%;
			background-color: white;
			color: black;
		}section h2{
			text-align: center;
			padding: 20px 0;
		}section p{
			text-align: left;
			font-weight: bold;
			padding-left: 20px;
		}section ol{
			text-align: left;
			padding-left: 40px;
		}
		
		footer{
			width: 100%;
			height: 5%;
			background-color: gray;
			color: white;
			text-align: center;
			position: relative;
		}footer h3{
			position: absolute;
			top: 50%; left: 50%;
			transform: translate(-50%, -50%);
			width: 100%;
		}
		
	</style>
</head>
<body>
	<header>
		<h1>도서 회원관리 ver 1.0</h1>
	</header>
</body>
</html>