
package Controller;

import DataBase.executeSmtDb;
import com.toedter.calendar.JDateChooser;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.ParseException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JTextField;


public class AdminFunctions implements IAddDataCalendarTFCB {
    
    @Override
    public void addDataTFCB(String id, JTextField[] textFields, JComboBox[] cbs, JDateChooser[] dateChooser)
            throws ClassNotFoundException, SQLException {
        executeSmtDb exc = new executeSmtDb();
        executeSmtDb ex = new executeSmtDb();
        List<String> value = exc.executeSmtSelect("Select descriptionProduct, concentration, stock, cost , salePrice, "
                + "healthRegister, idPresentation , idLaboratory, expirationDate "
                + "from pharmacy.Product "
                + "where statusProduct like 'Active' and idProduct = '" + id + "'");
        String namePresentation
                = ex.executeSmtSelect("select descriptionPresentation from pharmacy.presentation where idPresentation = "
                        + "'" + value.get(value.size() - 3) + "' and statePresentation like 'Active'", "descriptionPresentation");
        for (int i = 0; i < textFields.length; i++) {
            textFields[i].setText(value.get(i));
        }
        cbs[0].setSelectedItem(value.get(value.size() - 2));
        cbs[1].setSelectedItem(namePresentation);
        try {
            dateChooser[0].setDate(new SimpleDateFormat("yyyy-MM-dd").parse(value.get(value.size()-1)));
        } catch (ParseException ex1) {
            Logger.getLogger(AdminFunctions.class.getName()).log(Level.SEVERE, null, ex1);
        }
    }
    

    
}
