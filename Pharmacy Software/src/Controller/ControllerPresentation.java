/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Presentation;
import java.sql.SQLException;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
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
}
