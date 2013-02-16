
package beans;
import dao.ManagerDAO;
import java.util.ArrayList;
//import java.util.Properties;
//import javax.activation.DataHandler;

public class ManagerBean {
private static String uname = "",  pwd = "",designation,dor,nameemp,shift,dr;

    public String getDr() {
        return dr;
    }

    public void setDr(String dr) {
        this.dr = dr;
    }
ManagerDAO d=new ManagerDAO();
User u=new User();
    /**
     * @return the uname
     */
    public String getUname() {
        return uname;
    }
     /**
     * @return the designation
     */
    public String getDesignation() {
        return designation;
    }

    /**
     * @param designation the designation to set
     */
    public void setDesignation(String designation) {
        this.designation = designation;
    }


    /**
     * @param uname the uname to set
     */
    public void setUname(String uname) {
        this.uname = uname;
    }

    /**
     * @return the pwd
     */
    public String getPwd() {
        return pwd;
    }

    /**
     * @param pwd the pwd to set
     */
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
/*
     public boolean login() {
        return d.login(uname, pwd);
    }

     public boolean verify()
     {
       return d.verify();
     }

      public boolean register() {
        return ManagerDAO.register(uname, pwd,designation);
    }

*/

    public String getNameemp() {
        return nameemp;
    }

    /**
     * @param nameemp the nameemp to set
     */
    public void setNameemp(String nameemp) {
        this.nameemp = nameemp;
    }

    /**
     * @return the shift
     */
    public String getShift() {
        return shift;
    }

    /**
     * @param shift the shift to set
     */
    public void setShift(String shift) {
        this.shift = shift;
    }


       /**
     * @return the dor
     */
    public String getDor() {
        return dor;
    }

    /**
     * @param dor the dor to set
     */
    public void setDor(String dor) {
        this.dor = dor;
    }


  public static ArrayList<ManagerBean> searchNames(String nameemp, String shift) {
        return ManagerDAO.searchNames(nameemp,shift);
    }
public static ArrayList<ManagerBean> getRecentSongs() {
        return ManagerDAO.getRecentSongs();
}

public static boolean register()
{
    return ManagerDAO.register(uname, pwd, designation);
}

}
