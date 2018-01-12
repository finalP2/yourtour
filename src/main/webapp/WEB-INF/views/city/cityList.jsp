<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <link href="http://fonts.googleapis.com/css?family=Arimo:400" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도시 리스트</title>

<style>

nav{background-color:#fff; height:75px; position:relative;}

	nav .menu-bar{float:center; line-height:75px;}
	
	nav .menu-bar > ul > li > i{display:none;}
	
	nav .menu-bar ul li{display:inline-block;}
	
	nav .menu-bar > ul > li > a{padding:10px 50px;  border-radius:10px; color:#070707;}
	
	nav .menu-bar > ul > li > .dropdown-menu-bar{position:absolute; display:none;}
	
	nav .menu-bar > ul > li:hover .dropdown-menu-bar{display:block;
				animation-duration:1s;
				animation-name:example;
				animation-iteration-count:1;
		}
		@keyframes example{
				from{transform:translate(-40px,10px) rotateY(90deg); opacity:0.2;}
				to{transform:translate(0px,0px) rotateY(0deg); opacity:1.0;}
		}
	
	nav .menu-bar > ul > li >.dropdown-menu-bar ul li{display:block; line-height:35px;  solid #c2c2c2;}
	
	nav .menu-bar > ul > li >.dropdown-menu-bar > ul > li > a{padding:0px 60px;}
	
	nav .menu-bar > ul > li >.dropdown-menu-bar > ul > li:hover{background-color:#fff;}

	nav .mobile-menu{color:#fff; right:30px; position:absolute; font-size:30px; line-height:75px;}
	
	nav .mobile-menu{display:none;}
	
</style>

</head>
<body>
	<nav>
			<div class="container">
				<div class="menu-bar">
					
					<ul>
						<li><a href="/yourtour/city/cityDetail.go?no=${cityDetail.no}&keyword=프랑스">${cityList.country }#프랑스</a>
						    <i class="fa fa-angle-down" aria-hidden="true" id="dropdown-click-arrow"></i>
					
							<div class="dropdown-menu-bar">
								<ul>
									<td><a href="">파리</a>&nbsp;
									    <a href="">깐느</a>&nbsp;
									    <a href="">니스</a>&nbsp;
									    <a href="">마르세유</a>&nbsp;
									    <a href="">안시</a>&nbsp;
									</td>
									
								</ul>
							</div>
						</li>
						<li><a href="">#독일</a>
							<i class="fa fa-angle-down" aria-hidden="true" id="dropdown-click-arrow"></i>
							
							<div class="dropdown-menu-bar">
								<ul>
									<td><a href="">베를린</a>&nbsp;
									    <a href="">함부르크</a>&nbsp;
									    <a href="">뮌헨</a>&nbsp;
									    <a href="">뉘렌베르크</a>&nbsp;
									</td>
								</ul>
							</div>
						</li>
					</ul>
					
				</div>
		</nav>
</body>
</html>
