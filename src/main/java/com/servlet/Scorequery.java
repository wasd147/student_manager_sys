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
import java.util.HashMap;
import java.util.Map;

@WebServlet("/Scorequery")
public class Scorequery extends HttpServlet {
    String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/students?serverTimezone=UTC";
    static final String USER = "root";
    static final String PASS = "root";
    Connection conn = null;
    Statement stmt = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student stu = (Student) request.getSession().getAttribute("Student");
//        连接数据库
        Map<String, Integer> scoreMap = new HashMap<>();
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
            String sql = "select * from score where id=" + stu.getId();
            ResultSet rst = stmt.executeQuery(sql);
            while (rst.next()) {
                scoreMap.put(rst.getString(1), rst.getInt(4));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        request.getSession().setAttribute("Student", stu);
        request.getSession().setAttribute("scoreMap", scoreMap);
        request.getRequestDispatcher("Scorequery.jsp").forward(request, response);

    }
}
