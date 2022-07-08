<%--
  Created by IntelliJ IDEA.
  User: sebastian
  Date: 07/07/2022
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%
        /*
        * Lee la información que proviene de FormularioInsertarLibro.html usando objeto request de JSP.
        * */
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String categoria = request.getParameter("categoria");
        Connection conexion = null;
        Statement sentencia = null;

    int filas=0;
    try {
        /*
        * Crea un objeto de tipo Connection(conexión) y un objeto de tipo Statement(sentencia)
        * */
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/arquitecturajava",
                "root",
                "");
        sentencia = conexion.createStatement();

        /*
        * Crea una consulta SQL de inserción con los datos del libro
        * */
        String consultaSQL = "insert into Libros (isbn,titulo,categoria) values ";
        consultaSQL += "('" + isbn + "','" + titulo + "','" + categoria + "')";

        /*
        * Ejecuta la sentencia con su SQL
        * */
        filas = sentencia.executeUpdate(consultaSQL);
        response.sendRedirect("MostrarLibros.jsp");

    } catch (ClassNotFoundException e) {
        System.out.println("Error en la carga del driver" + e.getMessage());
    } catch (SQLException e) {
        System.out.println("Error accediendo a la base de datos" + e.getMessage());
    } finally {
        /*
        * Cierra los recursos (conexión, sentencia, etc)
        * */
        if (sentencia != null) {
            try {sentencia.close();}
            catch (SQLException e)
            {System.out.println("Error cerrando la sentencia" + e.getMessage());}
        }
        if (conexion != null) {
            try {conexion.close();}
            catch (SQLException e) {
                System.out.println("Error cerrando la conexion" + e.getMessage());
            }
        }
    }%>
