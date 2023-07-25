
package DataBase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.CallableStatement;
import javax.swing.JOptionPane;


public class executeProcedure {
    private final ConnectionDB conexion = new ConnectionDB();
    
    public executeProcedure(){
    }
    
    
        public boolean executeInsertProcedure(String table, String columns , String values ) throws ClassNotFoundException, SQLException {
        conexion.connect();
        try {
            String call ="{ call pharmacy.insertAnyData("+ table +"," + columns +"," + values +")  }" ;
            CallableStatement stmt = conexion.getConexion().prepareCall(call);
             stmt.execute();
            conexion.desconnect();
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "An error has occurred!" + ex);
            return false;
        }

    }
}
