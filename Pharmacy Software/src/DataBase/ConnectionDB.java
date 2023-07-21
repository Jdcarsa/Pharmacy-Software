
package DataBase;


import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class ConnectionDB {
    
    private Connection conexion;

    public ConnectionDB() {
       
    }
    
     public void connect() throws ClassNotFoundException{
         try{
             Class.forName("com.mysql.cj.jdbc.Driver");
             conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","mysql");
             System.out.println("Connecto To MySQL");
         } catch(SQLException ex){
             System.out.println("Error al conectar con la base de datos");
            ex.printStackTrace();
         }
     }
     
      public void desconnect() throws SQLException{
          try{
              conexion.close();
          }catch(SQLException ex){
             System.out.println("Error al desconectar con la base de datos");
            ex.printStackTrace();
         }
         
     }
     
     
    
     public void test(){
         try{
              Statement stmt = conexion.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT idPresentation FROM pharmacy.presentation");
             while (rs.next()) {
                  int id = rs.getInt("idPresentation");
                  System.out.println("id: " + id);
                 // Aquí puedes hacer lo que necesites con los datos obtenidos
             }
         } catch (SQLException ex) {
             // Manejo de excepciones
         }
         }
     
     /*ResultSetMetaData rsmd = rs.getMetaData();
int columnCount = rsmd.getColumnCount();
while (rs.next()) {
    for (int i = 1; i <= columnCount; i++) {
        Object value = rs.getObject(i);*/
     
    
    
}
