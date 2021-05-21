<%@ page import="com.javabean.Student" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/20
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        Student stu = (Student) request.getSession().getAttribute("Student");
        Map<String, Integer> scoreMap = (Map<String, Integer>) request.getSession().getAttribute("scoreMap");
        Iterator<Map.Entry<String, Integer>> it = scoreMap.entrySet().iterator();
    %>
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

        h3 {
            position: relative;
            left: 400px;
        }
    </style>
    <title>成绩查询</title>

</head>
<body>
<div><h3><%=stu.getName()%>的成绩：
</h3></div>
<div id="score-div">
    <%
        while (it.hasNext()) {
            Map.Entry<String, Integer> entry = it.next();
    %>

    <div class="block"><span><%=entry.getKey()%></span> &nbsp; &nbsp; &nbsp;
        <span><%=entry.getValue()%></span></div>

    <%
        }
    %></div>
</body>
</html>
