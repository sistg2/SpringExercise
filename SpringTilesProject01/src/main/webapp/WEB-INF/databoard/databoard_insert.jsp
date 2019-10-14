<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var fileIndex = 0;
$(function(){
	$('#add').click(function(){
		$('#fileView').append(
			'<tr id="f'+fileIndex+'" >'
		   +'<th width=20% class="text-right" >파일 '
		   +(fileIndex+1)
		   +'</th>'
		   +'<td width=80% class="text-left" >'
		   +'<input type="file" name="files[' + (fileIndex) + ']" size=30 >'
		   +'</td>'
		   +'</tr>'
		);
		fileIndex = fileIndex+1;
	});
	$('#can').click(function(){
		if(fileIndex > 0) {
			$('#f'+(fileIndex-1)).remove();
			fileIndex = fileIndex - 1;
		}
	});
});
</script>
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">자료실 등록</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<form method="post" action="databoard_insert_ok.do" enctype="multipart/form-data" >
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tbody>
						<tr>
							<th width=20% class="text-right" >이름</th>
							<td width=80% class="text-left" >
								<input type="text" id="name" name="name" size=15 >
							</td>
						</tr>
						<tr>
							<th width=20% class="text-right" >제목</th>
							<td width=80% class="text-left" >
								<input type="text" id="subject" name="subject" size=40 >
							</td>
						</tr>
						<tr>
							<th width=20% class="text-right" >내용</th>
							<td width=80% class="text-left" >
								<textarea rows=8 cols=45 name="content"></textarea>
							</td>
						</tr>
						<tr>
							<th width=20% class="text-right" >첨부파일</th>
							<td width=80% class="text-left" >
								<table class="table" >
									<tr>
										<td class="text-right" >
											<input type="button" id="add" class="btn btn-sm btn-danger" value="추가" >
											<input type="button" id="can" class="btn btn-sm btn-secondary" value="취소" >
										</td>
									</tr>
								</table>
								<table class="table" id="fileView" >
									
								</table>
							</td>
						</tr>
						<tr>
							<th width=20% class="text-right" >비밀번호</th>
							<td width=80% class="text-left" >
								<input type="password" id="pwd" name="pwd" size=10 >
							</td>
						</tr>
						<tr>
							<td colspan=2 class="text-center" >
								<input type="submit" class="btn btn-danger" value="등록" >&nbsp;&nbsp;
								<input type="button" class="btn btn-secondary" value="취소" 
									onclick="javascript:history.back();"
								>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>