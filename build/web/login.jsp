<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.util.*,beans.*"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<script language="javascript">
    function check() {
        var uname = document.getElementById("loginform:unam");
        if ( uname.value == "")
        {

            alert("Please enter username!");
            return false;
        }
        var pass=document.getElementById("loginform:pwd");
        if(pass.value == "")
        {

            alert("Please enter password!");
            return false;
        }
       
        return true;
    }
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body background="1.gif">
        <f:view>
            <h:form id="loginform" onsubmit="return check()">
                <link href="sty.css" rel="stylesheet"/>
                <table  width="100%" height="250px"/>
                <tr>
                <td valign="top">
                <h1> <img src="EDSlogo.JPG">      Employee Movement Monitoring System       </h1>
                
                <td width="20%" style="background-color:#56A5EC"  valign="right">

                <table align="center">

                    <tr>
                        <td>Username:</td>
                        <td><h:inputText size="16" id="unam" value="#{User.unam}" required="true">
                                <f:validateLength minimum="2" maximum="14"/>
                            </h:inputText>
                            <h:message for="unam"/>
                        </td>
                    </tr>&nbsp;

                    <tr>
                        <td>Password:</td>
                        <td><h:inputSecret size="17" id="pwd" value="#{User.pwd}" required="true">
                                <f:validateLength minimum="2" maximum="14"/>
                            </h:inputSecret>
                            <h:message for="pwd"/>
                        </td>
                    </tr>

                </table>
                <p/>
                <center>
                    <h:commandButton action="#{User.login}" value="Login"/>
                    <jsp:useBean id="use" class="beans.User" scope="session"/>
                    <jsp:setProperty name="use" property="*" />
                </center>
                <p/>
                <h:outputText value="#{User.message}"/>
            </h:form>
        </f:view>

    </body>
</html>
