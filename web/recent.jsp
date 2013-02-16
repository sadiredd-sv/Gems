<%@page contentType="text/html" import="java.util.*,beans.*" %>
<%@page pageEncoding="UTF-8" %>
<link rel="stylesheet" href="sty.css"/>
<html>

    <body background="1.gif">
 <%@include file="toall.jsp" %>
        <h2>Recent Logins </h2>
            <table border="1"  cellpadding="5" width="100%">
                <tr class="header">
                <th>Date</th>
                <th>Name</th>
                <th>Login</th>
                <th>Logout</th>
                </tr>

            <%

                List<ManagerBean> songs = beans.ManagerBean.getRecentSongs();
                for(ManagerBean s : songs) {
            %>

            <tr>
                <td> <%= s.getDr()%></td>
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
