
package DataBase;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;


public class executeSmtDb {
     private final ConnectionDB conexion = new ConnectionDB();

    public executeSmtDb() {
    }
     
     
    public void executeSmtSelect(String statement, DefaultTableModel model ) throws ClassNotFoundException, SQLException {
        conexion.connect();
        try {
            Statement stmt = conexion.getConexion().createStatement();
            ResultSet rs = stmt.executeQuery(statement);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                model.addColumn(rsmd.getColumnName(i).toUpperCase());
            }
            while (rs.next()) {
                Object[] row = new Object[columnCount];
                for (int i = 1; i <= columnCount; i++) {
                    row[i - 1] = rs.getObject(i);
                }
                model.addRow(row);
            }
            conexion.desconnect();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error has occurred!");
        }

    }
}
