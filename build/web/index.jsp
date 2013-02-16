
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Date,beans.*"%>
<%@page import="java.text.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@page import="java.sql.*" %>
<link rel="stylesheet" href="sty.css"/>

 <html>
  <body background="1.gif">
   <f:view>
            <h:form id="loginform" onsubmit="return check()">
               <%@include file="touser.jsp" %>
                
             <table>
                        <tr><td>Select Month:
                      
                      <h:selectOneMenu required="true" id="mon" value="#{User.month}" valueChangeListener="#{Check.change}" onchange="submit()">
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
                            </h:selectOneMenu>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           
                        
            
            
                   
                         Select Year:
                        
                            <h:selectOneMenu id="year" value="#{User.year}" required="true">
                                <f:selectItem itemValue="2009" itemLabel="2009"/>
                                <f:selectItem itemValue="2010" itemLabel="2010"/>
                                <f:selectItem itemValue="2011" itemLabel="2011"/>
                                <f:selectItem itemValue="2012" itemLabel="2012"/>
                                <f:selectItem itemValue="2013" itemLabel="2013"/>
                                <f:selectItem itemValue="2014" itemLabel="2014"/>
                             </h:selectOneMenu>
                             </td>&nbsp;
                        </tr>
              </table>
              
                 <table>
                         <tr><td>Select Day: </td></tr>&nbsp;
             <tr>
                 <td>
             <h:selectManyCheckbox id="check" value="#{User.day}">
                               <f:selectItem itemValue="01" itemLabel="01"/>
                                <f:selectItem itemValue="02" itemLabel="02"/>
                                <f:selectItem itemValue="03" itemLabel="03"/>
                                <f:selectItem itemValue="04" itemLabel="04"/>
                                <f:selectItem itemValue="05" itemLabel="05"/>
                                <f:selectItem itemValue="06" itemLabel="06"/>
                                <f:selectItem itemValue="07" itemLabel="07"/>
                                <f:selectItem itemValue="08" itemLabel="08"/>
                                <f:selectItem itemValue="09" itemLabel="09"/>
                                <f:selectItem itemValue="10" itemLabel="10"/>
                                 <f:selectItem itemValue="11" itemLabel="11"/>
                                <f:selectItem itemValue="12" itemLabel="12"/>
                                <f:selectItem itemValue="13" itemLabel="13"/>
                                <f:selectItem itemValue="14" itemLabel="14"/>
                                <f:selectItem itemValue="15" itemLabel="15"/>
                                <f:selectItem itemValue="16" itemLabel="16"/>
                                <f:selectItem itemValue="17" itemLabel="17"/>
                                <f:selectItem itemValue="18" itemLabel="18"/>
                                <f:selectItem itemValue="19" itemLabel="19"/>
                                <f:selectItem itemValue="20" itemLabel="20"/>
                                <f:selectItem itemValue="21" itemLabel="21"/>
                                <f:selectItem itemValue="22" itemLabel="22"/>
                                <f:selectItem itemValue="23" itemLabel="23"/>
                                <f:selectItem itemValue="24" itemLabel="24"/>
                                <f:selectItem itemValue="25" itemLabel="25"/>
                                <f:selectItem itemValue="26" itemLabel="26"/>
                                <f:selectItem itemValue="27" itemLabel="27"/>
                                <f:selectItem itemValue="28" itemLabel="28"/>
                                <c:if test='${Check.dkc!="twentyeight"}'>
                                <f:selectItem itemValue="29" itemLabel="29"/>

                                <f:selectItem itemValue="30" itemLabel="30"/>
                                <c:if test='${Check.dkc!="thirty"}'>
                                <f:selectItem itemValue="31" itemLabel="31"/>
                                </c:if>
                            </c:if>

                </h:selectManyCheckbox>
                </td>
                        </tr>
                        </table>


                      <table>
                        <tr><td>Select Shift: </td>&nbsp;
                            <td>
                            <h:selectOneRadio id="shift" value="#{User.shift}" required="true" >
                                <f:selectItem itemValue="morning" itemLabel="Morning"/>
                                <f:selectItem itemValue="evening" itemLabel="Evening"/>
                                <f:selectItem itemValue="late" itemLabel="Late"/>
                                <f:selectItem itemValue="leave" itemLabel="Leave"/>
                                <f:selectItem itemValue="holiday" itemLabel="Holiday"/>

                            </h:selectOneRadio>
                            </td>
                        </tr>
                        
                  </table>
                <p/>


          <h:inputHidden id="unam" value="#{User.unam}"/>

                <h:commandButton action="#{User.register}" value="Register" />
                
                <p/>
                <c:if test='${User.k=="xyz"}'>
                <h:outputText value="#{User.dho}"/>
                </c:if>
             <%
                     try
        {

        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","eds","eds");
        Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs=st.executeQuery("select no from very");

        rs.last();
        session.setAttribute("slno",rs.getString(1));

        rs.close();
        st.close();
        con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
           %>






            </h:form>
        </f:view>







              <SCRIPT LANGUAGE="JavaScript">


<!-- Begin
var dDate = new Date();
var dCurMonth = dDate.getMonth();
var dCurDayOfMonth = dDate.getDate();
var dCurYear = dDate.getFullYear();
var objPrevElement = new Object();

function fToggleColor(myElement) {
var toggleColor = "#ff0000";
if (myElement.id == "calDateText") {
if (myElement.color == toggleColor) {
myElement.color = "";
} else {
myElement.color = toggleColor;
   }
} else if (myElement.id == "calCell") {
for (var i in myElement.children) {
if (myElement.children[i].id == "calDateText") {
if (myElement.children[i].color == toggleColor) {
myElement.children[i].color = "";
} else {
myElement.children[i].color = toggleColor;
            }
         }
      }
   }
}
function fSetSelectedDay(myElement){
if (myElement.id == "calCell") {
if (!isNaN(parseInt(myElement.children["calDateText"].innerText))) {
myElement.bgColor = "#c0c0c0";
objPrevElement.bgColor = "";
document.all.calSelectedDate.value = parseInt(myElement.children["calDateText"].innerText);
objPrevElement = myElement;
      }
   }
}
function fGetDaysInMonth(iMonth, iYear) {
var dPrevDate = new Date(iYear, iMonth, 0);
return dPrevDate.getDate();
}
function fBuildCal(iYear, iMonth, iDayStyle) {
var aMonth = new Array();
aMonth[0] = new Array(7);
aMonth[1] = new Array(7);
aMonth[2] = new Array(7);
aMonth[3] = new Array(7);
aMonth[4] = new Array(7);
aMonth[5] = new Array(7);
aMonth[6] = new Array(7);
var dCalDate = new Date(iYear, iMonth-1, 1);
var iDayOfFirst = dCalDate.getDay();
var iDaysInMonth = fGetDaysInMonth(iMonth, iYear);
var iVarDate = 1;
var i, d, w;
if (iDayStyle == 2) {
aMonth[0][0] = "Sunday";
aMonth[0][1] = "Monday";
aMonth[0][2] = "Tuesday";
aMonth[0][3] = "Wednesday";
aMonth[0][4] = "Thursday";
aMonth[0][5] = "Friday";
aMonth[0][6] = "Saturday";
} else if (iDayStyle == 1) {
aMonth[0][0] = "Sun";
aMonth[0][1] = "Mon";
aMonth[0][2] = "Tue";
aMonth[0][3] = "Wed";
aMonth[0][4] = "Thu";
aMonth[0][5] = "Fri";
aMonth[0][6] = "Sat";
} else {
aMonth[0][0] = "Su";
aMonth[0][1] = "Mo";
aMonth[0][2] = "Tu";
aMonth[0][3] = "We";
aMonth[0][4] = "Th";
aMonth[0][5] = "Fr";
aMonth[0][6] = "Sa";
}
for (d = iDayOfFirst; d < 7; d++) {
aMonth[1][d] = iVarDate;
iVarDate++;
}
for (w = 2; w < 7; w++) {
for (d = 0; d < 7; d++) {
if (iVarDate <= iDaysInMonth) {
aMonth[w][d] = iVarDate;
iVarDate++;
      }
   }
}
return aMonth;
}
function fDrawCal(iYear, iMonth, iCellWidth, iCellHeight, sDateTextSize, sDateTextWeight, iDayStyle) {
var myMonth;
myMonth = fBuildCal(iYear, iMonth, iDayStyle);
document.write("<table border='1'>")
document.write("<tr>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][0] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][1] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][2] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][3] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][4] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][5] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][6] + "</td>");
document.write("</tr>");
for (w = 1; w < 7; w++) {
document.write("<tr>")
for (d = 0; d < 7; d++) {
document.write("<td align='left' valign='top' width='" + iCellWidth + "' height='" + iCellHeight + "' id=calCell style='CURSOR:Hand' onMouseOver='fToggleColor(this)' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)>");
if (!isNaN(myMonth[w][d])) {
document.write("<font id=calDateText onMouseOver='fToggleColor(this)' style='CURSOR:Hand;FONT-FAMILY:Arial;FONT-SIZE:" + sDateTextSize + ";FONT-WEIGHT:" + sDateTextWeight + "' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)>" + myMonth[w][d] + "</font>");
} else {
document.write("<font id=calDateText onMouseOver='fToggleColor(this)' style='CURSOR:Hand;FONT-FAMILY:Arial;FONT-SIZE:" + sDateTextSize + ";FONT-WEIGHT:" + sDateTextWeight + "' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)> </font>");
}
document.write("</td>")
}
document.write("</tr>");
}
document.write("</table>")
}
function fUpdateCal(iYear, iMonth) {
myMonth = fBuildCal(iYear, iMonth);
objPrevElement.bgColor = "";
document.all.calSelectedDate.value = "";
for (w = 1; w < 7; w++) {
for (d = 0; d < 7; d++) {
if (!isNaN(myMonth[w][d])) {
calDateText[((7*w)+d)-7].innerText = myMonth[w][d];
} else {
calDateText[((7*w)+d)-7].innerText = " ";
         }
      }
   }
}
// End -->
</SCRIPT>
</HEAD>

<!-- STEP TWO: Copy this code into the BODY of your HTML document  -->



<script language="JavaScript" for=window event=onload>
<!-- Begin
var dCurDate = new Date();
frmCalendarSample.tbSelMonth.options[dCurDate.getMonth()].selected = true;
for (i = 0; i < frmCalendarSample.tbSelYear.length; i++)
if (frmCalendarSample.tbSelYear.options[i].value == dCurDate.getFullYear())
frmCalendarSample.tbSelYear.options[i].selected = true;
//  End -->
</script>

<form name="frmCalendarSample" method="post" action="">
<input type="hidden" name="calSelectedDate" value="">

<table align="right" bgcolor="#82CAFA">
<tr>
<td>
<select name="tbSelMonth" onchange='fUpdateCal(frmCalendarSample.tbSelYear.value, frmCalendarSample.tbSelMonth.value)'>
<option value="1">January</option>
<option value="2">February</option>
<option value="3">March</option>
<option value="4">April</option>
<option value="5">May</option>
<option value="6">June</option>
<option value="7">July</option>
<option value="8">August</option>
<option value="9">September</option>
<option value="10">October</option>
<option value="11">November</option>
<option value="12">December</option>
</select>

<select name="tbSelYear" onchange='fUpdateCal(frmCalendarSample.tbSelYear.value, frmCalendarSample.tbSelMonth.value)'>

<option value="2008">2008</option>
<option value="2009">2009</option>
<option value="2010">2010</option>
<option value="2011">2011</option>
<option value="2012">2012</option>
<option value="2013">2013</option>
</select>
</td>
</tr>
<tr>
<td>
<script language="JavaScript">
var dCurDate = new Date();
fDrawCal(dCurDate.getFullYear(), dCurDate.getMonth()+1, 30, 30, "12px", "bold", 1);
</script>
</td>
</tr>
</table>
</form>



    </body>
</html>
