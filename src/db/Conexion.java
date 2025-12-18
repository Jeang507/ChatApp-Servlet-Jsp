package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    // Método para establecer la conexión con la base de datos
    public static Connection conectar() throws Exception {

        // Cargar el driver de PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Retornar la conexión a la base de datos
        return DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/chat",
            "postgres",
            "1234"
        );
    }
}
