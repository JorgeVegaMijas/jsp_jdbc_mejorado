<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%--
  Created by IntelliJ IDEA.
  User: jorge
  Date: 20/11/23
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Consulta Socio</title>
</head>
<body>
    <h1>Datos Socio</h1>
    <%
        //TODO

        //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
        //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER, no deprecado
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root", "root");

        //UTILIZAR STATEMENT SÓLO EN QUERIES NO PARAMETRIZADAS.
        Statement s = conexion.createStatement();
        ResultSet listado = s.executeQuery ("SELECT * FROM socio");

        while (listado.next()) {
            out.println(listado.getString("socioID") + " " + listado.getString ("nombre") + "<br>");
        }
        listado.close();
        s.close();
        conexion.close();
    %>
</body>
</html>
