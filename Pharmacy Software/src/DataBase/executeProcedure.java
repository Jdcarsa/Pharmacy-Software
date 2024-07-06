package DataBase;

import DataBase.Interfaces.IExecuteProcedure;
import java.sql.SQLException;
import java.sql.CallableStatement;
import javax.swing.JOptionPane;

public class executeProcedure implements IExecuteProcedure {

    private final ConnectionDB conexion = ConnectionDB.getInstance();

    public executeProcedure() {
    }

    @Override
    public boolean executeInsertProcedure(String table, String columns, String values) throws ClassNotFoundException, SQLException {
        conexion.connect();
        try {
            String call = "{ call pharmacy.insertAnyData(" + table + "," + columns + "," + values + ")  }";
            CallableStatement stmt = conexion.getConexion().prepareCall(call);
            stmt.execute();
            conexion.desconnect();
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error has occurred!" + ex);
            return false;
        }
    }

    @Override
    public boolean executeDisableProcedure(String table, String nameColumn, String nameColumnId,
            String values) throws ClassNotFoundException, SQLException {
        conexion.connect();
        try {
            String call = "{ call pharmacy.disableAnyData(" + table + "," + nameColumn + "," + nameColumnId + "," + values + ")  }";
            CallableStatement stmt = conexion.getConexion().prepareCall(call);
            stmt.execute();
            conexion.desconnect();
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error has occurred!" + ex);
            return false;
        }
    }

    @Override
    public boolean executeUpdateProcedure(String table,  String dataUpdates, String idColumn, String id)
            throws ClassNotFoundException, SQLException {
        conexion.connect();
        try {
            String call = "{ call pharmacy.updateAnyData(" + table + "," + dataUpdates 
                    + "," + idColumn + "," + id + ")  }";
            CallableStatement stmt = conexion.getConexion().prepareCall(call);
            stmt.execute();
            conexion.desconnect();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            JOptionPane.showMessageDialog(null, "An error has occurred!" + ex);
            
            return false;
        }
    }
}
