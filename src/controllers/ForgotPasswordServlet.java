package controllers;

import db.Conexion;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/forgot")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        // Obtener los datos enviados desde el formulario
        String usuario = req.getParameter("usuario");
        String correo = req.getParameter("correo");

        // Configurar la respuesta en UTF-8
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        try (Connection con = Conexion.conectar()) {

            // Consulta para verificar usuario y correo
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM usuarios WHERE usuario = ? AND correo = ?"
            );
            ps.setString(1, usuario);
            ps.setString(2, correo);

            ResultSet rs = ps.executeQuery();

            // Si los datos son correctos, redirigir al reset de contraseña
            if (rs.next()) {
                resp.sendRedirect("reset.jsp?user=" + usuario);
            } else {
                // Mostrar mensaje de error si los datos no coinciden
                resp.getWriter().println(
                    "Datos incorrectos.<br><a href='forgot.jsp'>Intentar de nuevo</a>"
                );
            }

        } catch (Exception e) {
            // Mostrar error en caso de excepción
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
