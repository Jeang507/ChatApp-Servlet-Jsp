<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>

<%
    // Obtener los datos enviados desde el chat
    String usuario = request.getParameter("usuario");
    String mensaje = request.getParameter("mensaje");

    // Verificar que los datos no estén vacíos
    if (usuario != null && mensaje != null &&
        !usuario.isBlank() && !mensaje.isBlank()) {

        // Archivo donde se almacenan los mensajes
        File archivo = new File("/tmp/chat-mensajes.txt");

        // Abrir el archivo en modo escritura (append)
        FileWriter fw = new FileWriter(archivo, true);

        // Obtener la hora actual
        String hora = new java.text.SimpleDateFormat("HH:mm")
                        .format(new java.util.Date());

        // Guardar el mensaje con el formato definido
        fw.write(usuario.trim() + "|" + hora + "|" + mensaje.trim() + "\n");

        // Cerrar el archivo
        fw.close();
    }

    // Respuesta enviada al cliente
    out.print("OK");
%>
