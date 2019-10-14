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
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h4 class="m-0 font-weight-bold text-primary" id="boapp_title" >영화 찾기</h4>
	</div>
	<div id="root" class="container-fluid" >

	</div>
	<script type="text/babel">
		class MovieSearch extends React.Component{
			// 변수 선언
			constructor(props) {
				super(props);
				this.state = {
					movie_data:[],
					fd:''
				}
				// 이벤트 선언
				this.handleUserInput = this.handleUserInput.bind(this);
			}
			handleUserInput(ss) {
				this.setState({fd:ss});
			}
			// 데이터 받기
			componentWillMount() {
				var _this = this;
				axios.get('http://localhost:8080/mvc/movie/find_data.do').then((res)=>{
					_this.setState({movie_data:res.data});
					console.log(res);
				});
			}

			// 화면 출력
			render() {
				return (
					<div className="row text-center">
						<SearchBar fd={this.state.fd} onUserInput={this.handleUserInput} />
						<MovieTable movie={this.state.movie_data} ss={this.state.fd} />
					</div>
				)
			}

			// 연동 (jquery, angularjs)
			componentDidMount() {

			}
		}

		class MovieTable extends React.Component{
			render() {
				var rows = [];
				this.props.movie.map((m)=>{
					if(m.title.indexOf(this.props.ss) == -1) {
						return;
					}

					rows.push(<MovieRow movie={m} key={m.title} />);
				});
				return(
					<table className="table table-hover" >
						<thead>
							<tr className="secondary" >
								<th className="text-center" ></th>
								<th className="text-center" >영화명</th>
								<th className="text-center" >감독</th>
								<th className="text-center" >출연</th>
								<th className="text-center" >장르</th>
							</tr>
						</thead>
						<tbody>
							{rows}
						</tbody>
					</table>
				)
			}
		}

		class MovieRow extends React.Component{
			render(){
				return(
					<tr>
						<td className="text-center" >
							<img src={this.props.movie.poster} width="30" height="42" />
						</td>
						<td className="text-left" >{this.props.movie.title}</td>
						<td className="text-left" >{this.props.movie.director}</td>
						<td className="text-left" >{this.props.movie.actor}</td>
						<td className="text-left" >{this.props.movie.genre}</td>
					</tr>
				)
			}
		}

		class SearchBar extends React.Component{
			constructor(props){
				super(props);
				this.handleChange = this.handleChange.bind(this);
			}
			handleChange() {
				this.props.onUserInput(this.filterText.value);
			}
			/*handleChange(e) {
				this.props.onUserInput(e.target.value);
			}*/
			render() {
				return(
					<table className="table" style={{"width":"400px"}}>
						<tr>
							<td >
								<input type="text" className="form-control bg-light border-0 small" size="30" placeholder="영화명" 
										value={this.props.fd}
										ref={(input)=>this.filterText=input} // 삭제가능
										onChange={this.handleChange}
								/>
							</td>
						</tr>
					</table>
				)
			}
		}
		
		ReactDOM.render(<MovieSearch />, document.getElementById('root'));
	</script>









</div>
</body>
</html>
