package admin.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/Stusccial")
public class Stusccial extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] achive = request.getParameterValues("achive");
        String id = (String) request.getSession().getAttribute("id");
        String name = (String) request.getSession().getAttribute("name");

        Connection conn = SqlConn.getConnection();
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        for (int i = 0; i < achive.length; i++) {
            try {
                stmt.execute("delete from socialach where id=" + id + " and socialach='" + achive[i] + "'");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                stmt.execute("insert into socialach values (" + id + ",'" + name + "','" + achive[i] + "')");

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        request.getRequestDispatcher("admin-success.jsp").forward(request, response);
    }
}
