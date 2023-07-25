
package Model;


public class Employee {
    private String nameEmployee;
    private String lastName;
    private String job;
    private String sex;
    private String numIdentification;
    private String email;
    private String phone;
    private String address;
    private String statusEmployee= "Active";

    public Employee() {
    }

    public Employee(String nameEmployee, String lastName, String job, String sex, 
            String numIdentification, String email, String phone, String address) {
        this.nameEmployee = nameEmployee;
        this.lastName = lastName;
        this.job = job;
        this.sex = sex;
        this.numIdentification = numIdentification;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public String getNameEmployee() {
        return nameEmployee;
    }

    public void setNameEmployee(String nameEmployee) {
        this.nameEmployee = nameEmployee;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getNumIdentification() {
        return numIdentification;
    }

    public void setNumIdentification(String numIdentification) {
        this.numIdentification = numIdentification;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatusEmployee() {
        return statusEmployee;
    }

    public void setStatusEmployee(String statusEmployee) {
        this.statusEmployee = statusEmployee;
    }
    
    
}
