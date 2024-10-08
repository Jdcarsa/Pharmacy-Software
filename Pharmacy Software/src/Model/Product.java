package Model;

public class Product {

    private String id;
    private String descriptionProduct;
    private String concentration;
    private String stock;
    private String cost;
    private String salePrice;
    private String healthRegister;
    private String expirationDate;
    private String statusProduct = "Active";
    private String namePresentation;
    private String idLaboratory;

    public Product() {
    }

    public Product(String descriptionProduct, String concentration, String stock, String cost, String salePrice,
            String healthRegister, String expirationDate, String namePresentation, String idLaboratory) {
        this.descriptionProduct = descriptionProduct;
        this.concentration = concentration;
        this.stock = stock;
        this.cost = cost;
        this.salePrice = salePrice;
        this.healthRegister = healthRegister;
        this.expirationDate = expirationDate;
        this.namePresentation = namePresentation;
        this.idLaboratory = idLaboratory;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(String salePrice) {
        this.salePrice = salePrice;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getHealthRegister() {
        return healthRegister;
    }

    public void setHealthRegister(String healthRegister) {
        this.healthRegister = healthRegister;
    }

    public String getStatusProduct() {
        return statusProduct;
    }

    public void setStatusProduct(String statusProduct) {
        this.statusProduct = statusProduct;
    }

    public String getNamePresentation() {
        return namePresentation;
    }

    public void setNamePresentation(String namePresentation) {
        this.namePresentation = namePresentation;
    }

    public String getIdLaboratory() {
        return idLaboratory;
    }

    public void setIdLaboratory(String idLaboratory) {
        this.idLaboratory = idLaboratory;
    }

}
