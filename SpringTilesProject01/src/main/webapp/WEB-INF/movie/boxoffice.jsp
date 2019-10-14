<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<title>Insert title here</title>
<link rel="stylesheet" href="/mvc/css/3d-fold-out-reveal-style.css">
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<c:if test="${cateno==1 }" >
			<h6 class="m-0 font-weight-bold text-primary" >주간 박스오피스</h6>
		</c:if>
		<c:if test="${cateno==2 }" >
			<h6 class="m-0 font-weight-bold text-primary" >월간 박스오피스</h6>
		</c:if>
		<c:if test="${cateno==3 }" >
			<h6 class="m-0 font-weight-bold text-primary" >연간 박스오피스</h6>
		</c:if>
	</div>

	<div class="cards">
		<c:forEach var="vo" items="${list }">
			<div class="card1">
				<img class="card__image" src="https:${vo.poster }" alt="wave" />
				<div class="card-title">
					<a href="#" class="toggle-info btn">
						<span class="left"></span>
						<span class="right"></span>
					</a>
					<h2>${vo.title }<small>${vo.regdate }, 평점 ${vo.score }</small></h2>
				</div>
				<div class="card-flap flap1">
					<div class="card-description">
						${vo.story }
					</div>
					<div class="card-flap flap2">
						<div class="card-actions">
							<a href="../movie/boxDetail.do?mno=${vo.mno }" class="btn">더보기..</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="text-center" style="margin-top: 30px;" >
			<ul class="pagination" style="text-align: center; display: inline-block;" >
				<li class="paginate_button page-item" style="display: inline-block;">
					<a href="../movie/boxoffice.do?type=${cateno }&page=1" class="page-link" >&lt;&lt;</a>
				</li>
				<c:forEach var="p" begin="1" end="${totalpage }" >
					<li class="paginate_button page-item" style="display: inline-block;">
						<a href="../movie/boxoffice.do?type=${cateno }&page=${p}" class="page-link " >${p }</a>
					</li>
				</c:forEach>
				<li class="paginate_button page-item" style="display: inline-block;">
					<a href="../movie/boxoffice.do?type=${cateno }&page=${totalpage}" class="page-link" >&gt;&gt;</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- partial -->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js'></script>
<script  src="/mvc/js/3d-fold-out-reveal-script.js"></script>

</body>
</html>