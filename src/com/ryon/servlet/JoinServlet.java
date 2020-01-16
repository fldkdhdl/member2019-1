package com.ryon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ryon.db.MemberDAO;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/mb_ok")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 한글 깨짐 처리
		request.setCharacterEncoding("utf-8");
		// 클라이언트(브라우저)에서 받음
		String id = request.getParameter("uid");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		// 위 정보를 디비에 넣기
		int result = MemberDAO.insert(id, pw, name, email, phone);
		if (result == 0) {
			// 에러 페이지 이동
			response.sendRedirect("joinerr.jsp");
		} else {
			// 메인, 로그인 이동
			response.sendRedirect("mb_ok.jsp");
		}
		// 클라이언트(브라우저)로 보냄
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
//		out.println(id);
//		out.println(pw);
//		out.println(name);
//		out.println(email);
//		out.println(phone);
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
