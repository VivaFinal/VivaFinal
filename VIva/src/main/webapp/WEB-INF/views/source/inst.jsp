<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript">
$(function) {
	
	
	
}
</script>
<style type="text/css">
#btn{
	font-size: 2.5em;
	height: 70px;
	padding-left: 0px;
}
#Wrap{
	padding: 16px;
}
#line{
	width: 1200px;
	border-top: 1px solid #ccc;
	padding-top: 16px;
}
#drop{
	width: 1200px;
}
.width{
	width:1200px;
	padding-bottom: 17px;
	border-bottom: 1px solid #ccc;
}
#tab{
	width: 1300px;
	height: 50px;
	display: grid;
	grid-template-columns: 80px 100px;
}
.cateWrap{
	text-align: center;
}
.cate{
	color: black;
	font-size: 1.4em;
	line-height: normal;
	height: 40px;
}
#tagWrap{
	width: 1300px;
	height: 64px;
	border-bottom: 1px solid #ccc;
	display: grid;
	grid-template-columns: 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px ;
	grid-template-rows: 28px 28px;
}
.tagcover{
	height: 25px;
	text-align: center;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 2px;
	margin-bottom: 5px;
	margin-right: 5px;
	
}
.tagA{
	color: black;
	text-decoration: none;
}
</style>
<div id="Wrap">
	<div id="drop" class="dropdown">
		<button id="btn" class="btn btn-lg dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"> 
			${inst}
		</button>
		
		<ul class="dropdown-menu">
			<li><a class="dropdown-item disabled">Drum</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Drum">Drum</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Kick">Kick</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Snare">Snare</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Hihat">Hihat</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Clap">Clap</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Tom">Tom</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Cymbal">Cymbal</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=808">808</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Fills">Fills</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Percussion">Percussion</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Rimshot">Rimshot</a></li>
			
			<li><a class="dropdown-item disabled">Vocal</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Vocal">Vocal</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Female">Female</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Male">Male</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Phrases">Phrases</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Whispers">Whispers</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Screams">Screams</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Dialogue">Dialogue</a></li>
			
			
			<li><a class="dropdown-item disabled">Synth</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Synth">Synth</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Bass">Bass</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Lead">Lead</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Pad">Pad</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Arp">Arp</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Pluck">Pluck</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Melody">Melody</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Fx">Fx</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Chord">Chord</a></li>
			
			
			<li><a class="dropdown-item disabled">Brass</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Brass">Brass</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Saxophone">Saxophone</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Trumpet">Trumpet</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Trombone">Trombone</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Pad">Pad</a></li>
			
			
			<li><a class="dropdown-item disabled">WoodWinds</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=WoodWinds">WoodWinds</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Flute">Flute</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Harmonica">Harmonica</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Clarinet">Clarinet</a></li>
			
			
			<li><a class="dropdown-item disabled">Guitar</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Guitar">Guitar</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Electric">Electric</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Clean">Clean</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Dist">Dist</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Lead">Lead</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Rhythm">Rhythm</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Melody">Melody</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Riff">Riff</a></li>
			
			<li><a class="dropdown-item disabled">Bass</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Bass">Bass</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Synth">Synth</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Analog">Analog</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=ElectricBass">Electric Bass</a></li>
			
			<li><a class="dropdown-item disabled">String</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=String">String</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Violin">Violin</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Viola">Viola</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Contrabass">Contrabass</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Orchestral">Orchestral</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=StringPad">StringPad</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Staccato">Staccato</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Pizzicato">Pizzicato</a></li>
			
			<li><a class="dropdown-item disabled">Piano</a></li>
			<li><a class="dropdown-item" href="/source/inst?inst=Piano">Piano</a></li>
		</ul>
	</div>
	<div id="line"></div>
	
	<div id="tab">
		<div class="cateWrap">
			<c:if test="${empty source }">
				<a href="/source/inst?instrument=${inst}"><span class="cate">Source</span></a>
			</c:if>
			<c:if test="${ not empty source }">
				<a style="text-decoration:none; text-decoration-color:#ccc;" href="/source/inst?instrument=${inst}"><span class="cate">Source</span></a>
			</c:if>
		</div>
		<div class="cateWrap">
			<a style="text-decoration:none; " href="/pack/genre?instrument=${inst}"><span class="cate">Pack</span></a>
		</div>	
	</div>
	
	<div id="tagWrap">
		<c:forEach var="tag" items="${genre }" >
			<c:if test="${empty tag.genre }">
				${tag.genre }
			</c:if>
			<c:if test="${not empty tag.genre }">
				<a class="tagA" href="/source/inst?instrument=${inst}&genre=${tag.genre}"><div class="tagcover">${tag.genre}</div></a>
			</c:if>
		</c:forEach>
		
		<c:forEach var="tag" items="${scape }" >
			<c:if test="${empty tag.scape }">
				${tag.scape }
			</c:if>
			<c:if test="${not empty tag.scape }">
				<a class="tagA" href="/source/inst?instrument=${inst}&scape=${tag.scape}"><div class="tagcover">${tag.scape}</div></a> 
			</c:if>
		</c:forEach>
			
			
		<c:forEach var="tag" items="${detail }" >
			<c:if test="${empty tag.detail }">
				${tag.detail }
			</c:if>
			<c:if test="${not empty tag.detail }">
				<a class="tagA" href="/source/inst?instrument=${inst}&detail=${tag.detail}"><div class="tagcover">${tag.detail}</div></a> 
			</c:if>
		</c:forEach>
			
			
		<c:forEach var="tag" items="${fx }" >
			<c:if test="${empty tag.fx }">
				${tag.fx }
			</c:if>
			<c:if test="${not empty tag.fx }">
				<a class="tagA" href="/source/inst?instrument=${inst}&scape=${tag.fx}"><div class="tagcover">${tag.fx}</div></a> 
			</c:if>
		</c:forEach>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</div><!-- Wrap END -->




<c:import url="../layout/footer.jsp"/>