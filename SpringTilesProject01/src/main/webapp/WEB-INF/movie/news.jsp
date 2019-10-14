<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary" >영화 뉴스</h6>
	</div>
	<div style="width: 960px; margin: 0px auto; margin-top: 30px;" >
		<table class="table" >
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>
						<table class="table" >
							<tr>
								<td width=30% class="text-center" rowspan=3 >
									<img src="${vo.poster }" width=100% >
								</td>
								<td width=70% class="text-left" >
									<b><a href="../movie/newsDetail.do?no=${vo.no }" >${vo.title }</a></b>
								</td>
							</tr>
							<tr>
								<td width=70% class="text-left" >
									${vo.content }
								</td>
							</tr>
							<tr>
								<td width=70% class="text-left" >
									<font color="Lightgrey" > ${vo.author } | ${vo.regdate } </font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td class="text-center">
					<ul class="pagination justify-content-center" >
						<li class="paginate_button page-item" >
							<a href="../movie/news.do?&page=1" class="page-link" >&lt;&lt;</a>
						</li>
						<c:forEach var="p" begin="1" end="${totalpage }" >
							<c:set var="act" value="" />
							<c:if test="${p==curpage }" >
								<c:set var="act" value="active" />
							</c:if>
							<c:if test="${p!=curpage }" >
								<c:set var="act" value="" />
							</c:if>
							<li class="paginate_button page-item ${act }" >
								<a href="../movie/news.do?&page=${p}" class="page-link " >${p }</a>
							</li>
						</c:forEach>
						<li class="paginate_button page-item" >
							<a href="../movie/news.do?page=${totalpage}" class="page-link" >&gt;&gt;</a>
						</li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>