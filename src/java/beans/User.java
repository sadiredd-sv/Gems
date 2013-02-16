package beans;

//import java.beans.Statement;
import java.sql.*;
import java.util.Date;
import java.text.*;
import oracle.jdbc.pool.OracleDataSource;

public class User {

    private String month, shift, year, unam, pwd, newpwd, newpwd2, message, msg, d, undomessage, k;

    public String getK() {
        return k;
    }

    public void setK(String k) {
        this.k = k;
    }

    public String getDho() {
        return undomessage;
    }

    public void setDho(String undomessage) {
        this.undomessage = undomessage;
    }
    private Object[] day;

    public Object[] getDay() {
        return day;
    }

    public void setDay(Object[] day) {
        this.day = day;
    }

    public String getD() {
        return d;
    }

    public void setD(String d) {
        this.d = d;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getUnam() {
        return unam;
    }

    public void setUnam(String unam) {
        this.unam = unam;
    }

    public String getNewpwd2() {
        return newpwd2;
    }

    public void setNewpwd2(String newpwd2) {
        this.newpwd2 = newpwd2;
    }

    public String getNewpwd() {
        return newpwd;
    }

    public void setNewpwd(String newpwd) {
        this.newpwd = newpwd;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public User() {
    }

    /**
     * @return the month
     */
    public String getMonth() {
        return month;
    }

    /**
     * @param month the month to set
     */
    public void setMonth(String month) {
        this.month = month;
    }

    public String register() {

        try {
            int count = 0;
            k = "mnop";
            OracleDataSource ods = new OracleDataSource();
            ods.setDriverType("thin");
            ods.setServerName("localhost");
            ods.setNetworkProtocol("tcp");
            ods.setDatabaseName("xe");
            ods.setPortNumber(1521);
            ods.setUser("eds");
            ods.setPassword("eds");
            Connection con = ods.getConnection();
            PreparedStatement statement = con.prepareStatement("insert into makka values(?,?,?)");
            for (Object o : day) {
                statement.setString(1, month + " " + o.toString() + "," + year);
                statement.setString(2, unam);
                statement.setString(3, shift);
                //statement.setString(4,shift);
                statement.executeUpdate();
                count++;
            }

            if (count == day.length) {
                return "success";

            } else {
                return "Failed";
            }

        } catch (Exception e) {
            return (null);
        }
    }

    public String login() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs;
        try {
            // Initializing the JDBC driver by calling the method Class.forName
            Class.forName("oracle.jdbc.driver.OracleDriver");
            /*Once the JDBC driver class is loaded, you are ready to connect to a SQL Server by using the DriverManager.getConnection(connection_url) method. 
             */
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "eds", "eds");
            ps = con.prepareStatement("select * from masa where uname = ? and pwd = ?");
            ps.setString(1, unam);
            ps.setString(2, pwd);

            rs = ps.executeQuery();
            if (rs.next()) // found
            {
                if ((rs.getString(5)).equals("manager")) {
                    return "manager";
                } else {
                    try {

                        String format = "HH:mm:ss";
                        PreparedStatement pst = null;
                        SimpleDateFormat sd = new SimpleDateFormat(format);
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection cone = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "eds", "eds");
                        pst = cone.prepareStatement("insert into very values (no.nextval,sysdate,?,?,?)");
                        pst.setString(1, unam);
                        pst.setString(2, sd.format(new Date()));
                        pst.setString(3, "hkhk");

                        pst.executeUpdate();
                        cone.close();
                        pst.close();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    msg = "employee";
                    return "employee";
                }


            } else {
                message = "Invalid Username or Password! Try again";
                return "notvalid";
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return "notvalid";
        }
    }

    public String changepassword() {
        Connection c = null;
        PreparedStatement p = null;
        //ResultSet r;
        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "eds", "eds");
            p = c.prepareStatement("update masa set pwd = ? where uname = ? and pwd = ?");
            p.setString(1, newpwd);
            p.setString(2, unam);
            p.setString(3, pwd);
            if (p.executeUpdate() == 1) {
                return "changed";
            } else {
                return "notchanged";
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return "notchanged";
        }
    }

    public String undo() {
        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "eds", "eds");
            Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = st.executeQuery("select dor,nameemp,shift from makka");
            rs.last();
            rs.deleteRow();
            k = "xyz";
            undomessage = "The selected shift on the date is deleted!";
            rs.close();
            st.close();
            con.close();
            return "deleted";
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return (null);
        }
    }
}
