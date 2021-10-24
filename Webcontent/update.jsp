<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
    <script type="text/javascript" src="../js/jquery.scrollTo-min.js"></script>
    <script src="../js/layout.js"></script>
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
<div id="wrap">
     <!-- @ CONTAINER -->
     <%
     	int bbsID = 0;
     	if(request.getParameter("bbsID") != null){
     		bbsID = Integer.parseInt(request.getParameter("bbsID"));
     	}
     	if(bbsID == 0){
     		PrintWriter script = response.getWriter();
     		script.println("<script>");
     		script.println("alert('유효하지 않은 글입니다.'");
     		script.println("location.href = 'bbs.jsp'");
     		script.println("/script>");
     	}
     	Bbs bbs = new BbsDAO().getBbs(bbsID);
     %>
     <section id="container" class="sub">
        <!-- @ CONTENTS -->
        <div id="contents">
              <form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>"> 
              <div class="sub-title-area">
               
                <h2 class="tit">News & Info </h2>
				</div>
                <table class="basic_write">
                    <caption>News 입력</caption>
                    <colgroup>
                        <col style="width:150px">
                        <col style="width:*">
                    </colgroup>
               
					   <tr>
                        <th>제목<span class="star">*</span></th>
                        <td><input type="text" title="제목" name="bbsTitle" id="" class="add_txt"  placeholder="제목 *" value="<%=bbs.getBbsTitle() %>"></td>
                    </tr>
                    <tr>
                        <th>작성자<span class="star">*</span></th>
                        <td><input type="text" title="성명" name="bbsName" id="" class="name_txt" placeholder="성명 *" value="<%=bbs.getBbsName()%>"></td>
                    </tr>
                 
                    <tr>
                        <th>첨부파일</th>
                        <td>
                            <input type="file" title="첨부파일" name="file" id="" placeholder="학과/부서" class="name_txt">
                        </td>
                    </tr>
                    <tr>
                        <th>내용 <span class="star">*</span></th>
                        <td>
                           <%-- <input type="text" class="form-control" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsContent() %>"> --%>
                           <textarea name="bbsContent" id="" cols="30" rows="10" style="width:100%"><%=bbs.getBbsContent()%></textarea>
                        </td>
                    </tr>
                
                </table>               
                <div class="btn_area">
					<button type="submit" class="btn_blue">확인</button>
					<a href="bbs.jsp" class="btn_blue_line">취소</a>
                </div>
             </form> 
        </div>
        <!-- CONTENTS @ -->
    </section>
    <!-- CONTAINER @ -->
</div>
</body>
</html>