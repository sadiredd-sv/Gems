

package beans;
import oracle.jdbc.pool.OracleDataSource;
import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;
import java.sql.*;
import java.util.ArrayList;
//import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;

public class TimeBean {

  private String job;
    public TimeBean() {
    }
   public void setJob(String job) {
        this.job = job;
    }

    public String getJob() {
        return job;
    }

public Result getEmployeess()
{
    try
    {

    OracleDataSource ods=new OracleDataSource();
    ods.setDriverType("thin");
    ods.setServerName("localhost");
    ods.setNetworkProtocol("tcp");
    ods.setDatabaseName("xe");
    ods.setPortNumber(1521);
    ods.setUser("eds");
    ods.setPassword("eds");
    Connection con=ods.getConnection();
    PreparedStatement statement=con.prepareStatement("select sys, name, time_in, time_out from very where name= ?");
    statement.setString(1, job);
    ResultSet rs = statement.executeQuery();
    return(ResultSupport.toResult(rs));
}
    catch(Exception e)
    {
      return(null);
    }
}

public ArrayList<SelectItem> getJobs()
{
    try
    {

    OracleDataSource ods=new OracleDataSource();
    ods.setDriverType("thin");
    ods.setServerName("localhost");
    ods.setNetworkProtocol("tcp");
    ods.setDatabaseName("xe");
    ods.setPortNumber(1521);
    ods.setUser("eds");
    ods.setPassword("eds");
    Connection con=ods.getConnection();
    Statement statement=con.createStatement();
    ResultSet rs=statement.executeQuery("select *from masa");
    ArrayList<SelectItem> al=new  ArrayList<SelectItem>();
    while(rs.next())
    {
        al.add(new SelectItem(rs.getString("uname"),rs.getString("uname")));
    }
    rs.close();
    return al;
}
    catch(Exception e)
    {
      return(null);
    }
}

}
