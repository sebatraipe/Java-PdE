<%--
  Created by IntelliJ IDEA.
  User: sebastian
  Date: 07/07/2022
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Libros</title>
</head>
<body>
<%
    Connection conexion = null;
    Statement sentencia = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        /*
        * Crea un objeto conexión y un objeto sentencia.
        * */
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/arquitecturajava", "root", "");
        sentencia = conexion.createStatement();

        /*
        * Crea una consulta SQL de selección para todos los libros de la tabla.
        * */
        String consultaSQL = "select isbn, titulo, categoria from Libros";

        /*
        * Ejecuta la sentencia con su SQL.
        * Devuelve un ResultSet con todos los registros.
        * */
        rs = sentencia.executeQuery(consultaSQL);

        /*
        * Recorre el ResultSet y lo imprime en html.
        * */
        while (rs.next()) { %>
            <%=rs.getString("isbn")%>
            <%=rs.getString("titulo")%>
            <%=rs.getString("categoria")%>
            <br/>
        <% }

    } catch (ClassNotFoundException e) {
        System.out.println("Error en la carga del driver " + e.getMessage());
    } catch (SQLException e) {
        System.out.println("Error accediendo a la base de datos" + e.getMessage());
    } finally {

        /*
        * Cierra los recursos(conexión, sentencia, etc).
        * */
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                System.out.println("Error cerrando el resultset" + e.getMessage());
            }
        }

        if (sentencia != null) {
            try {
                sentencia.close();
            } catch (SQLException e) {
                System.out.println("Error cerrando la sentencia" + e.getMessage());
            }
        }

        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error cerrando la conexion" + e.getMessage());
            }
        }
}
%>
<a href="FormularioLibro.jsp">Insertar Libro</a>
</body>
</html>
