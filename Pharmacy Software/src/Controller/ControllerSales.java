package Controller;

import Controller.Interfaces.IController;
import Controller.Interfaces.IFindData;
import DataBase.executeSmtDb;
import java.sql.SQLException;
import javax.swing.JComboBox;
import javax.swing.table.DefaultTableModel;

public class ControllerSales {

    public void addIdCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select idProduct from pharmacy.Product where statusProduct like 'Active' ", "idProduct", cb);
    }



    public void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT * FROM pharmacy.detailsales JOIN pharmacy.product"
                + "ON pharmacy.detailsales.idProduct = pharmacy.product.idProduct GROUP BY pharmacy.detailsales.idSalesCheck", model);

    }

    public void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT * FROM pharmacy.product_pre_lab"
                + " where name LIKE " + "'%" + name + "%'", model);
    }

    public String find(String cod) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        String name = exc.executeSmtSelect("SELECT descriptionProduct FROM pharmacy.Product where statusProduct like 'Active' "
                + "and idProducto = " + "'" + cod + "'", "descriptionProduct");
        return name;
    }

    public String findPrice(String cod) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        String price = exc.executeSmtSelect("SELECT salePrice FROM pharmacy.Product where statusProduct like 'Active' "
                + "and idProducto = " + "'" + cod + "'", "salePrice");
        return price;
    }

}
