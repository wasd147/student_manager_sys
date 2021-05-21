package com.servlet;



import com.javabean.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/Login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static final String DB_URL = "jdbc:mysql://localhost:3306/students?serverTimezone=UTC";
	static final String USER = "root";
	static final String PASS = "root";
	Connection conn = null;
	Statement stmt = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		System.out.println("ok");
//		得到id和密码
		String id = request.getParameter("username");
		String password = request.getParameter("password");
		String sqlString = "select * from students where id=" + id + " and password=" + password;
		// 建立数据库连接

		String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
		boolean isexist = false;
		Student student = null;
		try {
			Class.forName(JDBC_DRIVER);
			System.out.println("连接数据库...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			ResultSet rst = stmt.executeQuery(sqlString);
			while (rst.next()) {
				isexist = true;
				// 查询成功，该id存在
//				生成一个学生对象
				if (isexist) {
					student = new Student(rst.getString(1), rst.getInt(2), rst.getString(3), rst.getString(4),
							rst.getInt(5), rst.getInt(6), rst.getString(7), rst.getString(8), rst.getString(9),
							rst.getString(10), rst.getString(11), rst.getString(12), rst.getString(13),
							rst.getString(14));
					System.out.println("生成学生对象" + student.getName());
				}
				break;
			}
			rst.close();
			stmt.close();
			conn.close();
		} catch (SQLException se) {
			// 处理 JDBC 错误
			se.printStackTrace();
		} catch (Exception e) {
			// 处理 Class.forName 错误
			e.printStackTrace();
		} finally {
			// 关闭资源
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			} // 什么都不做
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		if (isexist) {
//			成功生成一个学生对象
			request.setAttribute("Student", student);
			RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
			rd.forward(request, response);
		}

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
