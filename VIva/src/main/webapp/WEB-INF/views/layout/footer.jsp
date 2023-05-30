<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	</div><!--  div.item End (header.jsp) -->
</div><!--  div.wrapper End (header.jsp) -->

<style type="text/css">
#footer{
	position: relative;
}
#pop{
	position: absolute;
	top: 50px;
	left: 950px;
	display : flex;
	justify-content :center;
	align-items : center;
	color : white;
}
#playWrap{

	width: 100%;
	padding-left: 250px;
	height: 80px;
	background : #0000004f;
	position: fixed;
	bottom: 0px;
	color: white;
}
#playbar{
	position: relative;
}
#playimg{
	position: absolute;
	visibility: hidden;
	top: 20px;
	left: 450px;
	width: 40px;
	height: 40px;
}
#barbtn{
	position: absolute;
	top: 23px;
	left: 550px;
	width: 35px;
}
#barsourcename{
	position: absolute;
	top: 20px;
	left: 720px;
}
#barprocess{
	position: absolute;
	top: 45px;
	left: 680px;
}
#barduration{
	position: absolute;
	top: 45px;
	left: 775px;
}
#playmute{
	position: absolute;
	top: 23px;
	left: 945px;
	width: 35px;
}
</style>
<div id="footer">
	<div id="playWrap">
		<div id="playbar">
			<img id="playimg" src="">
			<img id="barbtn"src="">
			<span id="barsourcename"></span>
			<span id="barprocess"></span>
			<span id="barduration"></span>
			<img id="playmute" src="">
		</div>
	</div>	
</div>
    
</body>
</html>