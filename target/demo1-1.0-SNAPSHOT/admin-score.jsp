<%@ page import="java.sql.Connection" %>
<%@ page import="admin.servlet.SqlConn" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/21
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有课程</title>
    <style>
        body {
            background-color: papayawhip;
        }

        #score-div {
            width: 750px;
            margin-left: auto;
            margin-right: auto;
        }

        div.block {
            height: 45px;
            background-color: white;
            margin-bottom: 10px;
            border-radius: 10px;
            text-align: center;
            font-size: 20px;
            line-height: 45px;
        }

        .course {
            position: absolute;
            left: 600px;
        }

        .teacher {
            position: absolute;
            left: 750px;
        }

        .ui-button {
            position: absolute;
            left: 880px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<%
    Connection conn = SqlConn.getConnection();
    String sql = "select * from course";
    Statement stmt = conn.createStatement();
    ResultSet rst = stmt.executeQuery(sql);
%>
<div id="score-div">
    <%
        while (rst.next()) {


    %>
    <div class="block">
        <span class="course"><%=rst.getString(1)%></span>
        <span class="teacher"><%=rst.getString(2)%></span>
        <button class="ui-button" type="button"
                onclick="{location.href='admin-score-stu.jsp?course=<%=rst.getString(1)%>&teacher=<%=rst.getString(2)%>'}">
            选择
        </button>
    </div>
    <%
        }
    %>

</div>
</body>
</html>
