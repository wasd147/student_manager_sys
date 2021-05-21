<%@page import="java.util.Iterator" %>
<%@page import="java.util.Map" %>
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

        button {
            height: 22px;
            width: 60px;
        }

        td {
            height: 20px;
            width: 130px;
        }

        table {
            border-collapse: collapse;
        }

        tr {
            border: 3px solid white;
        }

        #reset {
            width: 500px;
            margin-right: auto;
            margin-left: auto;
        }
    </style>
</head>
<body>
<div id="reset">
    <h2>本学院开设的所有课程：</h2>
    <table>
        <%
            Student stu = (Student) request.getAttribute("Student");
            request.getSession().setAttribute("Student", stu);
            Map<String, String> allcourse = (Map<String, String>) request.getAttribute("allcourse");
            Map<String, String> mycourse = (Map<String, String>) request.getAttribute("mycourse");
            Iterator<Map.Entry<String, String>> it = allcourse.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<String, String> entry = it.next();
        %>
        <tr>
            <td><%=entry.getKey()%>
            </td>
            <td><%=entry.getValue()%>
            </td>
            <td>
                <button type="button" name="<%=entry.getKey()%>"
                        onclick="xuanzhe(this)">添加
                </button>
            </td>
        </tr>
        <%
            }
        %>
    </table>


    <div height="100px"></div>
    <h2>我的课程:</h2>
    <table>
        <tbody id="mycourse">
        <%
            Iterator<Map.Entry<String, String>> tt = mycourse.entrySet().iterator();
            while (tt.hasNext()) {
                Map.Entry<String, String> enTry = tt.next();
        %>
        <tr>
            <td><%=enTry.getKey()%>
            </td>
            <td><%=enTry.getValue()%>
            </td>
            <td>
                <button value="button" name="<%=enTry.getKey()%>"
                        onclick="quxiao(this)">取消
                </button>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    var course;

    function xuanzhe(e) {
        course = e.name;

        var tar = e.parentNode.parentNode.cloneNode(true);//行tr
        //获得这一行的代码
        tar.children[2].children[0].setAttribute('onclick', 'quxiao(this)')
        tar.children[2].children[0].innerHTML = "取消";
        console.log(tar.children[2].innerHTML);

        var new_tr = document.createElement("tr");
        var mycourse = document.getElementById("mycourse");
        new_tr.innerHTML = tar.innerHTML;
        mycourse.appendChild(new_tr);
        selcourse = null;
        startRequest();
    }

    var delcourse;

    function quxiao(e) {
        delcourse = e.name;
        var chd = e.parentNode.parentNode;
        var pat = chd.parentNode;
        pat.removeChild(chd);
        course = null;
        startRequest_two();

    }

    var xmlHttp;

    function createXMLHttpRequest() {
        if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        } else {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }

    function startRequest() {
        createXMLHttpRequest();
        if (course != null) {
            xmlHttp.onreadystatechange = handleStateChange;
        }

        xmlHttp.open("GET", "Selectconn?course=" + course, true);
        xmlHttp.send(null);
    }

    function startRequest_two() {
        createXMLHttpRequest();

        if (delcourse != null) {
            xmlHttp.onreadystatechange = handleStateChange_two;
        }
        xmlHttp.open("GET", "Deleteconn?delcourse=" + delcourse, true);
        xmlHttp.send(null);
    }

    function handleStateChange() {
        if (xmlHttp.readyState == 4) {
            if (xmlHttp.status == 200) {
                alert("你选择了： " + course);
            }
        }
    }

    function handleStateChange_two() {
        if (xmlHttp.readyState == 4) {
            if (xmlHttp.status == 200) {
                alert("你取消了： " + delcourse);
            }
        }
    }
</script>


</body>
</html>