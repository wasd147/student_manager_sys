package com.servlet;

import com.javabean.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/Deleteconn")
public class Deleteconn extends HttpServlet {
    String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/students?serverTimezone=UTC";
    static final String USER = "root";
    static final String PASS = "root";
    Connection conn = null;
    Statement stmt = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student stu = (Student) request.getSession().getAttribute("Student");
        String delcourse = request.getParameter("delcourse");
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
            String sql = "delete from selcourse where id=" + stu.getId() + " and course='" + delcourse + "'";
            stmt.execute(sql);
            System.out.println("取消课程成功！");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
