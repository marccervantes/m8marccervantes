<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Arrays,java.util.List"%> <!-- per arrays -->
    <%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/home.css">
<title>M8</title>
</head>
<body>

<!-- <h1>JOC DE CARTES </h1>
  
 <a href="./newCarta.jsp">Generar carta</a>
 <a href="./paginacio.jsp?pagina=1">Veure les cartes</a> -->
 
 <section class="game">
  <section class="screen screen-intro active-screen"> 
    <a href="./newCarta.jsp"><div class="button button-newgame">Nova Carta</div></a>
    <div class="button button-settings"><a href="./paginacio.jsp?pagina=1">Veure les cartes</a></div>
    <div class="button button-credits"><a href="./credits.jsp">Credits</a></div>
  </section>
</section>
 

</body>
</html>