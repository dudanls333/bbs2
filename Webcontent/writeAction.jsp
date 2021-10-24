<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<jsp:setProperty name="bbs" property="bbsName" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<%
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null || bbs.getBbsName() == null) {
		            PrintWriter script = response.getWriter();
		            script.println("<script>");
		            script.println("alert('입력이 안된 사항이 있습니다.')");
		            script.println("history.back()");
		            script.println("</script>");
		        } else {
		            BbsDAO bbsDAO = new BbsDAO();
		            int result = bbsDAO.write(bbs.getBbsTitle(), bbs.getBbsName(), bbs.getBbsContent());
		                if(result == -1){ // 글쓰기에 실패했을 경우
		                    PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
		                    script.println("<script>");
		                    script.println("alert('글쓰기에 실패했습니다.')");
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