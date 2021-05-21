package admin.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/Score")
public class Score extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String course = (String) request.getSession().getAttribute("course");
        String teacher = (String) request.getSession().getAttribute("teacher");
        Connection conn = SqlConn.getConnection();
        String sql1 = "select distinct * from selcourse where course='" + course + "' and teacher='" + teacher + "'";
        ResultSet rst1 = null;
        Statement stmt = null;
        ArrayList<Integer> arrayList = new ArrayList<>();
        ArrayList<String> arrayListName = new ArrayList<>();

        try {
            stmt = conn.createStatement();
            rst1 = stmt.executeQuery(sql1);
            while (rst1.next()) {
                arrayList.add(rst1.getInt(1));
                arrayListName.add(rst1.getString(4));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        ArrayList<Integer> arrayList1 = new ArrayList<>();
        for (int i = 0; i < arrayList.size(); i++) {
            arrayList1.add(Integer.valueOf(request.getParameter(String.valueOf(arrayList.get(i)))));
            String sql2 = "delete from score where course='" + course + "'" + " and id=" + arrayList.get(i);
            try {
                stmt.execute(sql2);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        String sql3 = "insert into score values(?,?,?,?)";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql3);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        for (int i = 0; i < arrayList.size(); i++) {
            try {
                pstmt.setString(1, course);
                pstmt.setInt(2, arrayList.get(i));
                pstmt.setString(3, arrayListName.get(i));
                pstmt.setInt(4, arrayList1.get(i));
                pstmt.execute();
                System.out.println("录入成功！");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        request.getRequestDispatcher("admin-success.jsp").forward(request, response);
    }
}
