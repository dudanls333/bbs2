<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
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
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}	
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if( /* bbs.getBbsTitle() == null || bbs.getBbsContent() == null || bbs.getBbsName() == null) {
		            PrintWriter script = response.getWriter(); */
		            request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
		            || request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")){
		            PrintWriter script = response.getWriter();
		            script.println("<script>");
		            script.println("alert('입력이 안된 사항이 있습니다.')");
		            script.println("history.back()");
		            script.println("</script>");
		        } else {
		            BbsDAO bbsDAO = new BbsDAO();
		            int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
		                if(result == -1){ // 글쓰기에 실패했을 경우
		                    PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
		                    script.println("<script>");
		                    script.println("alert('글 수정에 실패했습니다.')");
		                    script.println("history.back()");
		                    script.println("</script>");
		                }
		                else { // 글쓰기에 성공했을 경우
		                    PrintWriter script = response.getWriter();
		                    script.println("<script>");
		                    script.println("location.href= 'bbs.jsp'");
		                    script.println("</script>");
		                    }
		            }
		%>
        }
</body>
</html>