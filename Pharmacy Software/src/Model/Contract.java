
package Model;

import java.util.Date;


public class Contract {
    
    private String idContract;
    private double salary;
    private String contractStart;
    private String contractEnd;
    private String status;

    public Contract(String idContract, double salary,  String contractStart,  String contractEnd, String status) {
        this.idContract = idContract;
        this.salary = salary;
        this.contractStart = contractStart;
        this.contractEnd = contractEnd;
        this.status = status;
    }

    public String getIdContract() {
        return idContract;
    }

    public void setIdContract(String idContract) {
        this.idContract = idContract;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public  String getContractStart() {
        return contractStart;
    }

    public void setContractStart( String contractStart) {
        this.contractStart = contractStart;
    }

    public  String getContractEnd() {
        return contractEnd;
    }

    public void setContractEnd( String contractEnd) {
        this.contractEnd = contractEnd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
