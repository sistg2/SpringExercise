<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8 >
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SIST 영화 예측 센터</title>
<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link href="../css/chat.css" rel="stylesheet">
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">

	<!-- menu위치(sidebar) -->
	<tiles:insertAttribute name="nav"  />

    <!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
		<!-- Main Content -->
		<div id="content">
			
			<!-- Topbar -->
			<tiles:insertAttribute name="topbar" />
			<!-- end of Topbar -->
			
			<!-- Begin Page Content -->
			<div class="container-fluid">
			
				<!-- Page Heading -->
				<div class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">HOME</h1>
					<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
						<i class="fas fa-download fa-sm text-white-50"></i>
						 Generate Report
					</a>
				</div>
				
				<!-- Content Row -->
				<tiles:insertAttribute name="top_content" />
				<!-- End Content Row -->
				
				<!-- body insert -->
				<tiles:insertAttribute name="body" />
				
			</div>
			<!-- /.container-fluid -->
		
		</div>
		<!-- End of Main Content -->
	
		<!-- Footer -->
		<tiles:insertAttribute name="footer" />
		<!-- End of Footer -->
	</div>
	<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
	<i class="fas fa-angle-up"></i>
</a>

<div id="chat_container" >

</div>

<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/1.4.8/socket.io.min.js" ></script>

<script type="text/babel">
// 접속 (connection)
const socket=io.connect('http://localhost:3355');
class ChatApp extends React.Component{
	constructor(props){
		super(props);
		this.state={
			logs:[],
			name:''
		}
	}
	componentWillMount(){
		var _this = this;
		axios.get('http://localhost:8080/mvc/member/id_get.do').then(function(res){
			_this.setState({name:res.data});
			console.log(res.data);
		});				
	}
	render(){
		return (
			<ChatForm logs={this.state.logs} name={this.state.name} />
		)
	}
	componentDidMount(){
		socket.on('chat-msg',(obj)=>{
			const logs2=this.state.logs;
 			//메서드는 새로운 요소를 배열의 맨 앞쪽에 추가하고, 새로운 길이를 반환합니다.
			logs2.push(obj)
			this.setState({logs:logs2});
		});
		$('div#chat').toggleClass('active');
		var $win = $(window);
		var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
		/*사용자 설정 값 시작*/
		var speed          = 1000;     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
		var easing         = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
		var $layer         = $('div#chat_container'); // 레이어 셀렉팅
		var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
		$layer.css('position', 'absolute');
		/*사용자 설정 값 끝*/
	  
		// 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
		if (top > 0 )
			$win.scrollTop(layerTopOffset+top);
		else
			$win.scrollTop(0);
	  
		//스크롤이벤트가 발생하면
		$(window).scroll(function(){
			var yPosition = $win.scrollTop()+300;
			if (yPosition < 0){
				yPosition = $win.scrollTop()+300;
			}
			$layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
		});
	}
}
class ChatForm extends React.Component{
	constructor(props){
		super(props);
		this.state={
			name:'',
			message:''
		}
	}
	messageChange(e) {
		this.setState({message:e.target.value})
	}
	send(e) {
		if (e.key === "Enter") {
			e.preventDefault();
			// 값을 전송 
			socket.emit('chat-msg',{
				message:"[" + this.props.name + "]" + this.state.message
			})
			this.setState({message:''});
		}
	}
	render() {
		const messages=this.props.logs.map((m)=>
			<div className="message right">
				<div className="message-text">{m.message}</div>
			</div>
		);
		return (
			<div id="chat" className='active'>
				<header><h1>Chat</h1></header>
				<section className="content">
					<div className="message_content">
						{messages}
					</div>
				</section>
				<form action="">
					<input id="input_chat" type="text" onChange={this.messageChange.bind(this)} onKeyPress={this.send.bind(this)}
						value={this.state.message}
					/>
				</form>
			</div>
		)
	}
	componentDidMount(){}
}
ReactDOM.render(<ChatApp />,document.getElementById("chat_container"))
  </script>

<!-- Page level plugins -->
<script src="../vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="../js/demo/chart-area-demo.js"></script>
<script src="../js/demo/chart-pie-demo.js"></script>

</body>
</html>