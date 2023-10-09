package Controller;

import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Employee;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;


public class ControllerEmployee implements IController, IAddDataTFCB  {

    public ControllerEmployee() {
    }

    @Override
    public void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  *  FROM pharmacy.view_employee_user ", model);
    }

    @Override
    public void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  *  FROM pharmacy.view_employee_user "
                + "  WHERE name LIKE" + "'%" + name + "%'", model);
    }

    @Override
    public void register(Object o) throws ClassNotFoundException, SQLException {
        Employee e = (Employee) o;
        executeProcedure exc = new executeProcedure();
        String values = "' \\'" + e.getNameEmployee() + "\\'" + " , \\'" + e.getLastName() + "\\'" + " , \\'" + e.getJob() + "\\'"
                + " , \\'" + e.getSex() + "\\'" + " , \\'" + e.getNumIdentification() + "\\'" + " , \\'" + e.getEmail() + "\\'"
                + " , \\'" + e.getPhone() + "\\'" + " , \\'" + e.getAddress() + "\\'" + ", \\'" + e.getStatusEmployee() + "\\' ' ";
        
        if (exc.executeInsertProcedure("'Employee'", "'nameEmployee, lastName, job, sex,"
                + " numIdentification, email, phone, address, statusEmployee'", values)) {
            JOptionPane.showMessageDialog(null, "Registered Employee");
        }
    }
    
    @Override
        public void update(Object o) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        Employee e = (Employee) o;
        String dataUpdate = "'nameEmployee = "+ " \" " + e.getNameEmployee() +" \" "+ ", lastName = " 
                + " \" " + e.getLastName() +" \" "+  ", job ="+ " \" " + e.getJob()+" \" "
                +  ", sex ="+ " \" " + e.getSex()+" \" "+  ", email ="+ " \" " + e.getEmail()
                +" \" " +  ", phone ="+ " \" " + e.getPhone()+" \" " +  ", address ="+ " \" " + e.getAddress()+" \" "+"'";
        String id = "'" + e.getNumIdentification() + "'";
        if (exc.executeUpdateProcedure("'pharmacy.Employee'", dataUpdate, "'numIdentification'", id)) {
            JOptionPane.showMessageDialog(null, "Updated Employee");
        }
    }
    
    @Override
        public void addIdCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select numIdentification from pharmacy.Employee"
                + " where statusEmployee like 'Active' ", "numIdentification", cb);
    }

    @Override
    public void disable(String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        id = "'" + id + "'";
        if (exc.executeDisableProcedure("'pharmacy.Employee'","'statusEmployee'" , "'numIdentification'", id)) {
            JOptionPane.showMessageDialog(null, "Disabled Employee");
        }
    }
    
    @Override
        public void addDataTFCB(String id, JTextField[] textFields , JComboBox[] cbs) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("Select nameEmployee, lastName,"
                + "email, phone, address, job, sex  from pharmacy.Employee "
                + "where statusEmployee like 'Active' and numIdentification = '" + id + "'");
        for( int i = 0 ; i < textFields.length  ; i++){
                textFields[i].setText(value.get(i));
        }
        cbs[1].setSelectedItem(value.get(value.size()-1));
        cbs[0].setSelectedItem(value.get(value.size()-2));
    }
}
