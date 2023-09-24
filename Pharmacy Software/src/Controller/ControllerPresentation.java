/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Presentation;
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
public class ControllerPresentation {

    public ControllerPresentation() {

    }

    public void getAllPresentation(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idPresentation, descriptionPresentation"
                + " FROM pharmacy.Presentation WHERE statePresentation = 'Active' ", model);
    }

    public void searchPresentation(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idPresentation, descriptionPresentation"
                + " FROM pharmacy.PresentationWHERE statePresentation = 'Active' "
                + "AND descriptionPresentation LIKE " + "'%" + name + "%'", model);
    }

    public void registerPresentation(Presentation p) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        String values = "' \\" + "'" + p.getDescriptionPresentation() + "\\" + "' , \\'" + p.getStatePresentation() + "\\' ' ";
        if (exc.executeInsertProcedure("'Presentation'", "'descriptionPresentation, statePresentation'", values)) {
            JOptionPane.showMessageDialog(null, "Registered Presentation");
        }
    }

    public void addIdPresentationCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select descriptionPresentation from pharmacy.Presentation where statePresentation like 'Active' ",
                "descriptionPresentation", cb);
    }
    
        public void addId2PresentationCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select idPresentation from pharmacy.Presentation where statePresentation like 'Active' ",
                "idPresentation", cb);
    }

    public void disablePresentation(String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        id = "'" + id + "'";
        if (exc.executeDisableProcedure("'Presentation'", "'statePresentation'", "'descriptionPresentation'", id)) {
            JOptionPane.showMessageDialog(null, "Disabled Presentation");
        }
    }

    public void addDataTFPresentation(String id, JTextField name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("Select descriptionPresentation from pharmacy.Presentation "
                + "where statePresentation like 'Active' and idPresentation = '" +id +"'");
        name.setText(value.get(0));
    }
    
        public void updatePresentation(Presentation p , String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        String dataUpdate = "'descriptionPresentation =" + " \" " + p.getDescriptionPresentation() + "\" '";
         id = "'" + id + "'";
        if (exc.executeUpdateProcedure("'Presentation'", dataUpdate,"'idPresentation'", id )) {
            JOptionPane.showMessageDialog(null, "Updated Presentation");
        }
    }
}
