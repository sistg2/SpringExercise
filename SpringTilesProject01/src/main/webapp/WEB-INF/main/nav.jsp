<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8" >
<title>Insert title here</title>
</head>
<body>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="../main/main.do" >
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			SIST MOVIE <sup>CENTER</sup>
		</div>
	</a>
	
	<!-- Divider -->
	<hr class="sidebar-divider my-0">
	
	<!-- Nav Item - Dashboard -->
	<li class="nav-item active">
		<a class="nav-link" href="../main/main.do">
			<i class="fas fa-fw fa-tachometer-alt"></i>
			<span>Home</span>
		</a>
	</li>
	
	<!-- Divider -->
	<hr class="sidebar-divider">
	
	<!-- Heading -->
	<div class="sidebar-heading">
		영화정보
	</div>
	
	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			<i class="fas fa-fw fa-cog"></i>
			<span>현재상영/개봉예정</span>
		</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">영화정보검색 : </h6>
				<a class="collapse-item" href="../movie/movielist.do?type=1">현재상영</a>
				<a class="collapse-item" href="../movie/movielist.do?type=2">개봉예정</a>
				<a class="collapse-item" href="../movie/news.do">뉴스</a>
				<a class="collapse-item" href="../movie/movieFind.do">검색</a>
			</div>
		</div>
	</li>
	
	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-wrench"></i>
			<span>박스오피스</span>
		</a>
		<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">박스오피스:</h6>
				<a class="collapse-item" href="../movie/boxoffice.do?type=1">주간</a>
				<a class="collapse-item" href="../movie/boxoffice.do?type=2">월간</a>
				<a class="collapse-item" href="../movie/boxoffice.do?type=3">연간</a>
				<a class="collapse-item" href="../movie/boxoffice1.do" >일별 박스오피스</a>
				<a class="collapse-item" href="../movie/boxoffice2.do" >실시간 예매율</a>
				<a class="collapse-item" href="../movie/boxoffice3.do" >좌석 점유율</a>
				<a class="collapse-item" href="../movie/boxoffice4.do" >온라인 이용순위</a>
			</div>
		</div>
	</li>
	
	<!-- Divider -->
	<hr class="sidebar-divider">
	
	<!-- Heading -->
	<div class="sidebar-heading">
		고객센터
	</div>
	
	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
			<i class="fas fa-fw fa-folder"></i>
			<span>커뮤니티</span>
		</a>
		<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="login.html">자유게시판</a>
				<a class="collapse-item" href="../databoard/databoard_list.do">자료실</a>
				<a class="collapse-item" href="../chat/react_chat.do">실시간 채팅</a>
			</div>
		</div>
	</li>
	
	<!-- Nav Item - Charts -->
	<li class="nav-item">
		<a class="nav-link" href="../chart/recommand.do">
			<i class="fas fa-fw fa-chart-area"></i>
			<span>영화 추천 통계 정보</span>
		</a>
	</li>
	
	<!-- Nav Item - Tables -->
	<li class="nav-item">
		<a class="nav-link" href="tables.html">
			<i class="fas fa-fw fa-table"></i>
			<span>개봉 영화 예측</span>
		</a>
	</li>
	
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	
	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->
</body>
</html>