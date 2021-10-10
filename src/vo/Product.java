package vo;

public class Product {
    String Iid;
    String Iname;
    String description;
    int Iprice;
    int uid;
    String superclass;

    public String getSuperclass() {
        return superclass;
    }

    public void setSuperclass(String superclass) {
        this.superclass = superclass;
    }

    public String getIid() {
        return Iid;
    }

    public void setIid(String iid) {
        Iid = iid;
    }

    public String getName() {
        return Iname;
    }

    public void setName(String name) {
        this.Iname = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return Iprice;
    }

    public void setPrice(int price) {
        this.Iprice = price;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}
