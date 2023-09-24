/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Product;
import java.sql.SQLException;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ideapad330S
 */
public class ControllerProduct {

    public ControllerProduct() {
    }

    public void getAllProducts(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT * FROM pharmacy.product_pre_lab", model);
    }

    public void searchProducts(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT * FROM pharmacy.product_pre_lab"
                + " where name LIKE " + "'%" + name + "%'", model);
    }

    public void registerProduct(Product p, String namePresentation) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        executeSmtDb ex = new executeSmtDb();
        String idPresentation
                = ex.executeSmtSelect("select idPresentation from pharmacy.presentation where descriptionPresentation like "
                        + "'" + namePresentation + "'", "idPresentation");
        String values = "' \\'" + p.getDescriptionProduct() + "\\'" + " , \\'" + p.getConcentration() + "\\'" + " , \\'" + p.getStock() + "\\'"
                + " , \\'" + p.getCost() + "\\'" + " , \\'" + p.getSalePrice() + "\\'" + " , \\'" + p.getHealthRegister() + "\\'"
                + " , \\'" + p.getExpirationDate() + "\\'" + " , \\'" + p.getStatusProduct() + "\\'"
                + " , \\'" + idPresentation + "\\'" + ", \\'" + p.getIdLaboratory() + "\\' ' ";
        if (exc.executeInsertProcedure("'Product'", "'descriptionProduct, concentration, stock, cost , salePrice, "
                + "healthRegister, expirationDate, statusProduct , idPresentation, idLaboratory'", values)) {
            JOptionPane.showMessageDialog(null, "Registered Product;");
        }
    }

    public void addIdProductCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select idProduct from pharmacy.Product where statusProduct like 'Active' ", "idProduct", cb);
    }

    public void disableProduct(String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        id = "'" + id + "'";
        if (exc.executeDisableProcedure("'Product'", "'statusProduct'", "'idProduct'", id)) {
            JOptionPane.showMessageDialog(null, "Disabled Product");
        }
    }
}
