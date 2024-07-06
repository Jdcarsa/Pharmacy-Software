package Controller;

import Controller.Interfaces.IAddDataTF;
import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

public class ControllerAccount implements IAddDataTF {

    @Override
    public void addDataTF(String id, JTextField[] textFields) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("Select nameEmployee, lastName , employeeUser, passwordUser "
                + "FROM pharmacy.useremployee JOIN pharmacy.employee "
                + "ON pharmacy.useremployee.IdEmployee = pharmacy.employee.idEmployee "
                + "where stateUser like 'Active' and idUser = '" + id + "'");
        textFields[0].setText(value.get(0));
        textFields[1].setText(value.get(1));
        textFields[2].setText(value.get(2));
        textFields[3].setText(value.get(3));
    }

    public void update(String[] data) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        String dataUpdate = "'nameEmployee = " + " \" " + data[0] + " \" " + ", lastName= "
                + " \" " + data[1] + " \" " + "'";
        String dataUpdate2 = "' employeeUser= "
                + " \" " + data[2] + " \" " + ", passwordUser =" + " \" " + data[3] + " \" " + "'";
        String id = "'" + data[4] + "'";
        executeSmtDb exc2 = new executeSmtDb();
        String columnName = "idEmployee";
        String statement = "SELECT " + columnName
                + " FROM pharmacy.useremployee WHERE stateUser LIKE 'Active' AND idUser = " + id;
        String id2 = exc2.executeSmtSelect(statement, columnName);
        id2 = "'" + id2 + "'";
        if (exc.executeUpdateProcedure("'UserEmployee'", dataUpdate2, "'idUser'", id)
                && exc.executeUpdateProcedure("'Employee'", dataUpdate, "'idEmployee'", id2)) {
            JOptionPane.showMessageDialog(null, "Updated User");
        }
    }

    public int loginAuth(String user, String password) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("Select employeeUser, passwordUser, typeUser "
                + "FROM pharmacy.useremployee"
                + "where stateUser like 'Active' and employeeUser = '" + user + "'" + "and passwordUser = '" + password + "'");
        
        boolean flag = value.get(0).equalsIgnoreCase(user) && value.get(1).equalsIgnoreCase(password);

        if (!flag) {
            JOptionPane.showMessageDialog(null, "User or Password Incorrect");
            return -1;
        }

        if (flag && value.get(2).equalsIgnoreCase("Admin")) {
            return 1;
        } else if (flag && value.get(2).equalsIgnoreCase("Doctor")) {
            return 2;
        } else {
            return 3;
        }
    }
    
    public String findUserId(String user, String password) throws ClassNotFoundException, SQLException{
                executeSmtDb exc = new executeSmtDb();
        String value = exc.executeSmtSelect("Select idUser "
                + "FROM pharmacy.useremployee"
                + "where stateUser like 'Active' and employeeUser = '" 
                + user + "'" + "and passwordUser = '" + password + "'", 
                "idUser");
        
        return value;
    }

}
