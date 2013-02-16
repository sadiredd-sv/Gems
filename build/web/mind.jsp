<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<link rel="stylesheet" href="sty.css"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="1.gif">
           <%@include file="toall.jsp"%>
        <p/>
        <form  action="searched.jsp" method="post">
                 Enter Name :        <input type="text" size="20" name="nameemp" />
                 Enter Shift :            <input type="text" size="30" name="shift" />
                   <input type="submit" value="Search" />
        </form>
        
        <f:view>
            <h:form>
     Select Month
                <h:selectOneMenu id="month" value="#{EmployeeBean.month}" onchange="submit()">
                                 <f:selectItem itemValue="January" itemLabel="January"/>
                                <f:selectItem itemValue="February" itemLabel="February"/>
                                <f:selectItem itemValue="March" itemLabel="March"/>
                                <f:selectItem itemValue="April" itemLabel="April"/>
                                <f:selectItem itemValue="May" itemLabel="May"/>
                                <f:selectItem itemValue="June" itemLabel="June"/>
                                <f:selectItem itemValue="July" itemLabel="July"/>
                                <f:selectItem itemValue="August" itemLabel="August"/>
                                <f:selectItem itemValue="September" itemLabel="September"/>
                                <f:selectItem itemValue="October" itemLabel="October"/>
                                <f:selectItem itemValue="November" itemLabel="November"/>
                                <f:selectItem itemValue="December" itemLabel="December"/>
                </h:selectOneMenu>
                 <center>
                    <h:dataTable rendered='#{EmployeeBean.month!=null && EmployeeBean.month!=""}' value="#{EmployeeBean.employeess}" var="employee" border="3" cellpadding="20" >
                    <h:column>
                        <f:facet name="header"><f:verbatim>DATE</f:verbatim> </f:facet>&nbsp;&nbsp;
                        <h:outputText value="#{employee.dor}" ></h:outputText>&nbsp;&nbsp;
                    </h:column>
                    <h:column>
                        <f:facet name="header"><f:verbatim>NAME</f:verbatim></f:facet>
                        <h:outputText value="#{employee.nameemp}"/>
                    </h:column>
                         <h:column>
                        <f:facet name="header"><f:verbatim>SHIFT</f:verbatim></f:facet>
                        <h:outputText value="#{employee.shift}"/>
                    </h:column>
                </h:dataTable>
                </center>
                     </h:form>
        </f:view>


    </body>
</html>
