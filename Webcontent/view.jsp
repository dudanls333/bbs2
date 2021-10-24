<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="" >
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>2016 굿모닝 경기 소통 크리에이터 공모전</title>
    <link rel="stylesheet" type="text/css" href="css/general.css" >
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.scrollTo-min.js"></script>
    <script src="/js/layout.js"></script>
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
	<%
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alrert('유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
<div id="wrap">
    <!-- @ CONTAINER -->
    <section id="container" class="sub">
        <!-- @ CONTENTS -->
        <div id="contents">
            <!-- @ SUB TITLE AREA -->
            <div class="sub-title-area">
                <h2 class="tit">News & Info 
            </div>
            <div class="write_title">
                <%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
            </div>
            <div class="write_date">
                <span class="write_line"><strong>작성자  :</strong> <%= bbs.getBbsName().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %> </span>
                <span class="write_line"><strong>조회수  :</strong> 1125 </span>
                <span class="write_line">2015.11.11:10:10</span>
                <span><em class="file_icon"></em><a href="#"> 123.hwp</a></span>

            </div>
            <div class="con_box">
                <%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
            </div>

            <div class="btn_area">
                <button type="button" class="btn_blue" onclick="location.href='bbs.jsp'" style='cursor:pointer;'>목록</button>
				<button type="button" class="btn_blue" onclick="location.href='update.jsp?bbsID=<%= bbsID %>'" style='cursor:pointer;'>수정</button> 
				<button type="button" class="btn_blue" onclick="location.href = 'deleteAction.jsp?bbsID=<%= bbsID %>'"  style='cursor:pointer;'>삭제</button> 
				 <!-- <a href="bbs.jsp" class="btn_blue">목록</a>
				<button type="button" class="btn_blue" onclick="zz">수정</button> 
				<button type="button" class="btn_blue">삭제</button>  -->
            </div>
        </div>
        <!-- CONTENTS @ -->
    </section>
    <!-- CONTAINER @ -->
</div>
</body>
</html>