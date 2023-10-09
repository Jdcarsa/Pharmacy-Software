
package DataBase;

import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.table.DefaultTableModel;


public interface IExecuteSmtDb {

    void executeSmtSelect(String statement, DefaultTableModel model) throws ClassNotFoundException, SQLException;

    void executeSmtSelect(String statement, String columnName, JComboBox cb) throws ClassNotFoundException, SQLException;

    String executeSmtSelect(String statement, String columnName) throws ClassNotFoundException, SQLException;

    List executeSmtSelect(String statement) throws ClassNotFoundException, SQLException;
    
}
