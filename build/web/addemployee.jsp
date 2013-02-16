
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="sty.css"/>
 <%@include file="toall.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body background="1.gif">

        <h2>Registration </h2>
        <form  action="addemployeefinal.jsp" method="post">
            <table>
                <tr>
                    <td>Username : </td>
                    <td><input type="text" size="20" name="uname"  width="150px"/> </td>
                </tr>

                <tr>

                    <td>Password : </td>
                    <td><input type="password" size="21" name="pwd" width="150px"/> </td>
                </tr>

                <tr>

                    <td>Confirm Password : </td>
                    <td><input type="password" size="21" name="pwd2" width="150px"/> </td>
                </tr>

                <tr>

                    <td>Project Name :  </td>
                    <td><input type="text" size="20" name="designation"/> </td>
                </tr>


            </table>
            <p/>
            <input type="submit" value="Register" />
            <input type="reset"  value="Clear All"/>

        </form>
    </body>
</html>



