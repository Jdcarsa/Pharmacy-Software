
package Controller;

import DataBase.executeProcedure;
import Model.Patient;
import java.sql.SQLException;
import javax.swing.JOptionPane;


public class ControllerPatient {

    
        public void register(Object o) throws ClassNotFoundException, SQLException {
        Patient e = (Patient) o;
        executeProcedure exc = new executeProcedure();
        String values = "' \\'" + e.getNamePatient() + "\\'"+ " , \\'" + e.getSex() + "\\'" +
                " , \\'" + e.getNumIdentification() + "\\'" + " , \\'" + e.getEmail() + "\\'"
                + " , \\'" + e.getPhone() + "\\'" + " , \\'" + e.getAddress() + "\\'" + ", \\'" + e.getBirthdate() + "\\' ' ";
        
        if (exc.executeInsertProcedure("'Patient'", "'namePatient, sex"
                + " numIdentification, email, phone, address,birthdate'", values)) {
            JOptionPane.showMessageDialog(null, "Registered Patient");
        }
    }
}
