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
</style>
<div id="Wrap">
	<div id="drop" class="dropdown">
		<button id="btn" class="btn btn-lg dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"> 
			${inst}
		</button>
		
		<ul class="dropdown-menu">
			<li><a class="dropdown-item disabled">Drum</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Kick">Kick</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Snare">Snare</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Hihat">Hihat</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Clap">Clap</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Tom">Tom</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Cymbal">Cymbal</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=808">808</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Fills">Fills</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Percussion">Percussion</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Rimshot">Rimshot</a></li>
			
			<li><a class="dropdown-item disabled">Vocal</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Female">Female</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Male">Male</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Phrases">Phrases</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Whispers">Whispers</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Screams">Screams</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Dialogue">Dialogue</a></li>
			
			
			<li><a class="dropdown-item disabled">Synth</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Bass">Bass</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Lead">Lead</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Pad">Pad</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Arp">Arp</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Pluck">Pluck</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Melody">Melody</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Fx">Fx</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Chord">Chord</a></li>
			
			
			<li><a class="dropdown-item disabled">Brass</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Saxophone">Saxophone</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Trumpet">Trumpet</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Trombone">Trombone</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Pad">Pad</a></li>
			
			
			<li><a class="dropdown-item disabled">WoodWinds</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Flute">Flute</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Harmonica">Harmonica</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Clarinet">Clarinet</a></li>
			
			
			<li><a class="dropdown-item disabled">Guitar</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Electric">Electric</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Clean">Clean</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Dist">Dist</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Lead">Lead</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Rhythm">Rhythm</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Melody">Melody</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Riff">Riff</a></li>
			
			<li><a class="dropdown-item disabled">Bass</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Synth">Synth</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Analog">Analog</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=ElectricBass">Electric Bass</a></li>
			
			<li><a class="dropdown-item disabled">String</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Violin">Violin</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Viola">Viola</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Contrabass">Contrabass</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Orchestral">Orchestral</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=StringPad">StringPad</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Staccato">Staccato</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Pizzicato">Pizzicato</a></li>
			
			<li><a class="dropdown-item disabled">Piano</a></li>
			<li><a class="dropdown-item" href="/source/inst?inst=Piano">Piano</a></li>
		</ul>
	</div>
	<div id="line"></div>
	
	
	
	
	
	
	
	
</div><!-- Wrap END -->




<c:import url="../layout/footer.jsp"/>