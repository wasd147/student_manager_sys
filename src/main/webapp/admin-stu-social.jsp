<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="admin.servlet.SqlConn" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/21
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生社会实践成果维护</title>
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
            font-size: 18px;
            border: 0px;
        }

        input {
            position: relative;
            left: 30px;
            height: 30px;
            width: 300px;
            margin-bottom: 15px;
            border-radius: 4px;

        }
        h2  {
            position: relative;
            left: 520px;
        }
    </style>
</head>
<body>
<%
    String id = null;
    String name = null;
//    id = (String) request.getSession().getAttribute("id");
//    name = (String) request.getSession().getAttribute("name");
    if (id == null | name == null) {
        id = request.getParameter("id");
        name = request.getParameter("name");
    }

    request.getSession().setAttribute("name", name);
    request.getSession().setAttribute("id", id);

    Connection conn = SqlConn.getConnection();
    Statement stmt = conn.createStatement();
    String sql = "select * from socialach where id=" + id;
    ResultSet rst = stmt.executeQuery(sql);
    ArrayList<String> arrayList = new ArrayList<>();
    while (rst.next()) {
        arrayList.add(rst.getString(3));

    }

%>
<h2><%=id%>&nbsp;<%=name%>:</h2>
<div id="par">
    <form action="Stusccial">
        <fieldset id="pat">
            <%
                int pc = 1;
                for (int i = 0; i < arrayList.size(); i++) {
            %>
            第<%=pc++%>项：<input name="achive" type="text" value="<%=arrayList.get(i)%>"><br>
            <%
                }
            %>

        </fieldset>
        <button type="button" onclick="add()">添加</button>
        <button type="submit">保存</button>
    </form>
</div>

<script>
    var pcc = <%=pc%>;

    function add() {
        var pat = document.getElementById("pat");
        pat.innerHTML = pat.innerHTML + "第" + pcc + "项：<input name=\"achive\" type=\"text\" value=\" \"><br>"
        pcc = pcc + 1;
    }
</script>
</body>
</html>
