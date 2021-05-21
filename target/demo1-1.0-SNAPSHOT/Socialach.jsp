<%@page import="java.util.ArrayList" %>

<%@page import="java.io.PrintWriter" %>
<%@ page import="com.javabean.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
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
        h3{
            position: relative;
            left: 650px;
        }
    </style>
</head>
<%
    Student stu = (Student) request.getAttribute("Student");
    ArrayList<String> arrayList = (ArrayList<String>) request.getAttribute("socialach");
    if (stu == null) {
//	out.println("<h3>服务器错误！！！</h3>");
        stu = new Student();
    }
    if (arrayList == null) {
//	out.println("<h3>服务器错误！！！</h3>");
        arrayList = new ArrayList<String>();
    }
%>
<body>
<h3>
    这是<%=stu.getName()%>的社会成果展示:
</h3>
<div id="reset">

    <%
        for (int i = 0; i < arrayList.size(); i++) {
    %>


    <div class="block"><%=arrayList.get(i)%>
    </div>

    <%
        }
    %>

</div>
</body>
</html>