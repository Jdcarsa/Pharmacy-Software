/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ideapad330S
 */
public class ClinicalHistory {

    private String allergiesTypes;
    private String bloodType;
    private String diseasesSurgeries;
    private String historyIllnessFamily;
    private String idClinicHistory;
    private String idPatient;
    private String medicineTakes;
    private String prescription;
    private String symptoms;

    public ClinicalHistory(String allergiesTypes, String bloodType, String diseasesSurgeries,
            String historyIllnessFamily, String idPatient, String medicineTakes, String prescription, String symptoms) {
        this.allergiesTypes = allergiesTypes;
        this.bloodType = bloodType;
        this.diseasesSurgeries = diseasesSurgeries;
        this.historyIllnessFamily = historyIllnessFamily;
        this.idPatient = idPatient;
        this.medicineTakes = medicineTakes;
        this.prescription = prescription;
        this.symptoms = symptoms;
    }

    public String getAllergiesTypes() {
        return allergiesTypes;
    }

    public void setAllergiesTypes(String allergiesTypes) {
        this.allergiesTypes = allergiesTypes;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public String getDiseasesSurgeries() {
        return diseasesSurgeries;
    }

    public void setDiseasesSurgeries(String diseasesSurgeries) {
        this.diseasesSurgeries = diseasesSurgeries;
    }

    public String getHistoryIllnessFamily() {
        return historyIllnessFamily;
    }

    public void setHistoryIllnessFamily(String historyIllnessFamily) {
        this.historyIllnessFamily = historyIllnessFamily;
    }

    public String getIdClinicHistory() {
        return idClinicHistory;
    }

    public void setIdClinicHistory(String idClinicHistory) {
        this.idClinicHistory = idClinicHistory;
    }

    public String getIdPatient() {
        return idPatient;
    }

    public void setIdPatient(String idPatient) {
        this.idPatient = idPatient;
    }

    public String getMedicineTakes() {
        return medicineTakes;
    }

    public void setMedicineTakes(String medicineTakes) {
        this.medicineTakes = medicineTakes;
    }

    public String getPrescription() {
        return prescription;
    }

    public void setPrescription(String prescription) {
        this.prescription = prescription;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

}
