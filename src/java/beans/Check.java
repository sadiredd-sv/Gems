
package beans;


import oracle.jdbc.pool.OracleDataSource;


import java.sql.*;
import javax.faces.event.ValueChangeEvent;


public class Check {
private String shift,year,month,dkc;

    public String getDkc() {
        return dkc;
    }

    public void setDkc(String dkc) {
        this.dkc = dkc;
    }
private Object[] day;
private String reg;

    public String getReg() {


        return reg;
    }

    public void setReg(String reg) {

        this.reg = reg;
    }

    public Object[] getDay() {
        return day;
    }

    public void setDay(Object[] day) {
        this.day = day;
    }



    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
    /** Creates a new instance of Check */
    public Check() {
    }

    public String register()
    {
 try
    {
     int count=0;
    OracleDataSource ods=new OracleDataSource();
    ods.setDriverType("thin");
    ods.setServerName("localhost");
    ods.setNetworkProtocol("tcp");
    ods.setDatabaseName("xe");
    ods.setPortNumber(1521);
    ods.setUser("eds");
    ods.setPassword("eds");
    Connection con=ods.getConnection();
    PreparedStatement statement=con.prepareStatement("insert into new values(?,?,?,?)");
    for(Object o : day) {
    statement.setString(1,o.toString());
    statement.setString(2,month);
    statement.setString(3,year);
    statement.setString(4,shift);
    statement.executeUpdate();
    count++;
    }

   if(count==day.length)
   {
       return "super";

   }
   else
   {
        return "waste";
   }


 }
    catch(Exception e)
    {
      return(null);
    }
    }
public void change(ValueChangeEvent eve)
{

    if((eve.getNewValue()).equals("March") || (eve.getNewValue()).equals("August") || (eve.getNewValue()).equals("May") || (eve.getNewValue()).equals("July") || (eve.getNewValue()).equals("October") || (eve.getNewValue()).equals("December")  || (eve.getNewValue()).equals("January"))
    {

    dkc="thirtyone";
    }
    else if((eve.getNewValue()).equals("February"))
        dkc="twentyeight";
    else
    {
        dkc="thirty";
    }

}

}

