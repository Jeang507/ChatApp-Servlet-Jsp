package controllers;

import db.Conexion;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        // Configurar codificación de caracteres
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // Obtener datos del formulario
        String usuario = req.getParameter("usuario");
        String password = req.getParameter("password");

        try (Connection con = Conexion.conectar()) {

            // Consulta para validar usuario y contraseña
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM usuarios WHERE usuario = ? AND password = ?"
            );
            ps.setString(1, usuario);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            // Si las credenciales son correctas
            if (rs.next()) {
                // Crear sesión y guardar el usuario
                HttpSession session = req.getSession();
                session.setAttribute("usuario", usuario);

                // Redirigir al chat
                resp.sendRedirect("Chat.jsp");
            } else {
                // Enviar mensaje de error al login
                req.setAttribute("error", "Usuario o contraseña incorrectos");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            // Mostrar error en caso de excepción
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
