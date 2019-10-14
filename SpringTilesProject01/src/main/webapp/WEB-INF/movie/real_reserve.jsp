<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="https://unpkg.com/react-router-dom/umd/react-router-dom.min.js"></script>
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary" >실시간 예매율</h6>
	</div>
	<div id="root">
	
	</div>		
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
							no:2
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
							<td>{m.totIssuCntRatio}</td>
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
										<th>예매율</th>
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