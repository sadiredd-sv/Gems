<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<link rel="stylesheet" href="sty.css"/>
<html>

    <body  background="1.gif">
        <%@include file="toall.jsp" %>
<form action="recent.jsp" method="post">

    <input type="submit" value="Get Latest Time-Stamp" />
    </form>
        <f:view>
            <h:form id="EmployeesForm">
                   
                <h2>Select Employee: </h2>
                <h:selectOneMenu id="job" value="#{TimeBean.job}" onchange="submit()">
                <f:selectItems value="#{TimeBean.jobs}"/>
                </h:selectOneMenu>
      
                <center>
                <h:dataTable rendered='#{TimeBean.job!=null && TimeBean.job!=""}' value="#{TimeBean.employeess}" var="emp" border="5" cellpadding="15">

                     <h:column>
                        <f:facet name="header"><f:verbatim>Date</f:verbatim></f:facet>
                        <h:outputText value="#{emp.sys}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header"><f:verbatim>Name</f:verbatim></f:facet>
                        <h:outputText value="#{emp.name}"/>
                    </h:column>&nbsp;
                    <h:column>
                        <f:facet name="header"><f:verbatim>In-Time</f:verbatim></f:facet>
                        <h:outputText value="#{emp.time_in}"/>
                    </h:column>&nbsp;
                    <h:column>
                        <f:facet name="header"><f:verbatim>Out-Time</f:verbatim></f:facet>
                        <h:outputText value="#{emp.time_out}"/>
                    </h:column>&nbsp;
                </h:dataTable>
                </center>
            </h:form>
        </f:view>
          
    </body>
</html>
