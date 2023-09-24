/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Laboratory;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ideapad330S
 */
public class ControllerLaboratory {

    public ControllerLaboratory() {
    }

    public void getAllLaboratory(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idLaboratory, nameLaboratory, address , phone"
                + " FROM pharmacy.Laboratory WHERE stateLaboratory = 'Active' ", model);
    }

    public void searchLaboratory(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idLaboratory, nameLaboratory, address , phone "
                + " FROM pharmacy.Laboratory WHERE nameLaboratory LIKE" + "'%" + name + "%'" + "AND  stateLaboratory = 'Active' ", model);
    }

    public void registerLaboratory(Laboratory lab) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        String values = "' \\'" + lab.getName() + "\\'" + " , \\'" + lab.getAddress() + "\\'" + " , \\'" + lab.getPhone() + "\\'"
                + ", \\'" + lab.getStateLaboratory() + "\\' ' ";
        if (exc.executeInsertProcedure("'Laboratory'", "'nameLaboratory, address , phone, stateLaboratory'", values)) {
            JOptionPane.showMessageDialog(null, "Registered Laboratory");
        }
    }

    public void addIdLabCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select idLaboratory from pharmacy.Laboratory where stateLaboratory like 'Active' ", "idLaboratory", cb);
    }

    public void disableLab(String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        id = "'" + id + "'";
        if (exc.executeDisableProcedure("'Laboratory", "'stateLaboratory'", "'idLaboratory'", id)) {
            JOptionPane.showMessageDialog(null, "Disabled Laboratory");
        }
    }

    public void addDataTFLab(String id, JTextField[] textFields) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("Select nameLaboratory, address, phone from pharmacy.Laboratory "
                + "where stateLaboratory like 'Active' and idLaboratory = '" + id + "'");
        textFields[0].setText(value.get(0));
        textFields[1].setText(value.get(1));
        textFields[2].setText(value.get(2));
    }

    public void updateLab(Laboratory lab, String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        String dataUpdate = "'nameLaboratory = "+ " \" " + lab.getName() +" \" "+ ", address = " 
                + " \" " + lab.getAddress() +" \" "+  ", phone ="+ " \" " + lab.getPhone()+" \" " +"'";
        id = "'" + id + "'";
        if (exc.executeUpdateProcedure("'Laboratory'", dataUpdate, "'idLaboratory'", id)) {
            JOptionPane.showMessageDialog(null, "Updated Laboratory");
        }
    }
}
