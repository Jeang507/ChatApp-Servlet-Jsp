<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.*" %>

<%
    // Archivo donde se almacenan los mensajes del chat
    File archivo = new File("/tmp/chat-mensajes.txt");

    // Si el archivo no existe, no se muestran mensajes
    if (!archivo.exists()) return;

    // Lector para recorrer el archivo línea por línea
    BufferedReader br = new BufferedReader(new FileReader(archivo));
    String linea;

    // Procesar cada mensaje guardado
    while ((linea = br.readLine()) != null) {

        // Separar usuario, hora y mensaje
        String[] partes = linea.split("\\|", 3);

        // Validar formato correcto del mensaje
        if (partes.length == 3) {
            String user = partes[0];      // Usuario
            String hora = partes[1];      // Hora
            String mensaje = partes[2];   // Texto del mensaje

            // Verificar si el mensaje pertenece al usuario actual
            boolean soyYo = user.equals(session.getAttribute("usuario"));
%>

<div class="bubble <%= soyYo ? "me" : "other" %>">
    <b><%= user %></b>
    <span style="font-size:12px; opacity:0.7;">(<%= hora %>)</span><br>
    <%= mensaje %>
</div>

<%
        }
    }

    // Cerrar el lector del archivo
    br.close();
%>
