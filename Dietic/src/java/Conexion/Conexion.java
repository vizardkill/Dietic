/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    
    private static Connection conexion = null;

    public static Connection getConexion() {
      try {
            //  Carga el driver de la base de datos
            Class.forName("oracle.jdbc.OracleDriver");
            String nombreUsuario = "admin_dietic";
            String password = "123456";
            //String url = "jdbc:oracle:thin:@172.17.27.71:1521:XE";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            conexion = DriverManager.getConnection(url, nombreUsuario, password);
        } catch (ClassNotFoundException ex) {
            System.out.println("Exception: " + ex.getMessage());
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conexion;
    }

   /* public static Connection getConexion() {
        Connection conexion = null;
        // Librería de MySQL
        String driver = "com.mysql.cj.jdbc.Driver";
        // Nombre de la base de datos
        String database = "dietic";
        // Host
        String hostname = "localhost";
        // Puerto
        String port = "3306";
        // Ruta de nuestra base de datos (desactivamos el uso de SSL con "?useSSL=false")
        String url = "jdbc:mysql://" + hostname + ":" + port + "/" + database + "?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        // Nombre de usuario
        String username = "connection";
        // Clave de usuario
        String password = "*PPI2019*";

        try {
            Class.forName(driver);
            conexion = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("ERROR AL CONECTAR CON LA BASE DE DATOS: " + e.getMessage());
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, e);
        }

        return conexion;
    }
*/
}
