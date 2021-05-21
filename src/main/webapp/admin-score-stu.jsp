<%@ page import="java.sql.Connection" %>
<%@ page import="admin.servlet.SqlConn" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/21
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生成绩录入</title>
    <style>
        body {
            background-color: papayawhip;
        }

        #par {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        form {
            text-align: center;
        }

        fieldset {
            text-align: center;
            font-size: 20px;
            border: 0px;
        }

        .id {
            position: absolute;
            left: 530px;
        }
        .name{
            position: absolute;
            left: 580px;
        }

        input {
            position: relative;
            left: 30px;
            height: 30px;
            width: 300px;
            margin-bottom: 15px;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<%
    String course = null;
    String teacher = null;
    course = request.getParameter("course");
    teacher = request.getParameter("teacher");

    request.getSession().setAttribute("course", course);
    request.getSession().setAttribute("teacher", teacher);
    Connection conn = SqlConn.getConnection();
    String sql = "select distinct * from selcourse where course='" + course + "' and teacher='" + teacher + "'";
    Statement stmt = conn.createStatement();
    ResultSet rst = stmt.executeQuery(sql);
%>
<div id="par">
    <h3><%=course%>:
    </h3>
    <form action="">
        <fieldset>
            <%
                while (rst.next()) {
            %>
            <span class="id"><%=rst.getString(1)%></span>
            <span class="name"><%=rst.getString(4)%>: </span>
            <input name="<%=rst.getString(1)%>" type="text" placeholder="请输入学生成绩" required><br>
            <%

                }
            %>
        </fieldset>
        <button formaction="Score" onclick="">保存</button>
        <button type="reset">重置</button>
    </form>
</div>
</body>
</html>
