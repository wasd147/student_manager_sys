package com.servlet;



import com.javabean.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
//import javax.websocket.Session;


/**
 * Servlet implementation class Socialach
 */
@WebServlet("/Socialach")
public class Socialach extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static final String DB_URL = "jdbc:mysql://localhost:3306/students?serverTimezone=UTC";
    static final String USER = "root";
    static final String PASS = "root";
    Connection conn = null;
    Statement stmt = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Socialach() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        // response.getWriter().append("Served at: ").append(request.getContextPath());
        Student stu = (Student) request.getSession().getAttribute("Student");
//		准备连接数据库
        String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        String sqlString = "select * from socialach where id=" + stu.getId();
        ArrayList<String> arrayList = new ArrayList<String>();
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
            ResultSet rst = stmt.executeQuery(sqlString);
            while (rst.next()) {
                arrayList.add(rst.getString("socialach"));
            }
        } catch (Exception e) {
            System.out.println("连接数据库error");
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
        request.setAttribute("Student", stu);
        request.setAttribute("socialach", arrayList);
        request.getRequestDispatcher("Socialach.jsp").forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
