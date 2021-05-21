<%@ page import="java.sql.Connection" %>
<%@ page import="admin.servlet.SqlConn" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.javabean.Student" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/21
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息维护</title>
    <style>
        body {
            background-color: papayawhip;
        }

        #reset {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        form {
            text-align: center;
        }

        fieldset {
            text-align: center;
            font-size: 18px;
            border: 0px;
        }

        input {
            position: relative;
            left: 30px;
            height: 30px;
            margin-bottom: 15px;
            border-radius: 4px;

        }

        h2 {
            position: relative;
            left: 580px;
        }
    </style>
</head>

<body>
<% Student stu = null;

//    Student stu = (Student) request.getSession().getAttribute("Student");
    String id = null;
    if (stu != null) {
        id = String.valueOf(stu.getId());
        out.println("<h2>Welcome! " + id + "</h2>");
    } else {
        id = request.getParameter("id");
        Connection conn = SqlConn.getConnection();
        Statement stmt = conn.createStatement();
        String sql = "select * from students where id=" + id;
        ResultSet rst = stmt.executeQuery(sql);

        while (rst.next()) {
            stu = new Student(rst.getString(1), rst.getInt(2), rst.getString(3), rst.getString(4),
                    rst.getInt(5), rst.getInt(6), rst.getString(7), rst.getString(8), rst.getString(9),
                    rst.getString(10), rst.getString(11), rst.getString(12), rst.getString(13),
                    rst.getString(14));
        }
    }

%>
<h2>id=<%=stu.getId()%>:
</h2>
<div id="reset">
    <form action="Stu-info" method="get">
        <fieldset>
            姓名：<input name="infor" type="text" value="<%=stu.getName()%>"><br>
            学号：<input name="infor" type="text" value="<%=stu.getId()%>" readonly><br>
            密码：<input name="infor" type="text" value="<%=stu.getPassword()%>"><br>
            性别：<input name="infor" type="text" value="<%=stu.getSex()%>"><br>
            年龄：<input name="infor" type="text" value="<%=stu.getYear()%>"><br>
            年级：<input name="infor" type="text" value="<%=stu.getGrade()%>"><br>
            身份证号：<input name="infor" type="text" value="<%=stu.getSfzh()%>"><br>
            学院：<input name="infor" type="text" value="<%=stu.getXy()%>"><br>
            专业：<input name="infor" type="text" value="<%=stu.getZy()%>"><br>
            班级：<input name="infor" type="text" value="<%=stu.getBj()%>"><br>
            政治面貌：<input name="infor" type="text" value="<%=stu.getZzmm()%>"><br>
            联系电话：<input name="infor" type="text" value="<%=stu.getLxdh()%>"><br>
            电子邮件：<input name="infor" type="text" value="<%=stu.getDzyj()%>"><br>
            籍贯：<input name="infor" type="text" value="<%=stu.getJg()%>"><br>
        </fieldset>
        <input type="submit" value="保存"> <input type="reset" value="重置">
    </form>
</div>
</body>
</html>
