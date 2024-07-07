package Controller.AdminFunctions;

import Controller.Interfaces.IFindData;
import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public class ControllerDetailsSales implements IFindData {

    @Override
    public void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idDetail, idSalesCheck, p.idProduct, healthRegister , descriptionProduct, concentration, "
                + "Quantity, price , total FROM pharmacy.detailsales sd JOIN pharmacy.product p ON sd.idProduct = p.idProduct",
                 model);
    }

    @Override
    public void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idDetail, idSalesCheck, p.idProduct, healthRegister , descriptionProduct, concentration, "
                + "Quantity, price , total FROM pharmacy.detailsales sd JOIN pharmacy.product p ON sd.idProduct = p.idProduct"
                + "  WHERE idDetail LIKE" + "'%" + name + "%'", model);
    }

}
