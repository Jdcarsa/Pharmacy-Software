
package Model;


public class Patient {

    private String address;
    private String birthdate;
    private String email;
    private String idPatient;
    private String namePatient;
    private String numIdentification;
    private String phone;
    private String sex;

    public Patient(String address, String birthdate, String email, String namePatient,String numIdentification, String phone, String sex) {
        this.address = address;
        this.birthdate = birthdate;
        this.email = email;
        this.namePatient = namePatient;
        this.numIdentification = numIdentification;
        this.phone = phone;
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIdPatient() {
        return idPatient;
    }

    public void setIdPatient(String idPatient) {
        this.idPatient = idPatient;
    }

    public String getNamePatient() {
        return namePatient;
    }

    public void setNamePatient(String namePatient) {
        this.namePatient = namePatient;
    }

    public String getNumIdentification() {
        return numIdentification;
    }

    public void setNumIdentification(String numIdentification) {
        this.numIdentification = numIdentification;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
    
    
}
