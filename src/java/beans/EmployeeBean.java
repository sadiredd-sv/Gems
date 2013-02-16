/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;
import oracle.jdbc.pool.OracleDataSource;
import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;
import java.sql.*;



public class EmployeeBean {
private String month;

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }
    /** Creates a new instance of EmployeeBean */
    public EmployeeBean() {
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
    PreparedStatement statement=con.prepareStatement("select * from makka where upper(dor) like ?");
    statement.setString(1, month);
      statement.setString(1,"%" + month.toUpperCase() + "%");
    ResultSet rs = statement.executeQuery();
    return(ResultSupport.toResult(rs));
}
    catch(Exception e)
    {
      return(null);
    }
}
}
