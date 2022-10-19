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

</head>
<body>

	<header class="header">
		<div class="header__column">
			<a href=""><h3 class="header__site">입주민 사이트</h3></a>
		</div>
		<div class="header__column">
			<span class="header__welcome"><strong>손님</strong> 안녕하세요!</span> <a
				href="register"><input type="submit" value="회원가입" class="header__btn" /></a> 
				<a href="login"><input type="submit" value="로그인 페이지로 이동" class="header__btn"/></a>
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
		<content class="content">
		<div class="content__wrapper">
			<div class="content__image">
				<img src="/img/동원베네스트1.jpg" />
			</div>
			<div class="sector">
				<div class="sector__wrapper">
					<div class="sector__column">
						<div class="sector__img">
							<a href=""><i
								class="fa-solid fa-location-dot fa-4x white--i"></i></a>
						</div>
						<div class="sector__title">단지 위치</div>
						<div class="sector_text">우리 아파트 단지의 위치를 확인 하실 수 있습니다.</div>
					</div>
					<div class="sector__column">
						<div class="sector__img">
							<a href=""> <i class="fa-regular fa-bell fa-4x white--i"></i></a>
						</div>
						<div class="sector__title">공지 사항</div>
						<div class="sector_text">우리 아파트의 중요 공지사항을 확인 하실 수 있습니다.</div>
					</div>
					<div class="sector__column">
						<div class="sector__img">
							<a href=""><i
								class="fa-solid fa-comments fa-4x white--i"></i></a>
						</div>
						<div class="sector__title">입주자 자유게시판</div>
						<div class="sector_text">우리 아파트 주민들과 자유롭게 소통해 보세요</div>
					</div>
				</div>
			</div>
			<div class="sector__wrapper">
				<div class="sector__column">
					<div class="sector__img">
						<a href=""><i class="fa-regular fa-sun fa-4x"></i></a>
					</div>
					<div class="sector__title">오늘 날씨</div>
					<div class="sector_text">오늘의 날씨 확인하세요</div>
				</div>
				<div class="sector__column">
					<div class="sector__img">
						<a href=""><i class="fa-regular fa-face-angry fa-4x"></i></a>
					</div>
					<div class="sector__title">불편 사항</div>
					<div class="sector_text">우리 아파트의 중요 공지사항을 확인 하실 수 있습니다.</div>
				</div>
				<div class="sector__column">
					<div class="sector__img">
						<a href=""><i class="fa-regular fa-handshake fa-4x"></i></a>
					</div>
					<div class="sector__title">함께 나눠요</div>
					<div class="sector_text">우리 아파트 주민들과 물건을 나누어 보세요</div>
				</div>
			</div>
		</div>
		</content>
	</main>
	<script src="https://kit.fontawesome.com/8cc4eb714e.js"
		crossorigin="anonymous"></script>
</body>
</html>
