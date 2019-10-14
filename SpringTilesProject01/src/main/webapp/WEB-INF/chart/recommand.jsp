<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8" >
<title>Insert title here</title>
<script src="http://unpkg.com/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js" ></script>
<script type="text/javascript">
$(function(){
	$('.genreBtn').click(function(){
		var no = $(this).attr('data-no');
		$.ajax({
			type:'post',
			url:'../chart/recommand_data.do',
			data:{no:no},
			success:function(response) {
				// alert(response);
				var genre_data = response.split(",");
				var html = "";
				for(i = 0; i < genre_data.length; i++) {
					html += '<input type="button" class="btn btn-xs btn-light" value="' + genre_data[i] + '" onclick="recommand(\'' + genre_data[i] + '\')" >&nbsp;';
				}
				$('#print').html(html);
			}
		});
	});
});
function recommand(rd) {
	alert(rd);
}
</script>
<style type="text/css">
.genreBtn {
/* 	border: 2px #858795 solid;
	border-radius: 20px; */
}
</style>
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary" >영화 추천</h6>
	</div>
	<div class="container" >
		<div class="row text-center" >
			<table class="table" >
				<tr>
					<td class="text-center" >
						<input type="button" class="btn btn-lg btn-secondary genreBtn" data-no="1" value="장르" >&nbsp;
						<input type="button" class="btn btn-lg btn-secondary genreBtn" data-no="2" value="상황" >&nbsp;
						<input type="button" class="btn btn-lg btn-secondary genreBtn" data-no="3" value="감성" >&nbsp;
						<input type="button" class="btn btn-lg btn-secondary genreBtn" data-no="4" value="날씨/계절" >
					</td>
				</tr>
				<tr>
					<td id="print" ></td>
				</tr>
				
			</table>
		</div>
	</div>
</div>
</body>
</html>