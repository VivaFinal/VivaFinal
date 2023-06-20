<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>
<script src="https://unpkg.com/wavesurfer.js@6.6.3/dist/wavesurfer.js"></script>
<script type="text/javascript">
$(function() {
	$(".tagcover").hover(function() {
		$(this).css({
			'background':'#Be3455',
			'color':'white'
		})
	})
	
	$(".tagcover").mouseout(function() {
		$(this).css({
			'background':'white',
			'color':'black'
		})
	})
	
	$(".packname").hover(function() {
		$(this).css({
			'background':'lightgrey',
			'color':'black'
		})
	})
	
	$(".packname").mouseout(function() {
		$(this).css({
			'background':'white',
			'color':'black'
		})
	})
})
</script>
<style type="text/css">
.cate{
	color: black;
	font-size: 1.4em;
	line-height: normal;
	height: 40px;
}
.cateWrap{
	text-align: center;
}
#btn{
	font-size: 2.5em;
	height: 70px;
	padding-left: 0px;
}
#Wrap{
}
#WrapTop{
	width: 1400px;
	margin: 0 auto;
}
#WrapMiddle{
	width: 1400px;
	margin: 0 auto;
}
#line{
	width: 1300px;
	border-top: 1px solid #ccc;
	padding-top: 16px;
}
#drop{
	width: 1300px;
}
.width{
	width:1300px;
	padding-bottom: 17px;
}
#tab{
	width: 1300px;
	height: 50px;
	display: grid;
	grid-template-columns: 80px 100px;
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
#SourceWrap{
	display: grid;
	grid-template-columns: 80px 80px 400px 80px 80px 80px 300px 200px;
}

div[data-itemtype='line']{
	border-bottom: 1px solid #ccc;
}
a{
	text-decoration: none;
	color: black;
}
#grid{
	display: grid;
	grid-template-columns : 200px 200px 200px 200px 200px;
	grid-column-gap: 30px;
	grid-row-gap: 30px;
	width: 1300px;
	place-content: center;
}
.trimg{
	width: 200px;
	height: 200px;
}
.packname{
	font-size: 20px;
	text-align: center;
}
.wavewrap{
	display: none;
}
</style>
<div id="Wrap">
<div id="WrapTop">
<div id="drop" class="dropdown">
	<button id="btn" class="btn btn-lg dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"> 
		${genre}
	</button>
	
	<ul class="dropdown-menu">
		<li><a class="dropdown-item disabled">Hip Hop</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Trap">Trap</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=RnB">RnB</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Soul">Soul</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=BoomBap">BoomBap</a></li>
		
		<li><a class="dropdown-item disabled">Live Sound</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Rock">Rock</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Jazz">Jazz</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=HeavyMetal">HeavyMetal</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Funk">Funk</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Reggae">Reggae</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Folk">Folk</a></li>
		
		
		<li><a class="dropdown-item disabled">House</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Electro">Electro</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=House">House</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Disco">Disco</a></li>
		
		
		<li><a class="dropdown-item disabled">Pop</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Pop">Pop</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=EDM">EDM</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=TropicalHouse">Tropical House</a></li>
		
		
		<li><a class="dropdown-item disabled">Bass Music</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=BassMusic">Bass Music</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=DrumAndBass">Drum and Bass</a></li>
		<li><a class="dropdown-item" href="/pack/genre?genre=Jungle">Jungle</a></li>
	</ul>
</div>

	<div id="line"></div>
	<c:if test="${genre eq 'Trap'}">
	<div class="width">
		트랩(Trap)은 1990년대 후반에서 2000년대 초반에 미국 남부에서 개발된 힙합 음악 스타일입니다. 트랩 사운드는 크리스피하고 음울한 분위기, 딥한 808 드럼의 kick 사운드, 쪼개진 하이햇, 그리고 어둡고 영화적인 현악기와 금관악기로 대표됩니다. 2010년대에 예술가들은 트랩 EDM을 만들기 위해 트랩을 DubStep과 믹스 했습니다.
	</div>
	</c:if>
	
	<%-- 장르 설명 --%>
	<c:if test="${genre eq 'RnB'}">
	<div class="width">
	원래 1940년대 후반에 록 이전에 만들어진 리듬 앤 블루스의 약어인 컨템포러리 R&B는 팝, 소울, 펑크, 힙합, 그리고 일렉트로닉 음악의 요소들을 결합한 음악 장르입니다. 리드 보컬에 의해 주도된 R&B의 맛은 수십 년 동안 마이클 잭슨에서 비욘세로 바뀌었고 일렉트릭 장르의 영향을 받아 점점 증가하는 추세가 되고 있습니다
	</div>
	</c:if>
	<c:if test="${genre eq 'Soul'}">
	<div class="width">
	아프리카계 미국인 가스펠 음악, R&B, 재즈의 요소들을 결합한 소울 음악은 모타운과 애틀랜틱과 같은 음반사가 영향력을 얻으며 미국에서 인기를 얻었습니다. Soul은 록과 아프리카 음악에 직접적인 영향을 미치며 전 세계에 퍼졌습니다. 손뼉치기와 즉흥적인 몸놀림으로 강조되는 캐치한 리듬은 Soul 음악의 중요한 특징입니다.
	</div>
	</c:if>
	<c:if test="${genre eq 'BoomBap'}">
	<div class="width">
	미국에서 발단된 힙합은 지역별, 또는 스타일별로 크게 이스트코스트(동부), 웨스트코스트(서부), 서던(남부)로 나누었는데 붐뱁 사운드는 90년대 이스트코스트에서 명확하게 나타났다. 이렇듯 시기적으로는 80년대 말에서 90년대 전반, 지역적으로는 이스트코스트의 음악들을 흔히 붐뱁이라 부른다
	</div>
	</c:if>
	<c:if test="${genre eq 'Rock'}">
	<div class="width">
	록 음악(Rock music)은 미국에서 기원하여 1960년대 ~ 2000년대 후반까지 전세계적으로 크게 유행한 대중음악 장르의 하나이다. 20세기 초 미국의 블루스, 컨트리, 가스펠 등에서 유래된 로큰롤에서 직접적으로 기원했고, 1950년대 이후 다양한 서브장르로 분화되어 미국과 영국을 중심으로 큰 유행을 거듭하며 발전하였다.
	</div>
	</c:if>
	<c:if test="${genre eq 'Jazz'}">
	<div class="width">
	재즈(Jazz)는 19세기 후반에서 20세기 초 미국 루이지애나 주 뉴올리언스의 아프리카계 미국인 문화에서 탄생해 20세기 초반에서 중반까지 전세계적으로 크게 유행한 음악 장르이다. 유럽의 악기와 음악적 틀을 기반으로 아프리카의 리듬과 화성, 그리고 아프리카계 미국인 특유의 감성, 그리고 새로운 음악적 시도 등이 혼합된 장르다.
	</div>
	</c:if>
	<c:if test="${genre eq 'House'}">
	<div class="width">
	1980년 중반부터 시작된 여러 전자 댄스 음악 스타일의 총칭이다. 하우스란 어원은 올드 디스코 음악과 유로 신스팝 음악을 혼합한 시카고의 DJ 프랭키 너클즈가 활동하던 창고 클럽에서 따 왔다고 한다. 그 클럽의 단골들이 그의 음악을 "하우스" 음악이라고 이름붙였다고 전해진다.
	</div>
	</c:if>
	<c:if test="${genre eq 'HeavyMetal'}">
	<div class="width">
	헤비 메탈은 1960년대 말에서 1970년대 초, 영국과 미국 등지에서 발달한 록 장르 중 하나로서 'HEAVY METAL ROCK AND ROLL'의 줄임말이다. 사이키델릭 록, 블루스 록을 기반으로 헤비 메탈을 만들어낸 많은 밴드들은 고증폭된 디스토션과 길어진 기타 솔로, 강한 비트 그리고 전체적으로 하이게인 사운드 등을 특징으로 굵고 육중한 사운드를 개발했다.
	</div>
	</c:if>
	<c:if test="${genre eq 'Funk'}">
	<div class="width">
	펑크(funk)는 1960년대 중반 음악가들이 소울, 재즈, 리듬 앤 블루스(R&B)의 혼합을 통해 리드미컬하고 춤추기 쉬운 새로운 형태의 음악을 만들면서 블랙아메리카 커뮤니티에서 유래한 음악 장르다.
	</div>
	</c:if>
	<c:if test="${genre eq 'Reggae'}">
	<div class="width">
	레게(Reggae)는 1960년대 후반 자메이카에서 발전한 음악 장르이다. 자메이카 음악의 한 장르인 스카와 록스테디에서 출발하여 여러 음악 장르의 영향을 받아 발전 하였다.
	</div>
	</c:if>
	<c:if test="${genre eq 'Folk'}">
	<div class="width">
	컨템포러리 포크 음악(영어: contemporary folk music)은 20세기에 생겨난 대중 음악 장르이다. 각 나라와 지역의 민요(포크 음악)에서 파생했으나, 전통민요(영어: traditional folk music)와는 구분되는 새로운 장르로 자리잡혔다. 
	</div>
	</c:if>
	<c:if test="${genre eq 'Electro'}">
	<div class="width">
	일렉트로는 1980년대 초 뉴욕에서 디트로이트에 이르기까지 미국 도시의 집단의식에서 태어난 것처럼 보였습니다. TR-808 드럼 머신과 펑크 음악의 영향을 직접 받은 일렉트로닉 음악의 하위 장르입니다. 이 장르는 일반적으로 보컬이 없는 무거운 전자 사운드를 특징으로 합니다. 보컬이 존재하는 경우, 종종 왜곡을 통해 데드팬 방식으로 전달됩니다
	</div>
	</c:if>
	<c:if test="${genre eq 'Disco'}">
	<div class="width">
	대중적인 멜로디 라인으로 몸을 움직이기 쉬운 장르이며, 테크노보다는 기계적인 요소가 적은 것이 특징이다. 또한, 16비트 음악인 펑크(Funk)의 빠른 템포를 빌려온 것으로 춤 추기 좋은 8비트의 흥겨운 곡조로 변형된 것이다.
	</div>
	</c:if>
	<c:if test="${genre eq 'Pop'}">
	<div class="width">
	대중음악의 가장 기본이 되는 장르로서 쉽게 귀를 잡아끄는 리듬 요소, 멜로디와 후렴, 메인스트림 스타일과 전통적인 구조를 특징으로 하는 대중음악 장르이다.
	</div>
	</c:if>
	<c:if test="${genre eq 'EDM'}">
	<div class="width">
	일렉트로닉 댄스 뮤직(Electronic Dance Music), 흔히 EDM은 클럽이나 DJ가 주최하는 댄스 파티에 어울리는 전자 음악의 총칭이다. 어떠한 특별한 장르를 나타내기보다는 테크노, 하우스, 트랜스, 드럼 앤 베이스, 덥스텝, 드럼스텝, 트랩, 풋워크와 같은 다양한 장르를 총 망라하는 용어라고 할 수 있다.
	</div>
	</c:if>
	<c:if test="${genre eq 'TropicalHouse'}">
	<div class="width">
	일렉트로니카 음악의 큰 주축 중 하나이며, 사전적인 정의는 펑크, 소울, 재즈+테크노를 기반으로 삼고, 선율적인 멜로디를 강조한 하우스 음악입니다.
	</div>
	</c:if>
	<c:if test="${genre eq 'BassMusic'}">
	<div class="width">
	EDM중 베이스가 주를 이루는 음악들을 포괄적으로 가르키는 신조어. 정의에서 알 수 있듯 굉장히 애매한 경계를 가지며, 어떤 장르를 가리킨다기보단 시부야계 같은 맥락으로 이해하는 것이 좋다. 어원은 확실하지 않으나, 사운드 클라우드, 비트포트 등 EDM 씬의 주축이 되는 사이트에서조차 이 단어를 쓰고 있다.
	</div>
	</c:if>
	<c:if test="${genre eq 'DrumAndBass'}">
	<div class="width">
	정글 음악과 더 큰 1990년대 영국의 레이브 장면에서 발전한 드럼과 베이스 음악은 빠른 드럼 브레이크 비트, 깊은 형태의 베이스 라인, 그리고 활기찬 퍼커션을 사용합니다. 이 스타일은 힙합, 빅 비트, 더브스텝, 하우스, 트립 홉, 앰비언트 음악, 테크노, 재즈, 록, 그리고 팝과 같은 많은 다른 장르에 영향을 미치며 전 세계적으로 자리 잡았습니다.
	</div>
	</c:if>
	<c:if test="${genre eq 'Jungle'}">
	<div class="width">
	Jungle은 1990년대 초 영국의 열광적인 장면의 산물로 등장한 전자 음악의 한 장르입니다. 특징으로는 빠른 템포, 드럼 브레이크 비트의 잘게 썬 녹음, 레게, 더빙된 베이스라인, 싱코페이션 리듬, 피치 시프트와 같은 디지털 효과가 있습니다. 정글은 더빙, 레게, 댄스홀과 같은 자메이카 사운드 시스템과 장르에 공통적인 특징을 많이 유지하고 있습니다
	</div>
	</c:if>
	
	<div id="tab">
		<div class="cateWrap">
			<a href="/source/genre?genre=${genre}"><span class="cate">Source</span></a>
		</div>
		<div class="cateWrap">
				<a class="a" href="/pack/genre?genre=${genre}"><span class="cate" style="border-bottom: 3px solid #ccc">Pack</span></a>
		</div>	
	</div>
	
	<div id="tagWrap">
		<c:forEach var="tag" items="${inst }" >
			<c:if test="${empty tag.instrument }">
				${tag.instrument }
			</c:if>
			<c:if test="${not empty tag.instrument && tag.instrument != cinst }">
				<a class="tagA" href="/pack/genre?genre=${genre}&instrument=${tag.instrument}"><div class="tagcover">${tag.instrument}</div></a>
			</c:if>
		</c:forEach>
	</div>

<div id="WrapMiddle">
	<div id="infoline"><div class="cate">Result : ${list.size()}</div>
		<c:if test="${not empty msg}">
		<div class="already">${msg }</div>
		</c:if>
	</div>
	
	<div id="gridWrap">
		<div id="grid">
			<c:forEach items="${list }" var="list">
				<div class="content">
					<c:if test="${list.PACK_IMG_STOREDNAME eq null }">
						<div class="trimg" data-img="default-image.webp" ><img src="../resources/img/default-image.webp" style="width: 100%"></div>
					</c:if>
					<c:if test="${list.PACK_IMG_STOREDNAME ne null }">
						<div class="trimg" data-img="${list.PACK_IMG_STOREDNAME }" ><img src="../upload/${list.PACK_IMG_STOREDNAME }" style="width: 100%"></div>
					</c:if>
					<a href="/source/pack?packNo=${list.PACK_NO }"><div class="packname" data-no="${list.PACK_NO }" data-packname="${list.PACK_NAME }" data-name="${list.FILE_STOREDNAME }">${list.PACK_NAME }</div></a>
					<div class="wavewrap"><div id="wave${list.PACK_NO }"></div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

			
		<script type="text/javascript">
		
			// 음원소스 시간 계산기
			var timeCalculator = function(value){
	        	second = Math.floor(value % 60);
	        	minute = Math.floor((value / 60) % 60);
	        	
	        	if (second <10 ){
	        		second = "0" + second;
	        	} 
	        	
	        	return minute + ":" + second;
	        };
	
	        // 음원소스 번호 리스트 배열 선언
			var conA = document.querySelectorAll("div[data-no]");
			var conB = document.querySelectorAll("div[data-name]");
		
			
			// 음원소스 시각화
			var wave = [];
		
			for( var i = 0; i<${list.size()}; i++) { 
		
				 wave[i] = WaveSurfer.create({ 
				 container: '#wave'+conA[i].getAttribute("data-no"),
				 waveColor: 'gray', 
				 progressColor: '#BB2649', 
				 barWidth: 2, 
				 reposive: true, 
				 barHeight: 1.5, 
				 pixelRatio: 30, 
				 normalize: true, 
				 barMinHeight: 50
				});
				 
			
			  wave[i].setHeight(30); 
			  wave[i].setCursorColor('white'); 
			  wave[i].load('../upload/'+conB[i].getAttribute("data-name"))
			}
		
			// 마우스 오버, 플레이 버튼
			$(".trimg").hover(function() {
				
				var idx = $(".trimg").index(this)
				
				$(".trimg").eq(idx).css("cursor","pointer")
				
			})
			
			// 이미지 누를 시 재생	
			$(".trimg").click(function() {
				
				//console.log($(".trwave").index(this))
				// 음원소스 위치 알아내기
				var waveno = $(".trimg").index(this)
				
				// 이미지 위치 알아내기
				var imgno = $(".tr").index(this)
				
				var imgSrc = $(".trimg").eq(waveno).attr('data-img')
				
				var packname = $(".packname").eq(waveno).attr('data-packname')
				
				if(wave[waveno].isPlaying() == true) {
					wave[waveno].pause()
					console.log("제어문 동작 하는거지?")
				    $("#barbtn").attr("src","../resources/icon/play-circle.svg")
				    
				    return
				}
				
				// 다른 음원 재생 시 모두 종료 후 현재 클릭한 음원소스 재생
				for(var w=0; w<wave.length; w++) {
					if( w != waveno && wave[w].isPlaying() == true ) {
					 	wave[w].pause()
					} 
				}
				
				wave[waveno].play()	
				$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
				
				// 플레이바 구현
				$("#playWrap").css({
					"background":"linear-gradient(263.28deg, #514C9C 7.05%, #653A99 16.72%, #6E388C 25.66%, rgba(117, 37, 114, 0.76) 38.08%, rgba(174, 106, 166, 0.84) 78.14%, #8E4B6D 93.97%)",
					"height":"80px"
				})
				
				$("#addheight").css("height","100px")
				$("#playimg").attr("src","../upload/"+imgSrc)
				$("#playimg").css("visibility","visible")
				
				if(wave[waveno].isPlaying() == true) {
					$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
				} else if(wave[waveno].isPlaying() == false){
					$("#barbtn").attr("src","../resources/icon/play-circle.svg")
				}
				
				$("#barprocess").html("0:00")
				$("#barduration").html("0:00")
				$("#barsourcename").html(packname)
				$("#barsourcename").attr("data-barno",waveno)
				$("#next").attr("src","../resources/icon/skip-end-circle.svg")
				$("#prev").attr("src","../resources/icon/skip-start-circle.svg")
				
// 				음원소스 재생 시간 계산 부분
				var duration1 = document.querySelector("#barduration")
				duration1.textContent = timeCalculator(wave[waveno].getDuration());
				
				var current1 = document.querySelector("#barprocess")
				wave[waveno].on("audioprocess", function(e) {
					
					current1.textContent = timeCalculator(wave[waveno].getCurrentTime());
					
				})
				
				
			})		
			  
		</script> 


</div> <!-- Wrap Middle End -->
<div id="addheight"></div>
</div> <!-- Wrap End -->
<c:import url="../layout/footer.jsp"/>