package Controller;

import Controller.Interfaces.IFindData;
import Controller.Interfaces.IController;
import Controller.Interfaces.IAddDataTF;
import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Provider;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class ControllerProvider implements IController , IAddDataTF , IFindData {

    public ControllerProvider() {
    }

    @Override
    public void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT numIdentification, nameProvider, address , phone , bank , numAccount"
                + " FROM pharmacy.Provider WHERE stateProvider = 'Active' ", model);
    }

    @Override
    public void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  numIdentification, nameProvider, address , phone , bank , numAccount "
                + " FROM pharmacy.Provider WHERE nameProvider LIKE" + "'%" + name + "%'" + "AND  stateProvider = 'Active' ", model);
    }

    @Override
    public void register(Object o) throws ClassNotFoundException, SQLException {
        Provider p = (Provider) o;
        executeProcedure exc = new executeProcedure();
        String values = "' \\'" + p.getNameProvider() + "\\'" + " , \\'" + p.getNumIdentification() + "\\'" + " , \\'" + p.getAddress() + "\\'"
                + " , \\'" + p.getEmail() + "\\'" + " , \\'" + p.getPhone() + "\\'" + " , \\'" + p.getBank() + "\\'" + " , \\'" + p.getNumAccount() + "\\'"
                + ", \\'" + p.getStateProvider() + "\\' ' ";
        if (exc.executeInsertProcedure("'Provider'", "'nameProvider, numIdentification, Address, Email , Phone, "
                + "Bank, numAccount, stateProvider'", values)) {
            JOptionPane.showMessageDialog(null, "Registered Provider");
        }
    }

    @Override
    public void disable(String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        id = "'" + id + "'";
        if (exc.executeDisableProcedure("'Provider'", "'stateProvider'", "'numIdentification'", id)) {
            JOptionPane.showMessageDialog(null, "Disabled Provider");
        }
    }


    @Override
    public void addIdCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select idProvider from pharmacy.Provider where stateProvider like 'Active' ", "idProvider", cb);
    }

    @Override
    public void addDataTF(String id, JTextField[] textFields) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("SELECT   nameProvider , numIdentification, address, Email , phone , bank , numAccount "
                + " FROM pharmacy.Provider WHERE   stateProvider = 'Active' ");
        for (int i = 0; i < 7; i++) {
            textFields[i].setText(value.get(i));
        }
    }

    @Override
    public void update(Object o) throws ClassNotFoundException, SQLException {
        Provider p = (Provider) o;
        executeProcedure exc = new executeProcedure();
        String dataUpdate = "'nameProvider = " + " \" " + p.getNameProvider() + " \" " + ", numIdentification = "
                + " \" " + p.getNumIdentification() + " \" " + ", Address = "
                + " \" " + p.getAddress() + " \"  " + ", Email = " + " \" " + p.getEmail() + " \" " + ",  Phone = "
                + " \" " + p.getPhone() + " \" " + ", Bank = "
                + " \" " + p.getBank() + " \" " + ", numAccount =" + " \" " + p.getNumAccount() + " \" " + "'";
        String id = "'" + p.getId() + "'";
        if (exc.executeUpdateProcedure("'Provider'", dataUpdate, "'idProvider'", id)) {
            JOptionPane.showMessageDialog(null, "UpdatedProvider");
        }
    }
}
