
package Controller;

import Controller.Interfaces.IController;
import Controller.Interfaces.IFindData;
import DataBase.executeSmtDb;
import java.sql.SQLException;
import javax.swing.JComboBox;
import javax.swing.table.DefaultTableModel;


public class ControllerSales implements  IController , IFindData{

    @Override
    public void addIdCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void register(Object o) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void disable(String id) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Object o) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException {
               executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT * FROM pharmacy.detailsales JOIN pharmacy.product"
                + "ON pharmacy.detailsales.idProduct = pharmacy.product.idProduct GROUP BY pharmacy.detailsales.idSalesCheck", model);

    }

    @Override
    public void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
