<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,beans.*"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
 <h1> <img src="EDSlogo.JPG">            Employee Movement Monitoring System</h1>
<table style="background-color:#dddddd" width="100%">
    <tr>
        <td><b>User :<h:outputText value="#{User.unam}"/>  <br/> </b></td>
<td align="right">
        <a href="index.jsp">Home</a> &nbsp;&nbsp;
        <a href="changepwd.jsp">Change Password</a> &nbsp;&nbsp;
        <a href="logou.jsp">Logout </a>
  </tr>
</table>


