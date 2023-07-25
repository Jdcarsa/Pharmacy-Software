
package Model;


public class Provider {
    
    private String nameProvider;
    private String numIdentification;
    private String address;
    private String email;
    private String phone;
    private String bank;
    private String numAccount;
    private String stateProvider = "Active";

    public Provider() {
    }

    public Provider(String nameProvider, String numIdentification, String address, String email, String phone, String bank, String numAccount) {
        this.nameProvider = nameProvider;
        this.numIdentification = numIdentification;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.bank = bank;
        this.numAccount = numAccount;
    }

    public String getNameProvider() {
        return nameProvider;
    }

    public void setNameProvider(String nameProvider) {
        this.nameProvider = nameProvider;
    }

    public String getNumIdentification() {
        return numIdentification;
    }

    public void setNumIdentification(String numIdentification) {
        this.numIdentification = numIdentification;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getNumAccount() {
        return numAccount;
    }

    public void setNumAccount(String numAccount) {
        this.numAccount = numAccount;
    }

    public String getStateProvider() {
        return stateProvider;
    }

    public void setStateProvider(String stateProvider) {
        this.stateProvider = stateProvider;
    }
    
    
}
