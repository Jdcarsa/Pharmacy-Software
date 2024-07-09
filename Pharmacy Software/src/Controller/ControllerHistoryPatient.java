package Controller;

import Controller.Interfaces.IFindData;
import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.ClinicalHistory;
import java.sql.SQLException;
import javax.swing.JOptionPane;
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
}
