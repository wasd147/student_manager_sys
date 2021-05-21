<%@page import="java.io.PrintWriter" %>
<%@ page import="com.javabean.Student" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎来到服务大厅</title>
    <style type="text/css">
        body {
            background-image: url("山东大学.jpg");
            background-image: url("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608475479828&di=92cc4a8410ce06dbe99115d523c0cb40&imgtype=0&src=http%3A%2F%2Fimg.yxad.cn%2Fimages%2F20181016%2F564ec725cc1648a2afe942a129e1385b.jpg");
            background-size: cover;
        }

        legend {
            align-self: center;
            text-align: center;
        }

        div div {
            width: 500px;
            position: relative;
            left: 32%;
        }

        input {
            width: 300px;
            height: 80px;
            position: relative;
            left: 95px;
            margin-bottom: 4px;
            font-size: 30px;
            border-radius: 5px;
            background: white;
        }

        input:hover {
            background-color: blue;
        }

        fieldset {
            border: 0px;
        }

        h2 {
            position: relative;
            left: 650px;
        }
    </style>
</head>
<body>

<%
    Student stu = (Student) request.getAttribute("Student");
%>
<%
    session.setAttribute("Student", stu);
%>
<div>
    <h2>
        welcome!<%=stu.getName()%>
    </h2>
</div>
<div class="dating">
    <div>
        <form action="Wlcome" method="post">
            <fieldset>
                <legend>
                    <span>欢迎来到服务大厅</span>
                </legend>
                <input type="submit" value="基本信息" name="基本信息" formaction="BaicInfo"><br>
                <input type="submit" value="社会成果" name="社会成果"
                       formaction="Socialach"><br> <input type="submit"
                                                          value="选课通道" name="选课通道" formaction="Selectcourse"><br>
                <input type="submit" value="成绩查询" name="成绩查询" formaction="Scorequery"><br>
            </fieldset>
        </form>
    </div>
</div>


</body>
</html>