<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="admin.servlet.SqlConn" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/21
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生名单</title>
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

        .nameValue {
            position: absolute;
            left: 640px;
        }

        .id {
            position: absolute;
            left: 740px;
        }

        .ui-icon-disk
    </style>
</head>
<body>
<div id="score-div">
    <div class="block">
        <span class="nameValue">姓名</span>
        <span class="id">id</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span class="bottomNav">选中</span>
    </div>
    <% Connection conn = SqlConn.getConnection();
        Statement stmt = conn.createStatement();
        String sql = "select * from students";
        ResultSet rst = stmt.executeQuery(sql);
        while (rst.next()) {
    %>
    <div class="block">
        <span class="nameValue"><%=rst.getString(1)%></span>
        <span class="id"><%=rst.getString(2)%></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <button class="bottomNav"
                onclick="{location.href='admin-stu-social.jsp?id=<%=rst.getString(2)%>&name=<%=rst.getString(1)%>'}">
            选择
        </button>
    </div>

    <%
        }
    %></div>
</body>
</html>
