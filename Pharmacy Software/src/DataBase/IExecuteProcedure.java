
package DataBase;

import java.sql.SQLException;


public interface IExecuteProcedure {

    boolean executeDisableProcedure(String table, String nameColumn, String nameColumnId, String values) throws ClassNotFoundException, SQLException;

    boolean executeInsertProcedure(String table, String columns, String values) throws ClassNotFoundException, SQLException;

    boolean executeUpdateProcedure(String table, String dataUpdates, String idColumn, String id) throws ClassNotFoundException, SQLException;
    
}
