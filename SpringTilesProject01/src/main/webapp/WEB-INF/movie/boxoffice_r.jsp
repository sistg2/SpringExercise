<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script type="text/javascript">
$(function(){
	Highcharts.chart('container1', {
		chart: {
			type: 'column'
		},
		title: {
			text: '일별 박스오피스 관객수 현황, 2019'
	    },
	    xAxis: {
			type: 'category'
	    },
		yAxis: {
			title: {
				text: '일별 관객수'
	    	}
		},
		legend: {
			enabled: false
		},
		plotOptions: {
			series: {
				borderWidth: 0,
				dataLabels: {
					enabled: true,
					format: '{point.y:.1f}'
				}
			}
		},
		tooltip: {
			headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
			pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.1f}명</b> of total<br/>'
	    },
		series: [{
			name: "영화명",
			colorByPoint: true,
			data: <%= request.getAttribute("result") %>
		}]
	});
});
</script>
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary" >일별 박스오피스</h6>
	</div>
	
	<div id="root">
	
	</div>
	<div id="container1" style="min-width:600px; height:500px; max-width:900px; margin:0 auto;"></div>		
		<script type="text/babel">
			class MovieReserve extends React.Component{
				// 데이터 저장하는 변수 설정 => props(속성:불변) / state(상태:데이터 변경)
				constructor(props) {
					super(props);
					// 변수 선언
					this.state = {
							data_json:[],
							data_detail:{},
							isShow:false
					}
					// 이벤트 선언
					
				}
				componentWillMount() {
					var _this = this;
					axios.get('http://localhost:8080/mvc/movie/boxoffice_data.do', {
						params:{
							no:1
						}
					}).then((response)=>{
						_this.setState({data_json:response.data});
						console.log(response.data);
					});
				}
				handleClick(m) {
					this.setState({data_detail:m, isShow:true});
				}
				render() {
					const html = this.state.data_json.map((m)=>
						<tr onClick={this.handleClick.bind(this, m)} >
							<td>{m.movieNm}</td>
							<td>{m.salesAmt}</td>
							<td>{m.audiCnt}</td>
							<td>{m.rankInten}</td>
						</tr>
					);
					return (
						<div className="row" >
							<div className="col-sm-5">
								{this.state.isShow==true?<MovieDetail data_detail={this.state.data_detail}/>:null }
							</div>
							<div className="col-sm-7">
								<table className="table table-striped">
									<thead>
										<th>영화명</th>
										<th>매출액</th>
										<th>관객수</th>
										<th>증감율</th>
									</thead>
									<tbody>
										{html}
									</tbody>
								</table>
								<table className="table">
									<tr>
										<td className="text-center" >
											
										</td>
									</tr>
								</table>
							</div>
						</div>
					)
				}
				componentDidMount() {
					
				}
			}
			
			class MovieDetail extends React.Component{
				render() {
					return (
						<table className="table table-hover" >
							<tr>
								<td width="30%" rowSpan="8" className="text-center" >
									<img src={"http://www.kobis.or.kr"+this.props.data_detail.thumbUrl} width="100%" />
								</td>
								<td width="70%" colSpan="2" >
									{this.props.data_detail.movieNm} <br/>
									<sub style={{"color":"gray"}} >{this.props.data_detail.movieNmEn}</sub>
								</td>
							</tr>
							<tr>
								<td width="20%" className="text-right" >개봉일</td>
								<td width="50%" >
									{this.props.data_detail.startDate}
								</td>
							</tr>
							<tr>
								<td width="20%" className="text-right" >제작상태</td>
								<td width="50%" >
									{this.props.data_detail.moviePrdtStat}
								</td>
							</tr>
							<tr>
								<td width="20%" className="text-right" >관람등급</td>
								<td width="50%" >
									{this.props.data_detail.watchGradeNm}
								</td>
							</tr>
							<tr>
								<td width="20%" className="text-right" >상영시간</td>
								<td width="50%" >
									{this.props.data_detail.showTm}
								</td>
							</tr>
							<tr>
								<td width="20%" className="text-right" >제작국가</td>
								<td width="50%" >
									{this.props.data_detail.repNationCd}
								</td>
							</tr>
							<tr>
								<td width="20%" className="text-right" >장르</td>
								<td width="50%" >
									{this.props.data_detail.genre}
								</td>
							</tr>
							<tr>
								<td width="20%" className="text-right" >감독</td>
								<td width="50%" >
									{this.props.data_detail.director}
								</td>
							</tr>
						</table>
					)
				}

			}
			ReactDOM.render(<MovieReserve />, document.getElementById('root'));
		</script>
</div>
</body>
</html>