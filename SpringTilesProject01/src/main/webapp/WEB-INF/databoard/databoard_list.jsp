<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<table class="table table-borderless" style="margin: 5px auto;">
			<tr>
				<td width=80% class="text-left" style="padding: 0px;" >
					<h6 class="m-0 font-weight-bold text-primary" >자료실 목록</h6>
				</td>
				<td width=20% class="text-right" style="padding: 0px;" >
					<a href="databoard_insert.do" class="btn btn-sm btn-primary" >새글</a>
				</td>
			</tr>
		</table>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th class="text-center" width=10% >번호</th>
						<th class="text-center" width=45% >제목</th>
						<th class="text-center" width=15% >이름</th>
						<th class="text-center" width=20% >작성일</th>
						<th class="text-center" width=10% >조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
					<tr>
						<td class="text-center" >${vo.no }</td>
						<td>
							<a href="databoard_detail.do?no=${vo.no }" >${vo.subject }</a>
						</td>
						<td class="text-center" >${vo.name }</td>
						<td class="text-center" >
							<fmt:formatDate value="${vo.regdate }" pattern="yyyy/MM/dd" />
						</td>
						<td class="text-center" >${vo.hit }</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan=5 class="text-center" >
							<a href="databoard_list.do?page=${curpage==1?1:curpage-1 }" class="btn btn-sm btn-light" >이전</a>&nbsp;
							${curpage } page / ${totalpage } pages
							&nbsp;<a href="databoard_list.do?page=${curpage==totalpage?totalpage:curpage+1 }" class="btn btn-sm btn-light" >다음</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
</body>
</html>