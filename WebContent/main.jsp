<%@page import="com.ryon.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ryon.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String)session.getAttribute("name");
	if (name == null) {
		// 로그인 안된 사람
		response.sendRedirect("login.jsp");
	} else {
		// 로그인 된 사람
		System.out.println("로그인 된 사람: " + name);
	}
	
	ArrayList<MemberDTO> mList = MemberDAO.select();
	for (MemberDTO m : mList) {
		System.out.print(m.getId());
		System.out.print(" " + m.getName());
		System.out.print(" " + m.getEmail());
		System.out.print(" " + m.getPhone());
		System.out.println(" " + m.getPw());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 된 사람만 보이게 하고 싶어요~<br>
<%=name %>님 반갑습니다.<br>
로그인 되었습니다.<br>
로그아웃은???<br>
<a href="logout.jsp">로그아웃</a><br>

<% for (MemberDTO m : mList) { %>
	<%=m.getId() %>
	<%=m.getPw() %>
	<%=m.getName() %>
	<%=m.getEmail() %>
	<%=m.getPhone() %><br>
<% } %>
</body>
</html>