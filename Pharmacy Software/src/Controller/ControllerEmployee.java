package Controller;

import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Employee;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ideapad330S
 */
public class ControllerEmployee {

    public ControllerEmployee() {
    }

    public void getAllEmployee(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  *  FROM pharmacy.employee_user ", model);
    }

    public void searchEmployee(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  *  FROM pharmacy.employee_user "
                + "  WHERE name LIKE" + "'%" + name + "%'", model);
    }

    public void registerEmployee(Employee e) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        String values = "' \\'" + e.getNameEmployee() + "\\'" + " , \\'" + e.getLastName() + "\\'" + " , \\'" + e.getJob() + "\\'"
                + " , \\'" + e.getSex() + "\\'" + " , \\'" + e.getNumIdentification() + "\\'" + " , \\'" + e.getEmail() + "\\'"
                + " , \\'" + e.getPhone() + "\\'" + " , \\'" + e.getAddress() + "\\'" + ", \\'" + e.getStatusEmployee() + "\\' ' ";
        
        if (exc.executeInsertProcedure("'Employee'", "'nameEmployee, lastName, job, sex,"
                + " numIdentification, email, phone, address, statusEmployee'", values)) {
            JOptionPane.showMessageDialog(null, "Registered Employee");
        }
    }
}
