<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<title>2016 굿모닝 경기 소통 크리에이터 공모전</title>
<link rel="stylesheet" type="text/css" href="css/general.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.scrollTo-min.js"></script>
<script src="js/layout.js"></script>
<!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
	<%
	int pageNumber = 1;
			if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
	%> 
	<% if(pageNumber > 0) {%>
	<div id="wrap">
		<!-- @ CONTAINER -->
		<section id="container" class="sub  new">
			<!-- @ CONTENTS -->
			<div id="contents">
				<!-- @ SUB TITLE AREA -->
				<div class="sub-title-area">
					<h2 class="tit">News & Info</h2>
				</div>
				<div class="btn_area">
					<a href="write.jsp" class="btn_blue_line">글쓰기</a>
				</div>
				<!-- 페이징 처리는 5개씩 해주세요-->
				<table class="news_list">
					<caption>News 리스트</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: *">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 5%">
						<col style="width: 8%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회</th>
							<th scope="col">첨부</th>
						</tr>
					</thead>
					<tbody>
						<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getBbsID()%></td>
							<td class="board_txt">
								<p>
									<a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"
										class="ellip"> <%=list.get(i).getBbsTitle()%></a>
								</p>
							</td>
							<td class="board_man"><%=list.get(i).getBbsName()%></td>
							<td class="board_date"><%=list.get(i).getBbsDate()%></td>
							<td class="board_read">989</td>
							<td class="board_file"><span class="file_icon">파일다운로드</span>
						</tr>
						<%
						}
						%>
					
				</table>
			
				<div class="pagination">
					<a class="prev end">첫 페이지</a> 
					<a class="prev"	href="bbs.jsp?pageNumber=<%=pageNumber - 1%>">이전 페이지</a> 
					<a href="bbs.jsp?pageNumber=<%=pageNumber = 1%>" class="on">1</a>
					<a href="bbs.jsp?pageNumber=<%=pageNumber = 2%>">2</a> 
					<a href="bbs.jsp?pageNumber=<%=pageNumber = 3%>">3</a> 
					<a href="bbs.jsp?pageNumber=<%=pageNumber = 4%>">4</a> 
					<a href="bbs.jsp?pageNumber=<%=pageNumber = 5%>">5</a> 
					<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="next">다음 페이지</a>
					<a href="#" class="next end">마지막 페이지</a>
				</div>
				<div class="find_wrap">
					<select name="" id="">
						<option value="">제목</option>
						<option value="">내용</option>
					</select> <input type="text" name="" id="" title="검색어 입력"
						placeholder="검색어 입력"> <a href="#" class="btn_gray">검색</a>
				</div>
			</div>
			<!-- CONTENTS @ -->
		</section>
		<!-- CONTAINER @ -->
	</div>
	<%} else if(pageNumber <= 0) {%>
	<script>alert('첫번째 페이지 입니다') </script>
	<script>history.back() </script>
	<%} %>	
</body>
</html>