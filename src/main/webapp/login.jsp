<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <title>登录页面</title>
    <style type="text/css">
        body {
            text-align: center;
            background-image: url("https://pass.sdu.edu.cn/cas/comm/sdu/image/login_container_bg_08.jpg?1607946322840");
            /*background-repeat: repeat;*/
            background-size: cover;
        }

        form {
            text-align: center;
            width: 500px;
            position: relative;
            left: 33%;
            top: 100px;
        }

        fieldset {
            text-align: center;
            background-color: white;
            border-radius: 8px;
        }

        legend {
            text-align: center;
        }

        input {
            border-radius: 4px;
        }
    </style>
</head>
<body>
<form action="Login" method="post">
    <fieldset>
        <legend>山东大学学生管理系统</legend>
        <p>
            <label>用户名: <input type="text" name="username" />
            </label>
        </p>
        <p>
            <label>密&nbsp;&nbsp;码：<input type="password" name="password" />
            </label>
        </p>
        <p>
            <label><input type="submit" value="登录"/>
                <input type="reset" value="取消"/>
                <input type="submit" value="管理员登录入口" formaction="Admin.jsp"/>
            </label>
        </p>
    </fieldset>
</form>
</body>
</html>
