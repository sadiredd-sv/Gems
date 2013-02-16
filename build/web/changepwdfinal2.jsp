<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link href="sty.css" rel="stylesheet"/>
    </head>
    <body  background="1.gif">

        <f:view>
            <h:form>
      <c:if test='${User.unam=="manager"}'>
         <%@include file="toall.jsp"%>
      </c:if>

      <c:if test='${User.msg=="employee"}'>
         <%@include file="touser.jsp"%>
      </c:if>
        <h2> Passwod Change Not Sucessful! </h2>


        <%
                // out.println("           ");
                // out.println(" Password           ");
                 out.println("The Old Password Entered Is InCorrect");
                 out.println(" Please Try Again !");
         %>

        <p/>
        </h:form>
        </f:view>
    </body>
</html>
