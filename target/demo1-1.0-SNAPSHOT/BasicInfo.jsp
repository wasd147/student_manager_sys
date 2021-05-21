<%@ page import="com.javabean.Student" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        body {
            background-color: papayawhip;
        }

        #reset {
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
    </style>
</head>
<body>
<%
    Student stu = (Student) request.getAttribute("Student");
    if (stu == null) {
        stu = new Student();
        out.println("<h3>服务器错误！！！</h3>");
    }
%>
<div id="reset">
    <div class="block"><span>姓名:</span>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=stu.getName()%></span></div>
    <div class="block"><span>学号:</span>&nbsp;&nbsp;&nbsp;<span><%= stu.getId()%></span></div>
    <div class="block"><span>性别:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getSex()%></span></div>
    <div class="block"><span>年龄:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getYear()%></span></div>
    <div class="block"><span>级别:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getGrade()%></span></div>
    <div class="block"><span>身份证号:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getSfzh()%></span></div>
    <div class="block"><span>学院:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getXy()%></span></div>
    <div class="block"><span>专业:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getZy()%></span></div>
    <div class="block"><span>班级:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getBj()%></span></div>
    <div class="block"><span>政治面貌:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getZzmm()%></span></div>
    <div class="block"><span>联系电话:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getLxdh()%></span></div>
    <div class="block"><span>电子邮箱:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getDzyj()%></span></div>
    <div class="block"><span>籍贯:</span>&nbsp;&nbsp;&nbsp;<span><%=stu.getJg()%></span></div>

</div>
</body>
</html>