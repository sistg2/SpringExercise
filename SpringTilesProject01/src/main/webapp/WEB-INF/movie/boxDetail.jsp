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
		<h6 class="m-0 font-weight-bold text-primary" >상세보기 - ${vo.title }</h6>
	</div>
	<div class="text-center" style="width=960px; margin: 0px auto; margin-top: 30px;" >
		<c:if test="${vo.key!=null && vo.key!='' }" >
			<embed src="http://youtube.com/embed/${vo.key }" width=960 height=450 >
		</c:if>
		<table class="table" >
			<tr>
				<td width=30% class="text-center" rowspan=7 >
					<img src="${vo.poster }" width=100% >
				</td>
				<td colspan=2 width=70% class="text-center" >${vo.title }</td>
			</tr>
			<tr>
				<td class="text-right" width=20% >평점</td>
				<td class="text-left" width=50% >${vo.score }</td>
			</tr>
			<tr>
				<td class="text-right" width=20% >감독</td>
				<td class="text-left" width=50% >${vo.director }</td>
			</tr>
			<tr>
				<td class="text-right" width=20% >출연</td>
				<td class="text-left" width=50% >${vo.actor }</td>
			</tr>
			<tr>
				<td class="text-right" width=20% >장르</td>
				<td class="text-left" width=50% >${vo.genre }</td>
			</tr>
			<tr>
				<td class="text-right" width=20% >개봉일</td>
				<td class="text-left" width=50% >${vo.regdate }</td>
			</tr>
			<tr>
				<td class="text-right" width=20% >등급</td>
				<td class="text-left" width=50% >${vo.grade }</td>
			</tr>
			<tr>
				<td colspan=3 class="text-left" valign="top" width="960px">
					<pre style="background-color: white; white-space: pre-wrap;" >${vo.story }</pre>
				</td>
			</tr>
		</table>
	</div>
	<div class="text-right" >
		<input type="button" class="btn btn-sm btn-primary" onclick="javascript:history.back();" value="목록으로" >
	</div>
</div>
</body>
</html>