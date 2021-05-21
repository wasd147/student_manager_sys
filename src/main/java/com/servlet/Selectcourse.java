package com.servlet;


import com.javabean.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;


/**
 * Servlet implementation class Selectcourse
 */
@WebServlet("/Selectcourse")
public class Selectcourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:mysql://localhost:3306/students?serverTimezone=UTC";
	static final String USER = "root";
	static final String PASS = "root";
	Connection conn = null;
	Statement stmt = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Selectcourse() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		Student stu = (Student) request.getSession().getAttribute("Student");
		String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
		String sql1 = "select * from course";
		String sql2 = "select * from selcourse where id=" + stu.getId();
		Map<String, String> courseMap1 = new HashMap<String, String>();
		Map<String, String> courseMap2 = new HashMap<String, String>();
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			System.out.println("OK");
			ResultSet rst1 = stmt.executeQuery(sql1);
			System.out.println("OK1");
			
			while (rst1.next()) {
				courseMap1.put(rst1.getString(1), rst1.getString(2));
			}
			System.out.println("OK，rst1");
			ResultSet rst2 = stmt.executeQuery(sql2);
			System.out.println("OK2");
			while (rst2.next()) {
				courseMap2.put(rst2.getString(2), rst2.getString(3));
			}
			System.out.println("OK，rst2");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		request.setAttribute("Student", stu);
		request.setAttribute("allcourse", courseMap1);
		request.setAttribute("mycourse", courseMap2);
		request.getRequestDispatcher("Selectcourse.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
