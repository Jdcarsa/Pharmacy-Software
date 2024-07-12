package Controller;

import Controller.Interfaces.IFindData;
import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.ClinicalHistory;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class ControllerHistoryPatient implements IFindData {

    public void register(Object o) throws ClassNotFoundException, SQLException {
        ClinicalHistory e = (ClinicalHistory) o;
        e.setIdPatient(searchCodePatient(e.getIdPatient()));
        executeProcedure exc = new executeProcedure();
        String values = "' \\'" + e.getIdPatient() + "\\'" + " , \\'" + e.getAllergiesTypes() + "\\'"
                + " , \\'" + e.getBloodType() + "\\'" + " , \\'" + e.getDiseasesSurgeries() + "\\'" + " , \\'" + e.getPrescription() + "\\'"
                + " , \\'" + e.getHistoryIllnessFamily() + "\\'" + " , \\'" + e.getMedicineTakes() + "\\'" + ", \\'" + e.getSymptoms() + "\\' ' ";

        if (exc.executeInsertProcedure("'ClinicHistory'", "'idPatient, allergiesTypes"
                + " bloodType, diseasesSurgeries, prescription, historyIllnessFamily, medicineTakes,symptoms'", values)) {
            JOptionPane.showMessageDialog(null, "Registered History Patient");
        }
    }

    private String searchCodePatient(String id) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        String select = "SELECT idPatient FROM pharmacy.patient WHERE pharmacy.patient.numIdentification = " + id;
        String cod = exc.executeSmtSelect(select, "idPatient");
        return cod;
    }

    @Override
    public void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  *  FROM pharmacy.patient ", model);
    }

    @Override
    public void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  *  FROM pharmacy.patient  "
                + "  WHERE namePatient LIKE" + "'%" + name + "%'", model);
    }

    public void addDataTFTA(String id, JTextField[] textFields, JTextArea[] textAreas) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("SELECT * FROM pharmacy.clinichistory"
                + "where idPatient = '" + id + "'");
        String name = exc.executeSmtSelect("SELECT namePatient FROM pharmacy.patient"
                + "where idPatient = '" + id + "'", "namePatient");
        textFields[0].setText(name);
        textFields[1].setText(value.get(2));

        textAreas[0].setText(value.get(8));
        textAreas[1].setText(value.get(7));
        textAreas[2].setText(value.get(5));
        textAreas[3].setText(value.get(3));
        textAreas[4].setText(value.get(4));
        textAreas[5].setText(value.get(6));
    }

    public void addIdCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("Select idClinicHistory from pharmacy.pharmacy.clinichistory ",
                "idPresentation", cb);
    }

}
