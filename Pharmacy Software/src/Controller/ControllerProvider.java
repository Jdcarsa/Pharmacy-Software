package Controller;

import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Provider;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class ControllerProvider {

    public ControllerProvider() {
    }

    public void getAllProvider(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT numIdentification, nameProvider, address , phone , bank , numAccount"
                + " FROM pharmacy.Provider WHERE stateProvider = 'Active' ", model);
    }

    public void searchProvider(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  numIdentification, nameProvider, address , phone , bank , numAccount "
                + " FROM pharmacy.Provider WHERE nameProvider LIKE" + "'%" + name + "%'" + "AND  stateProvider = 'Active' ", model);
    }

    public void registerProvider(Provider p) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        String values = "' \\'" + p.getNameProvider() + "\\'" + " , \\'" + p.getNumIdentification() + "\\'" + " , \\'" + p.getAddress() + "\\'"
                + " , \\'" + p.getEmail() + "\\'" + " , \\'" + p.getPhone() + "\\'" + " , \\'" + p.getBank() + "\\'" + " , \\'" + p.getNumAccount() + "\\'"
                + ", \\'" + p.getStateProvider() + "\\' ' ";
        if (exc.executeInsertProcedure("'Provider'", "'nameProvider, numIdentification, Address, Email , Phone, "
                + "Bank, numAccount, stateProvider'", values)) {
            JOptionPane.showMessageDialog(null, "Registered Provider");
        }
    }

    public void disableProvider(String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        id = "'" + id + "'";
        if (exc.executeDisableProcedure("'Provider'", "'stateProvider'", "'numIdentification'", id)) {
            JOptionPane.showMessageDialog(null, "Disabled Provider");
        }
    }

    public void addIdProiverCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select numIdentification from pharmacy.Provider where stateProvider like 'Active' ", "numIdentification", cb);
    }

    public void addIdProiver2Cb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select idProvider from pharmacy.Provider where stateProvider like 'Active' ", "idProvider", cb);
    }

    public void addDataTFPro(String id, JTextField[] textFields) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("SELECT   nameProvider , numIdentification, address, Email , phone , bank , numAccount "
                + " FROM pharmacy.Provider WHERE   stateProvider = 'Active' ");
        textFields[0].setText(value.get(0));
        textFields[1].setText(value.get(1));
        textFields[2].setText(value.get(2));
        textFields[3].setText(value.get(3));
        textFields[4].setText(value.get(4));
        textFields[5].setText(value.get(5));
        textFields[6].setText(value.get(6));

    }

    public void updateProvider(Provider p, String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        String dataUpdate = "'nameProvider = " + " \" " + p.getNameProvider() + " \" " + ", numIdentification = "
                + " \" " + p.getNumIdentification() + " \" "  + ", Address = "
                + " \" " + p.getAddress() + " \"  "  + ", Email = " + " \" " + p.getEmail() + " \" " + ",  Phone = "
                + " \" " + p.getPhone() + " \" " + ", Bank = "
                + " \" " + p.getBank() + " \" " + ", numAccount =" + " \" " + p.getNumAccount() + " \" " + "'";
        id = "'" + id + "'";
        if (exc.executeUpdateProcedure("'Provider'", dataUpdate, "'idProvider'", id)) {
            JOptionPane.showMessageDialog(null, "UpdatedProvider");
        }
    }
}
