 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registeration</title>
        <link href="sty.css" rel="stylesheet"/>
    </head>
    <body  background="1.gif">
          <%@include file="toall.jsp"%>
        <h2>Registration</h2>
        <jsp:useBean id="manager" class="beans.ManagerBean" scope="session"/>
        <jsp:setProperty name="manager" property="*" />

        <%
            boolean done = manager.register();
            if ( done )
                out.println("Registration is successful! <p/>Click <a href='mind.jsp'>here</a> to go to home page.");
            else
                out.println("Registration is NOT successful! <p/>Please try again!");
         %>
    </body>
</html>
