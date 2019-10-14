<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8" >
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/1.4.8/socket.io.min.js" ></script>
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary" >실시간 React 채팅</h6>
	</div>
	<div id="root" class="container-fluid" >

	</div>
	<script type="text/babel" >
		const socket = io.connect('http://localhost:3355');
		class ChatApp extends React.Component {
			constructor(props) {
				super(props);
				this.state={
					logs:[]
				}
			}
			componentWillMount() {

			}
			render(){
				const messages = this.state.logs.map((m)=>
					<div>
						<span>[{m.name}]</span> &nbsp;
						<span>{m.message}</span>
						<p style={{"clear":"both"}} />
					</div>
				);
				return(
					<div style={{"marginTop":"30px", "marginBottom":"30px"}}>
						{messages}
						<ChatForm />
					</div>
				)
			}
			componentDidMount() {
				// 서버에서 받은 메세지
				socket.on('chat-msg', (obj)=>{
					const logs2 = this.state.logs;
					// 메서드는 새로운 요소를 배열의 맨 앞쪽에 추가하고, 새로운 길이를 반환합니다.
					logs2.unshift(obj);
					this.setState({logs:logs2});
				});
			}
			/*
			1. ES6.0 => const, let, 화살표(function, return 생략)
			2. jsx (babel)
			   === JavaScript+XML
			3. map()
			*/
		}
		class ChatForm extends React.Component {
			constructor(props) {
				super(props);
				this.state = {
					main:'',
					message:''
				}
			}
			nameChange(e) {
				this.setState({name:e.target.value})
			}
			messageChange(e) {
				this.setState({message:e.target.value})
			}
			send(e) {
				// 값을 전송
				socket.emit('chat-msg', {
					name:this.state.name,
					message:this.state.message
				});
				this.setState({message:''});
			}
			componentWillMount() {

			}
			render(){
				return (
					<div style={{"marginTop":"30px", "marginBottom":"30px"}}>
						이름 <input type="text" size="10" className="form-control"
								onChange={this.nameChange.bind(this)} /><br/>
						내용 <textarea rows="4" cols="50" className="form-control"
								onChange={this.messageChange.bind(this)} value={this.state.message} ></textarea> <br/>
						<input type="button" value="전송" className="btn btn-primary"
								onClick={this.send.bind(this)} />
					</div>
				)
			}
			componentDidMount() {
				
			}
		}
		ReactDOM.render(<ChatApp />, document.getElementById('root'));
	</script>
</div>
</body>
</html>