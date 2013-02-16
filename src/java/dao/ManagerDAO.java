

package dao;

import beans.ManagerBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ManagerDAO {
 public Connection con = null;
      public PreparedStatement ps = null;
       public ResultSet rs;

       public static boolean register(String uname, String pwd, String designation) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
             Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","eds","eds");
            ps = con.prepareStatement("insert into masa values(?,?,?, sysdate,?)");
            ps.setString(1, uname);
            ps.setString(2, pwd);
            ps.setString(3, designation);
            ps.setString(4, "employee");
            if (ps.executeUpdate() == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

  public static ArrayList<ManagerBean> searchNames(String nameemp, String shift) {
        Connection co = null;
        PreparedStatement p = null;
        try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
        co=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","eds","eds");
            p = co.prepareStatement("select * from makka where upper(nameemp) like ? and upper(shift) like ?");
            p.setString(1,"%" + nameemp.toUpperCase() + "%");
            p.setString(2,"%" + shift.toUpperCase() + "%");
            ResultSet r = p.executeQuery();
            ArrayList<ManagerBean> al = new ArrayList<ManagerBean>();
            while (r.next()) {
                ManagerBean s = new ManagerBean();
                s.setDor(r.getString("dor"));
                s.setNameemp( r.getString("nameemp"));
                s.setShift( r.getString("shift"));

                al.add(s);
            }
            r.close();
            //co.close();
            return al;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }


   public static ArrayList<ManagerBean> getRecentEmployees() {
        Connection c = null;
        PreparedStatement pm = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","eds","eds");
            pm = c.prepareStatement("select * from ( select * from very order by sys desc) where rownum <=10");
            ResultSet rm = pm.executeQuery();
            ArrayList<ManagerBean> al = new ArrayList<ManagerBean>();
            while (rm.next()) {
                ManagerBean b = new ManagerBean();
                b.setDr(rm.getString("sys"));
                b.setDor(rm.getString("name"));
                b.setNameemp( rm.getString("time_in"));
                b.setShift( rm.getString("time_out"));

                al.add(b);
            }
            rm.close();
            return al;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }


}



