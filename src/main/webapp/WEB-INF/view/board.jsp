<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>동원베네스트 입주자 사이트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/css/style.css" />
<style>
.content {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	border-bottom: 1px solid;
	height: 20%;
	width: 100%;
}

.content__title {
	margin-left: 10px;
	font-weight: 800;
}

.contetnt__header {
	margin-left: 20px;
}

.main {
	height: 800px;
}

.main__body {
	width: 100%;
	display: flex;
	flex-direction: column;
}

.number {
	display: flex;
	align-items: center;
	justify-content: center;
}
.number__ul{
display: flex;
justify-content: center;

}
.number__ul a{
margin-left: 10px}
</style>
</head>
<body>
	<header class="header">
		<div class="header__column">
			<a href="/index"><h3 class="header__site">입주민 사이트</h3></a>
		</div>
		<div class="header__column">
			<span class="header__welcome"><strong>${(empty userId)?"손님":userId}</strong>
				안녕하세요!</span> <a href="register"><input type="submit" value="회원가입"
				class="header__btn" /></a> <a href="login"><input
				type="${(empty userId)?" submit":"hidden" }"  value="로그인"
				class="header__btn" /></a> <a href="logout"><input
				type="${(empty userId)?" hidden":"submit" }"  value="로그아웃"
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
		<div class="main__body">
			<div class="content">
				<div class="contetnt__header">
					<i class="fa-solid fa-microphone fa-2x"></i> <span
						class="content__title">자유게시판</span>
				</div>
			</div>
			<div class="content__search">
				<select name="" id="">
					<option value="title">제목</option>
					<option value="writerId">작성자</option>
				</select> <input type="text" /> <input type="submit" value="검색" />
			</div>
			<div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach var="n" items="${list}">
							<tr>
								<th scope="row">${n.id}</th>
								<td>${n.title}</td>
								<td>${n.writer_id}</td>
								<td>${n.regdate}</td>
								<td>${n.hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:set var="page" value="${(empty param.p)?1:param.p}"></c:set>
			<c:set var="startNum" value="${page-(page-1)%5}"></c:set>
			<c:set var="lastNum" value="${25}"></c:set>
			<div class="number">
				<div class="number__left">
					<c:if test="${startNum >1}">
						<a href="?p=${startNum-5}&f=&q="><div><</div></a>
					</c:if>
					<c:if test="${startNum<=1}">
						<a><<span onclick="alert(이전 X)"></span></a>
					</c:if>

				</div>
				<ul class="number__ul">
					<c:forEach var="i" begin="0" end="4">
						<a href="?p=${startNum+i}&f=${param.f}&q=${param.q}"><li>${startNum+i}</li></a>
					</c:forEach>
				</ul>
				<div class="number__right">
					<c:if test="${startNum +4 <lastNum}">
						<a href="?p=${startNum+5}&f=&q="><div>></div></a>
					</c:if>
				</div>
			</div>
		</div>
	</main>

	<script src="https://kit.fontawesome.com/8cc4eb714e.js"
		crossorigin="anonymous"></script>
</body>
</html>
