package com.servlet;


import com.javabean.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


/**
 * Servlet implementation class Selectconn
 */
@WebServlet("/Selectconn")
public class Selectconn extends HttpServlet {
    private static final long serialVersionUID = 1L;
    String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/students?serverTimezone=UTC";
    static final String USER = "root";
    static final String PASS = "root";
    Connection conn = null;
    Statement stmt = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Selectconn() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Student stu = (Student) request.getSession().getAttribute("Student");
        String course = request.getParameter("course");
        if (course != null) {
            System.out.println("连接成功！" + stu.getName() + "选择" + course);
        }
        //连接数据库，将选的课增加到选课表里
        String sql1 = "select * from course where course= " + "'" + course + "'";

        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
            ResultSet rst1 = stmt.executeQuery(sql1);
            String course_name = null;
            String teacher_name = null;
            while (rst1.next()) {
                course_name = rst1.getString(1);
                teacher_name = rst1.getString(2);
            }
            String sql2 = "insert into selcourse values ('" + stu.getId() + "','" + course_name + "','" + teacher_name + "','" + stu.getName() + "')";
            stmt.execute(sql2);
            System.out.println("选课成功！");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
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
