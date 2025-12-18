package controllers;

import db.Conexion;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/reset")
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        // Configurar codificación de caracteres
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // Obtener datos enviados desde el formulario
        String usuario = req.getParameter("usuario");
        String nueva = req.getParameter("password");

        try (Connection con = Conexion.conectar()) {

            // Consulta para actualizar la contraseña del usuario
            PreparedStatement ps = con.prepareStatement(
                "UPDATE usuarios SET password = ? WHERE usuario = ?"
            );

            ps.setString(1, nueva);
            ps.setString(2, usuario);

            // Ejecutar actualización en la base de datos
            ps.executeUpdate();

            // Redirigir al login después del cambio
            resp.sendRedirect("login.jsp");

        } catch (Exception e) {
            // Mostrar error en caso de excepción
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
