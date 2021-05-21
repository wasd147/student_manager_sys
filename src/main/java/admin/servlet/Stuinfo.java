package admin.servlet;

import com.javabean.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/Stu-info")
public class Stuinfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] infors = request.getParameterValues("infor");
        //PrintWriter out = response.getWriter();
        Connection conn = SqlConn.getConnection();
        String sql = "update students set name=?,password=?,sex=?,year=?,grade=?," +
                "身份证号=?,学院=?,专业=?,班级=?,政治面貌=?,联系电话=?,电子邮件=?,籍贯=? where id=" + infors[1];
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, infors[0]);
            pstmt.setString(2, infors[2]);
            pstmt.setString(3, infors[3]);
            pstmt.setString(4, infors[4]);
            pstmt.setString(5, infors[5]);
            pstmt.setString(6, infors[6]);
            pstmt.setString(7, infors[7]);
            pstmt.setString(8, infors[8]);
            pstmt.setString(9, infors[9]);
            pstmt.setString(10, infors[10]);
            pstmt.setString(11, infors[11]);
            pstmt.setString(12, infors[12]);
            pstmt.setString(13, infors[13]);
            int x = pstmt.executeUpdate();
            if (x > 0) {
                System.out.println("更新成功！");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        Student stu = null;
        try {
            Statement stmt = conn.createStatement();
            String sql2 = "select * from students where id=" + infors[1];
            ResultSet rst = stmt.executeQuery(sql2);
            while (rst.next()) {
                stu = new Student(rst.getString(1), rst.getInt(2), rst.getString(3), rst.getString(4),
                        rst.getInt(5), rst.getInt(6), rst.getString(7), rst.getString(8), rst.getString(9),
                        rst.getString(10), rst.getString(11), rst.getString(12), rst.getString(13),
                        rst.getString(14));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
//        request.getSession().setAttribute("Student", stu);
        request.getRequestDispatcher("admin-success.jsp").forward(request, response);
    }
}
