/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.AdminFunctions;

import Controller.ControllerProduct;
import Controller.Interfaces.IAddDataCalendarTFCB;
import Controller.Interfaces.IFindData;
import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Contract;
import com.toedter.calendar.JDateChooser;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ideapad330S
 */
public class FunctionsContractEmployee implements IFindData, IAddDataCalendarTFCB {

    @Override
    public void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idContract, numIdentification , contract.nameEmployee , job , salary , contractDate , contractEnd"
                + "  FROM pharmacy.contract JOIN pharmacy.employee on"
                + " (contract.idEmployee = employee.idEmployee) where statusContract like 'Active'", model);
    }

    @Override
    public void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException {

        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idContract, numIdentification , contract.nameEmployee , job , salary , contractDate , contractEnd"
                + "  FROM pharmacy.contract JOIN pharmacy.employee on"
                + " (contract.idEmployee = employee.idEmployee) WHERE contract.nameEmployee  Like " + "'%" + name + "%'"
                + "and  statusContract like 'Active'", model);
    }

    @Override
    public void addDataTFCB(String id, JTextField[] textFields, JComboBox[] cbs, JDateChooser[] dateChooser)
            throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("SELECT  salary"
                + " , contractDate , contractEnd , statusContract"
                + "  FROM pharmacy.contract"
                + "  WHERE idContract =" + "'" + id + "'");
        textFields[0].setText(value.get(0));
        cbs[0].setSelectedItem(value.get(3));
        try {
            dateChooser[0].setDate(new SimpleDateFormat("yyyy-MM-dd").parse(value.get(1)));
            dateChooser[1].setDate(new SimpleDateFormat("yyyy-MM-dd").parse(value.get(2)));
        } catch (ParseException ex1) {
            Logger.getLogger(ControllerProduct.class.getName()).log(Level.SEVERE, null, ex1);
        }
    }

    public void update(Object o) throws ClassNotFoundException, SQLException {
        executeProcedure exc = new executeProcedure();
        Contract c = (Contract) o;
        String dataUpdate = "'nameEmployee = " + " \" " + c.getSalary() + " \" " + ", lastName = "
                + " \" " + c.getContractStart() + " \" " + ", job =" + " \" " + c.getContractEnd() + " \" "
                + ", sex =" + " \" " + c.getStatus() + " \" " + ", email =" + " \" " + "'";
        String id = "'" + c.getIdContract() + "'";
        if (exc.executeUpdateProcedure("'pharmacy.contract'", dataUpdate, "'idContract'", id)) {
            JOptionPane.showMessageDialog(null, "Updated Contract");
        }
    }

    public void addIdCb(JComboBox cb) throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        exc.executeSmtSelect("SELECT  idContract"
                + "  FROM pharmacy.contract where statusContract like 'Active'", "idContract", cb);
    }

}
