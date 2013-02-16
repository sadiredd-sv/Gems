<%--
    Document   : logou
    Created on : Jun 16, 2009, 9:16:34 PM
    Author     : nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%@page import="java.sql.*" %>
   <%@page import="java.util.Date" %>
   <%@page import="java.text.*"%>
   <%@page import="javax.servlet.http.HttpServletRequest" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
      //String name=(String)session.getAttribute("logintime");

        String format="HH:mm:ss";
        SimpleDateFormat sd=new SimpleDateFormat(format);
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","eds","eds");
        PreparedStatement ps=con.prepareStatement("update very set time_out=? where no=?");

        ps.setString(1,sd.format(new Date()));
        ps.setString(2,(String)session.getAttribute("slno"));
        //ps.setString(3,"nikhil");
        ps.executeUpdate();

        ps.close();
        con.close();


      session.invalidate();
      response.sendRedirect("login.jsp");
      %>
    </body>
</html>
