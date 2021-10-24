<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}

	BbsDAO bbsDAO = new BbsDAO();
	int result = bbsDAO.delete(bbsID);
	if (result == -1) { // 글쓰기에 실패했을 경우
		PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
		script.println("<script>");
		script.println("alert('글 삭제에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else { // 글쓰기에 성공했을 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href= 'bbs.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>