
package Controller;

import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Provider;
import java.sql.SQLException;
import javax.swing.JOptionPane;
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
                + " FROM pharmacy.Provider WHERE nameLaboratory LIKE" + "'%" + name + "%'" + "AND  stateProvider = 'Active' ", model);
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
}
