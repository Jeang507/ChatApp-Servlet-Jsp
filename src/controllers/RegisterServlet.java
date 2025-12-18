package controllers;

import db.Conexion;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        // Configurar codificación de caracteres
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // Obtener datos del formulario de registro
        String usuario = req.getParameter("usuario");
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String correo = req.getParameter("correo");
        String password = req.getParameter("password");

        try (Connection con = Conexion.conectar()) {

            // Consulta para insertar un nuevo usuario
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO usuarios(usuario, nombre, apellido, correo, password) VALUES (?, ?, ?, ?, ?)"
            );

            ps.setString(1, usuario);
            ps.setString(2, nombre);
            ps.setString(3, apellido);
            ps.setString(4, correo);
            ps.setString(5, password);

            // Ejecutar inserción en la base de datos
            ps.executeUpdate();

            // Redirigir al login después del registro
            resp.sendRedirect("login.jsp");

        } catch (Exception e) {
            // Mostrar error si ocurre algún problema
            resp.getWriter().println("Error: " + e.getMessage() + "<br>");
            resp.getWriter().println("<a href='register.jsp'>Volver</a>");
        }
    }
}
