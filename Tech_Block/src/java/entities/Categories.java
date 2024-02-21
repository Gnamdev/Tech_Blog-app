
package entities;

import Helper.ConnectionProvider;
import com.sun.jdi.connect.spi.Connection;


public class Categories {
    
    private int cId;
    private String cName;
    private String description;

    public Categories() {
    }

    public Categories(int cId, String cName, String description) {
        this.cId = cId;
        this.cName = cName;
        this.description = description;
    }

    public Categories(String cName, String description) {
        this.cName = cName;
        this.description = description;
    }

    public int getcId() {
         
       
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
