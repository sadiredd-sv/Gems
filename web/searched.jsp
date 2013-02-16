<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,beans.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="1.gif">
        <link rel="stylesheet" href="sty.css"/>
        <%@include file="toall.jsp"%>
        <p/>
        <form  action="searched.jsp" method="post">
                   name :        <input type="text" size="20" name="nameemp" />
                   shift :            <input type="text" size="30" name="shift" />
                   <input type="submit" value="Search" />
        </form>
        <h3>Search Result</h3>
         <table border="1" cellpadding="5" width="100%">
                <tr class="header">
                <th>date</th>
                <th>name</th>
                <th>shift </th>
             </tr>

            <%

                List<ManagerBean> nam = beans.ManagerBean.searchNames( request.getParameter("nameemp"),request.getParameter("shift"));
                for(ManagerBean s : nam) {
            %>

            <tr>
                 <td> <%= s.getDor()%></td>
                <td> <%= s.getNameemp()%></td>
                <td> <%= s.getShift()%></td>
            </tr>
            <%
            }
            %>

         </table>
    </body>
</html>
