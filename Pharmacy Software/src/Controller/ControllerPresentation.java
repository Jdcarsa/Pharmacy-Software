package Controller;

import Controller.Interfaces.IFindData;
import Controller.Interfaces.IController;
import Controller.Interfaces.IAddName;
import Controller.Interfaces.IAddDataTF;
import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Presentation;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class ControllerPresentation implements IController, IAddName, IAddDataTF, IFindData  {

    public ControllerPresentation ()
    {

    }

    @Override
    public void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idPresentation, descriptionPresentation"
                + " FROM pharmacy.Presentation WHERE statePresentation = 'Active' ", model);
    }

    @Override
    public void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idPresentation, descriptionPresentation"
                + " FROM pharmacy.PresentationWHERE statePresentation = 'Active' "
                + "AND descriptionPresentation LIKE " + "'%" + name + "%'", model);
    }

    @Override
    public void register(Object o) throws ClassNotFoundException, SQLException {
        Presentation p = (Presentation) o;
        executeProcedure exc = new executeProcedure();
        String values = "' \\" + "'" + p.getDescriptionPresentation() + "\\" + "' , \\'" + p.getStatePresentation() + "\\' ' ";
        if (exc.executeInsertProcedure("'Presentation'", "'descriptionPresentation, statePresentation'", values)) {
            JOptionPane.showMessageDialog(null, "Registered Presentation");
        }
    }

    @Override
    public void addNameCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select descriptionPresentation from pharmacy.Presentation where statePresentation like 'Active' ",
                "descriptionPresentation", cb);
    }

    @Override
    public void addIdCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select idPresentation from pharmacy.Presentation where statePresentation like 'Active' ",
                "idPresentation", cb);
    }

    @Override
    public void disable(String id) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        id = "'" + id + "'";
        if (exc.executeDisableProcedure("'Presentation'", "'statePresentation'", "'descriptionPresentation'", id)) {
            JOptionPane.showMessageDialog(null, "Disabled Presentation");
        }
    }

     @Override
    public void addDataTF(String id, JTextField[] textFields) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("Select descriptionPresentation from pharmacy.Presentation "
                + "where statePresentation like 'Active' and idPresentation = '" + id + "'");
        textFields[0].setText(value.get(0));
    }

    @Override
    public void update(Object o) throws ClassNotFoundException, SQLException {
        Presentation p = (Presentation) o;
        executeProcedure exc = new executeProcedure();
        String dataUpdate = "'descriptionPresentation =" + " \" " + p.getDescriptionPresentation() + "\" '";
        String id = "'" + p.getId() + "'";
        if (exc.executeUpdateProcedure("'Presentation'", dataUpdate, "'idPresentation'", id)) {
            JOptionPane.showMessageDialog(null, "Updated Presentation");
        }
    }
}
