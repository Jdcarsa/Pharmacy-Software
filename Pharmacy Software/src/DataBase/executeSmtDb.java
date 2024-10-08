package DataBase;

import DataBase.Interfaces.IExecuteSmtDb;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class executeSmtDb implements IExecuteSmtDb {

    private final ConnectionDB conexion = ConnectionDB.getInstance();

    public executeSmtDb() {
    }

    @Override
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

    @Override
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

    @Override
    public String executeSmtSelect(String statement, String columnName) throws ClassNotFoundException, SQLException {
        conexion.connect();
        String value = "";
        try {
            Statement stmt = conexion.getConexion().createStatement();
            ResultSet rs = stmt.executeQuery(statement);
            while (rs.next()) {
                value = rs.getString(columnName);
            }
            conexion.desconnect();
            return value;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error has occurred!" + ex);
            return value;
        }
    }

    @Override
    public List executeSmtSelect(String statement) throws ClassNotFoundException, SQLException {
        conexion.connect();
        List<String> value = new ArrayList<>();
        try {
            Statement stmt = conexion.getConexion().createStatement();
            ResultSet rs = stmt.executeQuery(statement);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            while (rs.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    value.add(rs.getString(i));
                }
            }
            conexion.desconnect();
            return value;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error has occurred!" + ex);
            return value;
        }
    }

}
