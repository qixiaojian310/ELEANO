package vo;

public class OrderMessage {
    private String fName;
    private String lName;
    private String address;
    private String phone;
    private Integer Oid;
    private String Otime;
    private Integer price;
    private String customerID;

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public Integer getOid() {
        return Oid;
    }

    public void setOid(Integer oid) {
        Oid = oid;
    }

    public String getOtime() {
        return Otime;
    }

    public void setOtime(String otime) {
        Otime = otime;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
