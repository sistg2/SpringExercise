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
		<h6 class="m-0 font-weight-bold text-primary">상세보기</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tr>
					<th class="text-center" width=20% >글번호</th>
					<td class="text-center" width=30% >${vo.no }</td>
					<th class="text-center" width=20% >작성일</th>
					<td class="text-center" width=30% >
						<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" />
					</td>
				</tr>
				<tr>
					<th class="text-center" width=20% >이름</th>
					<td class="text-center" width=30% >${vo.name }</td>
					<th class="text-center" width=20% >조회수</th>
					<td class="text-center" width=30% >${vo.hit }</td>
				</tr>
				<tr>
					<th class="text-center" width=20% >제목</th>
					<td colspan=3 class="text-left" width=80% >${vo.subject }</td>
				</tr>
				<c:if test="${vo.filecount>0 }" >
					<tr>
						<th class="text-center" width=20% >첨부파일</th>
						<td colspan=3 class="text-left" width=80% >
							<ul>
								<c:forEach var="fn" items="${fList }" varStatus="s">
									<li>
										<a href="databoard_download.do?fn=${fn }">${fn }</a> (${sList[s.index] }Bytes)
									</li>
								</c:forEach>
							</ul>
						</td>
					</tr>
				</c:if>
				<tr>
					<td colspan=4 valign="top" class="text-left" height=200px >
						<pre style="white-space: pre-wrap; background-color: white;" >${vo.content }</pre>
					</td>
				</tr>
				<tr>
					<td colspan=4 class="text-right" >
						<a href="#" class="btn btn-sm btn-light" >수정</a>
						<a href="#" class="btn btn-sm btn-light" >삭제</a>
						<a href="databoard_list.do" class="btn btn-sm btn-danger" >목록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>