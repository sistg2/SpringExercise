<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/daum.css" > 
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary" >뉴스 상세보기</h6>
	</div>
	<div id="dkContent" class="cont_view hcg_movie_pc_contents" role="main"> 
		<div id="cMain" >
			${news_detail }
		</div>
	</div>
	<div class="text-right" >
		<a href="../movie/news.do" class="btn btn-sm btn-primary" >목록으로</a>
	</div>
</div>
</body>
</html>