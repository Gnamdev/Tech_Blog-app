package entities;

import java.security.Timestamp;
import java.sql.*;
import java.util.function.IntToLongFunction;

public class Post {

    private int pId;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pPic;
    private Timestamp pDate;
    private int carId;
    private int clientId;

    public Post(int pId, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int carId, int clientId) {
        this.pId = pId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.carId = carId;
        this.clientId =clientId;
    }

    public Post(String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int carId ,int clientId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.carId = carId;
        this.clientId = clientId;
    }

    public Post() {
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp  getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp  pDate) {
        this.pDate = pDate;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }


    
    
    
}
