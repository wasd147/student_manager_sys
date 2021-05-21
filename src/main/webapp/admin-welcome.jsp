<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/20
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网站管理员大厅</title>
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
            width: 600px;
            position: relative;
            left: 32%;
        }

        input {
            width: 400px;
            height: 80px;
            position: relative;
            left: 95px;
            margin-bottom: 4px;
            font-size: 30px;
            border-radius: 5px;
        }

        input:hover {
            background-color: blue;
        }

        fieldset {
            border: 0px;
        }

        h2 {
            position: relative;
            left: 600px;
        }
    </style>
</head>
<body>
<h2>Welcome!Admin!您将拥有最高权限</h2>
<div class="dating">
    <div>
        <form action="#" method="post">
            <fieldset>
                <legend>
                    <span>欢迎来到服务大厅</span>
                </legend>
                <input type="submit" value="学生基本信息维护入口" formaction="admin-stu-list.jsp"><br>
                <input type="submit" value="学生社会成就维护入口" formaction="admin-stu-list-two.jsp"><br>
                <input type="submit" value="学生成绩录入入口" formaction="admin-score.jsp">

            </fieldset>
        </form>
    </div>
</div>

</body>
</html>
