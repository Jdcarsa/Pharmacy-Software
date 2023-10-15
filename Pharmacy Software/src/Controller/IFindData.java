
package Controller;

import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;


public interface IFindData {
    
        void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException;

    void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException;
}
