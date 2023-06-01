<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>
<script src="https://unpkg.com/wavesurfer.js@6.6.3/dist/wavesurfer.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

<style type="text/css">
#title{
	font-size: 40px;
}
#Wrap{
	padding: 16px;
}
#WrapTop{
	width: 1300px;
}
.cate{
	color: black;
	font-size: 1.4em;
	line-height: normal;
	height: 40px;
}
#category{
	display: grid;
	grid-template-columns: 100px 150px 150px;
	margin-top: 10px;
}
.a{
 	text-decoration: none; 
}
.midtitle{
	margin-top: 20px;
	margin-bottom: 20px;
}
.content{
	margin: 0 auto;
	width: 1300px;
	height: 250px;
}
.img{
	width: 150px;
	height: 150px;
}
.slickbtn{
	background: #ccc;
	position: absolute;
}
.slideContent{
	position: relative;
	width: 1300px;
	margin: auto;
}
#next{
	top: 64px;
	right: 40px
}
#prev{
	top: 64px;
	left: -65px;
}
.packName{
	width: 150px;
	text-align: center;
	margin-top:5px;
}
</style>
<script type="text/javascript">
$(function() {
	
	$(".content").slick({
		infinite: true,
		slidesToShow: 5,
		slidesToScroll: 5,
		arrows: true,
		prevArrow: $("#prev"),
		nextArrow: $("#next")
	})
	
	
})	

</script>
<div id="Wrap">
	<div id="WrapTop">
		<div style="width:1300px; border-bottom:1px solid #ccc;">
			<span id="title">Sound</span>
		</div>
		<div id="category">
			<a class="a" href="./genre?genre=Trap"><div><span class="cate">Genre</span></div></a>
			<a class="a" href="./inst?instrument=Drum"><div><span class="cate">Instrument</span></div></a>
			<a class="a" href="./upload"><div><span class="cate">Upload</span></div></a>
		</div>
	</div>
	<div id="WrapMiddle">
		<div class="midtitle">
			<span class="cate">Recommend For you</span>
		</div>
		
		<div class="slideContent">
			<div id="prev" class="slickbtn"><img src="../resources/icon/chevron-left.svg"></div>
			<div class="content">
				<div>
					<img class="img" src="../upload/SnopdogHippack123">
					<div class="packName">SnopdogHippack</div>
					<div id="wave">11</div>
				</div>
				<div>
					<img class="img" src="../upload/default-image">
				</div>
				<div>
					<img class="img" src="../upload/SnopdogHippack123">
				</div>
				<div>
					<img class="img" src="../upload/default-image">
				</div>
				<div>
					<img class="img" src="../upload/SnopdogHippack123">
				</div>
				
				<div><img class="img" src="../upload/default-image"></div>
				<div><img class="img" src="../upload/SnopdogHippack123"></div>
				<div><img class="img" src="../upload/default-image"></div>
				<div><img class="img" src="../upload/SnopdogHippack123"></div>
				<div><img class="img" src="../upload/default-image"></div>
			</div>
			<div id="next" class="slickbtn"><img src="../resources/icon/chevron-right.svg"></div>
		</div>
		

	</div>
</div>

<c:import url="../layout/footer.jsp"/>