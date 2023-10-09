package DataBase;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class ConnectionDB {

    private Connection conexion;
    private static ConnectionDB instance;

    private ConnectionDB() {
    }

    public static ConnectionDB getInstance() {
        if (instance == null) {
            instance = new ConnectionDB();
        }
        return instance;
    }

    public void connect() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "mysql");
        } catch (SQLException ex) {
            System.out.println("Error al conectar con la base de datos");
            ex.printStackTrace();
        }
    }

    public void desconnect() throws SQLException {
        try {
            conexion.close();
        } catch (SQLException ex) {
            System.out.println("Error al desconectar con la base de datos");
            ex.printStackTrace();
        }

    }

    public Connection getConexion() {
        return conexion;
    }

    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }

}
