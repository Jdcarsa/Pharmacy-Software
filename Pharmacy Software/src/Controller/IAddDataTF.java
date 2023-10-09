
package Controller;

import java.sql.SQLException;
import javax.swing.JTextField;


public interface IAddDataTF {
    
    public void addDataTF(String id, JTextField[] textFields) throws ClassNotFoundException, SQLException;
}
