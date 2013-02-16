<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<link href="sty.css" rel="stylesheet"/>

<%@page import="java.util.Date" %>
<f:view>
  
<html>
    <body background="1.gif">
        <h:form>
              <%@include file="touser.jsp" %>
              
               <h3><b>name : </b><h:outputText value= "#{User.unam}"/> </h3>
           <h3><b>month : </b> <h:outputText value= "#{User.month}"/></h3>
          <h3><b>year : </b><h:outputText value= "#{User.year}"/> </h3> 
            <h3><b>shift : </b><h:outputText value= "#{User.shift}"/> </h3><br/>
            <h:commandButton id="undo" action="#{User.undo}" value="undo"/>
             
              
<h:inputHidden id="uname" value="#{User.unam}"/>
<%
out.println("<h2>the data is entered successfully!\n click <a href=index.jsp style=color:blue> here</a> to go back to home page<h2>");

%>

        </h:form>

       </f:view>

    </body>
</html>



