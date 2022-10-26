<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>동원베네스트 입주자 사이트</title>
<link rel="stylesheet" href="/css/style.css" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2ce5b3e9f690e5f9242fdc6b4b15bf5"></script>
	<style >
		#map{
		margin-top: 20px
		}
		.main__nav{
		margin-right: 20px}
	</style>
</head>
<body>
	<header class="header">
		<div class="header__column">
			<a href="/index"><h3 class="header__site">입주민 사이트</h3></a>
		</div>
		<div class="header__column">
			<span class="header__welcome"><strong>${(empty userId)?"손님":userId}</strong>
				안녕하세요!</span> <a href="register"><input type="submit"
				value="회원가입" class="header__btn" /></a> <a href="login"><input
				type="${(empty userId)?"submit":"hidden" }" value="로그인"
				class="header__btn" /></a> <a href="logout"><input
				type="${(empty userId)?"hidden":"submit" }" value="로그아웃"
				class="header__btn" /></a>
		</div>
	</header>
	<main class="main">
		<nav class="main__nav">
			<div class="main__nav__wrapper">
				<div class="main__nav__column">
					<span class="main__nav__img"><i
						class="fa-solid fa-building fa-2x"></i></span> <span>단지소개</span>
				</div>
			</div>
		</nav>
		<div id="map" style="width: 90%; height: 750px"></div>
	</main>
	
	
	<script>
		const mapContainer = document.getElementById("map"), mapOption = {
			center : new kakao.maps.LatLng(37.889350, 127.058478), // 지도의 중심 좌표(임의 설정)
			level : 3, // 지도의 확대 레벨(임의 설정)
		};

		//설정한 지도 생성
		const map = new kakao.maps.Map(mapContainer, mapOption);
		var markerPosition = new kakao.maps.LatLng(37.889350, 127.058478);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = '<div style="padding:5px;">동원베네스트<br><a href="https://map.kakao.com/link/map/동원베네스트,37.889350,127.058478" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(37.889350, 127.058478); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
	</script>
	<script src="https://kit.fontawesome.com/8cc4eb714e.js"
		crossorigin="anonymous"></script>
</body>
</html>
