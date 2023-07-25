package Model;

public class Laboratory {

    private String name;
    private String address;
    private String phone;
    private String stateLaboratory = "Active";

        public Laboratory() {
    }
        
    public Laboratory(String name, String address, String phone) {
        this.name = name;
        this.address = address;
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getStateLaboratory() {
        return stateLaboratory;
    }

    public void setStateLaboratory(String stateLaboratory) {
        this.stateLaboratory = stateLaboratory;
    }


    
    
}
