<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script language="javascript">
    function check() {
    
        var pass=document.getElementById("loginform:pwd");
        if(pass.value == "")
        {

            alert("Please Enter Old Password!");
            return false;
        }
         var newpwd = document.getElementById("loginform:newpwd");
        if ( newpwd.value == "")
        {

            alert("Please Enter New Password!");
            return false;
        }
          var pass2=document.getElementById("loginform:newpwd2");

        if(pass2.value == "")
        {

            alert("Please Conform Your New Password!");
            return false;
        }
        

        if(pass2.value != newpwd.value)
        {

            alert("Passwords Do Not Match!");
            return false;
        }
        return true;
    }
</script>
  <link href="sty.css" rel="stylesheet"/>
<html>

    <body  background="1.gif">
         <f:view>
            <h:form id="loginform" onsubmit="return check()">

 <c:if test='${User.unam=="manager"}'>
         <%@include file="toall.jsp"%>
      </c:if>

      <c:if test='${User.msg=="employee"}'>
         <%@include file="touser.jsp"%>
      </c:if>
      
      
                 <table>
       <tr>
                   <td>Old password:</td>
                   <td><h:inputSecret id="pwd" value="#{User.pwd}" required="true">
                       <f:validateLength minimum="2" maximum="14"/>
                   </h:inputSecret>
                   <h:message for="pwd"/>
                   </td>
                </tr>&nbsp;

                       <tr>
                   <td>New password:</td>
                   <td><h:inputSecret id="newpwd" value="#{User.newpwd}" required="true">
                       <f:validateLength minimum="2" maximum="14"/>
                   </h:inputSecret>
                   <h:message for="newpwd"/>
                   </td>
                </tr>

                       <tr>
                   <td>Confirm password:</td>
                   <td><h:inputSecret id="newpwd2" value="#{User.newpwd2}" required="true">
                       <f:validateLength minimum="2" maximum="14"/>
                   </h:inputSecret>
                   <h:message for="newpwd2"/>
                   </td>
                </tr>
                </table>
                 <h:inputHidden id="unam" value="#{User.unam}"/>
                <h:commandButton action="#{User.changepassword}" value="Change Password"/>&nbsp;
                <input type="reset" value="Clear All" />
               
             </h:form>
         </f:view>
    </body>
</html>
