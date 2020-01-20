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
	
	String p = request.getParameter("p");
	
	// 전체
// 	ArrayList<MemberDTO> mList = MemberDAO.select();
// 	for (MemberDTO m : mList) {
// 		System.out.print(m.getId());
// 		System.out.print(" " + m.getName());
// 		System.out.print(" " + m.getEmail());
// 		System.out.print(" " + m.getPhone());
// 		System.out.println(" " + m.getPw());
// 	}
	// 전체 갯수
	int cnt = MemberDAO.getCount();
	System.out.println("전체: " + cnt);
	// 한페이지당 10개씩 뿌리자
	int exid = 10;   // 한페이지에 뿌리고 싶은 갯수
	int totalPage = cnt / 10;
	totalPage += 1;   // 페이지 수
	System.out.println("전체 페이지: " + totalPage);
	System.out.println("페이지 시작점: " + (totalPage * exid));
	
	int iPage = 0;  // 첫페이지
	if (p != null) {
		iPage = Integer.parseInt(p);
		iPage -= 1;   // 페이지로 넘어오는 숫자는 1부터라서
		// 디비에 넘겨야 할 숫자는 0부터
	}
	iPage *= exid;
	 
	ArrayList<MemberDTO> mList = MemberDAO.select(iPage, exid);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2>Basic Table</h2>
로그인 된 사람만 보이게 하고 싶어요~<br>
<%=name %>님 반갑습니다.<br>
로그인 되었습니다.<br>
로그아웃은???<br>
<a href="logout.jsp">로그아웃</a><br>

  <table class="table">
    <thead>
      <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
<% for (MemberDTO m : mList) { %>    
      <tr>
        <td><%=m.getId() %></td>
        <td><%=m.getName() %></td>
        <td><%=m.getEmail() %></td>
      </tr>
<% } %>
    </tbody>
  </table>
  페이지 : 
  <%for (int i=1; i<=totalPage; i++) { %>
  <a href="main.jsp?p=<%=i %>"><%=i %></a>
  <% } %>
</div>
<br><br><br><br>
</body>
</html>