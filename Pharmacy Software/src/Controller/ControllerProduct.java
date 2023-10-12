package Controller;

import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Product;
import com.toedter.calendar.JDateChooser;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ideapad330S
 */
public class ControllerProduct implements IController, IAddDataCalendarTFCB {

    public ControllerProduct() {
    }

    @Override
    public void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT * FROM pharmacy.product_pre_lab", model);
    }

    @Override
    public void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT * FROM pharmacy.product_pre_lab"
                + " where name LIKE " + "'%" + name + "%'", model);
    }

    @Override
    public void register(Object o) throws ClassNotFoundException, SQLException {
        Product p = (Product) o;
        executeProcedure exc = new executeProcedure();
        executeSmtDb ex = new executeSmtDb();
        String idPresentation
                = ex.executeSmtSelect("select idPresentation from pharmacy.presentation where descriptionPresentation like "
                        + "'" + p.getNamePresentation() + "'", "idPresentation");
        String values = "' \\'" + p.getDescriptionProduct() + "\\'" + " , \\'" + p.getConcentration() + "\\'" + " , \\'" + p.getStock() + "\\'"
                + " , \\'" + p.getCost() + "\\'" + " , \\'" + p.getSalePrice() + "\\'" + " , \\'" + p.getHealthRegister() + "\\'"
                + " , \\'" + p.getExpirationDate() + "\\'" + " , \\'" + p.getStatusProduct() + "\\'"
                + " , \\'" + idPresentation + "\\'" + ", \\'" + p.getIdLaboratory() + "\\' ' ";
        if (exc.executeInsertProcedure("'Product'", "'descriptionProduct, concentration, stock, cost , salePrice, "
                + "healthRegister, expirationDate, statusProduct , idPresentation, idLaboratory'", values)) {
            JOptionPane.showMessageDialog(null, "Registered Product;");
        }
    }

    @Override
    public void addIdCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select idProduct from pharmacy.Product where statusProduct like 'Active' ", "idProduct", cb);
    }

    @Override
    public void disable(String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        id = "'" + id + "'";
        if (exc.executeDisableProcedure("'Product'", "'statusProduct'", "'idProduct'", id)) {
            JOptionPane.showMessageDialog(null, "Disabled Product");
        }
    }

    @Override
    public void update(Object o) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        Product p = (Product) o;
        executeSmtDb ex = new executeSmtDb();
        String idPresentation
                = ex.executeSmtSelect("select idPresentation from pharmacy.presentation where descriptionPresentation like "
                        + "'" + p.getNamePresentation() + "' and statePresentation  like 'Active'", "idPresentation");
        String dataUpdate = "'descriptionProduct = " + " \" " + p.getDescriptionProduct() + " \" " + ", concentration = "
                + " \" " + p.getConcentration() + " \" " + ", stock =" + " \" " + p.getStock() + " \" "
                + ", cost =" + " \" " + p.getCost() + " \" " + ", salePrice =" + " \" " + p.getSalePrice()
                + " \" " + ", healthRegister =" + "\" " + p.getHealthRegister() + "\""
                + ", expirationDate =" + " \" " + p.getExpirationDate() + " \" "
                + ", idPresentation ="+ " \"" + idPresentation + "\""
                + ", idLaboratory =" + "\"" + p.getIdLaboratory() + "\"" + "'";
        String id = "'" + p.getId() + "'";
        if (exc.executeUpdateProcedure("'pharmacy.Product'", dataUpdate, "'idProduct'", id)) {
            JOptionPane.showMessageDialog(null, "Updated Product");
        }
    }

    @Override
    public void addDataTFCB(String id, JTextField[] textFields, JComboBox[] cbs, JDateChooser dateChooser)
            throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        executeSmtDb ex = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("Select descriptionProduct, concentration, stock, cost , salePrice, "
                + "healthRegister, idPresentation , idLaboratory, expirationDate "
                + "from pharmacy.Product "
                + "where statusProduct like 'Active' and idProduct = '" + id + "'");
        String namePresentation
                = ex.executeSmtSelect("select descriptionPresentation from pharmacy.presentation where idPresentation = "
                        + "'" + value.get(value.size() - 3) + "' and statePresentation like 'Active'", "descriptionPresentation");
        for (int i = 0; i < textFields.length; i++) {
            textFields[i].setText(value.get(i));
        }
        cbs[0].setSelectedItem(value.get(value.size() - 2));
        cbs[1].setSelectedItem(namePresentation);
        try {
            dateChooser.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(value.get(value.size()-1)));
        } catch (ParseException ex1) {
            Logger.getLogger(ControllerProduct.class.getName()).log(Level.SEVERE, null, ex1);
        }

    }

}
