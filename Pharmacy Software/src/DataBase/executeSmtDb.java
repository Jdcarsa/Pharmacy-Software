package DataBase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class executeSmtDb {

    private final ConnectionDB conexion = new ConnectionDB();

    public executeSmtDb() {
    }

    public void executeSmtSelect(String statement, DefaultTableModel model) throws ClassNotFoundException, SQLException {
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

    public void executeSmtSelect(String statement, String columnName, JComboBox cb) throws ClassNotFoundException, SQLException {
        conexion.connect();
        try {
            Statement stmt = conexion.getConexion().createStatement();
            ResultSet rs = stmt.executeQuery(statement);
            while (rs.next()) {
                String name = rs.getString(columnName);
                cb.addItem(name);
            }
            conexion.desconnect();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error has occurred!");
        }
    }

    public String executeSmtSelect(String statement, String columnName) throws ClassNotFoundException, SQLException {
        conexion.connect();
        String value ="";
        try {
            Statement stmt = conexion.getConexion().createStatement();
            ResultSet rs = stmt.executeQuery(statement);
            while (rs.next()) {
             value = rs.getString(columnName);
            }
            conexion.desconnect();
            return value;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error has occurred!" +ex);
            return value;
        }
    }

}
