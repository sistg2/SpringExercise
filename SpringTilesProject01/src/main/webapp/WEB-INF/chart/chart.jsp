<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8" >
<title>Insert title here</title>
<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js" ></script>
<script type="text/javascript">
$(function(){
	$('.clicks').click(function(){
		var mno = $(this).attr("value");
		alert(mno);
	});
});
</script>
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary" >영화 목록</h6>
	</div>
	<div id="app" class="container-fluid" >
		<div class="row" >
			<div class="col-sm-8" >
				<box-office v-bind:boxdata="box_data"></box-office>
			</div>
			<div class="col-sm-4" >
				<table class="table" >
					<tr>
						<td class="text-center" width="30%" rowspan="7" >
							<img :src="box_detail.poster" width=100%>
						</td>
						<td class="text-left" colspan="2" >{{box_detail.title}}</td>
					</tr>
					<tr>
						<td width="30%" class="text-right" >감독</td>
						<td width="40%" class="text-left" >{{box_detail.director}}</td>
					</tr>
					<tr>
						<td width="30%" class="text-right" >출연</td>
						<td width="40%" class="text-left" >{{box_detail.actor}}</td>
					</tr>
					<tr>
						<td width="30%" class="text-right" >장르</td>
						<td width="40%" class="text-left" >{{box_detail.genre}}</td>
					</tr>
					<tr>
						<td width="30%" class="text-right" >등급</td>
						<td width="40%" class="text-left" >{{box_detail.grade}}</td>
					</tr>
					<tr>
						<td width="30%" class="text-right" >평점</td>
						<td width="40%" class="text-left" >{{box_detail.score}}</td>
					</tr>
					<tr>
						<td width="30%" class="text-right" >개봉일</td>
						<td width="40%" class="text-left" >{{box_detail.regdate}}</td>
					</tr>
					<tr>
						<td colspan="3" >{{box_detail.story}}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script>
	var eventBus=new Vue();
	Vue.component('box-office',{
		props:['boxdata'],
		templage:'<table class="table table-hover" >'
					+'<thead>'
						+'<tr class="success" >'
							+'<th></th>'
							+'<th>영화명</th>'
							+'<th>감독</th>'
							+'<th>출연</th>'
							+'<th>개봉일</th>'
						+'</tr>'
						+'<tr v-for="m in boxdata">'
							+'<td><img :src="m.poster" width="35" height="35"></td>'
							+'<td v-on:click="showMovie(m.mno)">{{m.title}}</td>'
							+'<td>{{m.director}}</td>'
							+'<td>{{m.actor}}</td>'
							+'<td>{{m.regdate}}</td>'
						+'</tr>'
					+'</thead>'
				+'</table>',
		methods:{
			showMovie:function(value){
				//alert("value: " +value);
				eventBus.$emit('showMovieEvent',value);
			}
		}
	});
	new Vue({
		el:'#app',
		data:{
			box_data:[],
			box_detail:{},
			mno:1
		},
		mounted:function(){
			var _this=this;
			axios.get('http://localhost:8080/mvc/chart/chart_data.do').then(function(response){
				_this.box_data=response.data;
			});
		},
		updated:function(){
			var _this=this;
			eventBus.$on('showMovieEvent',function(value){
				_this.mno=value;
				axios.get('http://localhost:8080/mvc/chart/chart_detail.do',{
					params:{
						mno:_this.mno
					}
				}).then(function(response){
					_this.box_detail=response.data
				});
			})
		}
	})
	</script>	
</div>
</body>
</html>