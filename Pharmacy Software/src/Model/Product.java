
package Model;

import java.util.Date;


public class Product {
    
    private String descriptionProduct;
    private String concentration;
    private int stock;
    private float cost;
    private float salePrice;
    private String healthRegister;
    private Date expirationDate;
    private String statusProduct = "Active";
    private String presentation;
    private String laboratory;

    public Product() {
    }

    public Product(String descriptionProduct, String concentration, int stock, float cost, 
            float salePrice, String healthRegister, Date expirationDate,  String presentation, String laboratory) {
        this.descriptionProduct = descriptionProduct;
        this.concentration = concentration;
        this.stock = stock;
        this.cost = cost;
        this.salePrice = salePrice;
        this.healthRegister = healthRegister;
        this.expirationDate = expirationDate;
        this.presentation = presentation;
        this.laboratory = laboratory;
    }

    public String getDescriptionProduct() {
        return descriptionProduct;
    }

    public void setDescriptionProduct(String descriptionProduct) {
        this.descriptionProduct = descriptionProduct;
    }

    public String getConcentration() {
        return concentration;
    }

    public void setConcentration(String concentration) {
        this.concentration = concentration;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public String getHealthRegister() {
        return healthRegister;
    }

    public void setHealthRegister(String healthRegister) {
        this.healthRegister = healthRegister;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getStatusProduct() {
        return statusProduct;
    }

    public void setStatusProduct(String statusProduct) {
        this.statusProduct = statusProduct;
    }

    public String getPresentation() {
        return presentation;
    }

    public void setPresentation(String presentation) {
        this.presentation = presentation;
    }

    public String getLaboratory() {
        return laboratory;
    }

    public void setLaboratory(String laboratory) {
        this.laboratory = laboratory;
    }
    
    
    
}
