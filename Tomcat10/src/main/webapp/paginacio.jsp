<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Rpg Card Generator</title>
 <link rel="stylesheet" href="css/pag.css">
 
</head>
<h1 class="titol">Visualitzar cartes</h1>
<div class="button button-credits"><a href="index.jsp">Inici</a></div>
<br><br>
<%//  variables per fer la connexio:
	String user="usr_generic";
	String password="Thico@2020";
	String host="localhost";
	String db = "m8_cartes";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	Statement num_registres=null;
	ResultSet rs = null;
	ResultSet num_reg=null;
	int inicio;
	
	//Limito la busqueda
	int TAMANO_PAGINA = 4;

	//examino la página a mostrar y el inicio del registro a mostrar
	String pag = request.getParameter("pagina");
	//int pagina = 0;
	int pagina=Integer.parseInt(pag);
	if (pagina==0) {
	   	inicio = 0;
	    pagina=1;
	}
	else {
	    inicio = (pagina - 1) * TAMANO_PAGINA;
	}

	/**
	//miro a ver el número total de campos que hay en la tabla con esa búsqueda
**/
Class.forName("com.mysql.jdbc.Driver").newInstance ();
conn = DriverManager.getConnection(url, user, password);
num_registres = conn.createStatement();
//inmediatamente hacemos una consulta sencilla
//creamos la consulta
num_reg = num_registres.executeQuery("SELECT * FROM cartes");
int num_total_registros=0;
while(num_reg.next()) {
	num_total_registros++;
}

//calculo el total de páginas
int total_paginas = (int)Math.ceil(((double)num_total_registros/ TAMANO_PAGINA));

//pongo el número de registros total, el tamaño de página y la página que se muestra

out.print("Nombre de registres trobats:"+num_total_registros+"<br>");
out.print("Es mostren pàgines de "+TAMANO_PAGINA+" registres cadascuna<br>");
out.print("Mostrant la pàgina "+pagina+" de "+total_paginas+"<p><br>");




//out.print("<a href=VisualitzarCartes.jsp?pagina=2>"+2+"</a> ");
if (total_paginas > 1){
    for (int i=1;i<=total_paginas;i++){
       if (pagina == i)
          //si muestro el índice de la página actual, no coloco enlace
          out.print(pagina);
       else
          //si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
          out.print(" <a href=paginacio.jsp?pagina="+i+">"+i+"</a> ");
    }
}
out.print("<br><br>");%>
<div style="display: flex; flex-direction: row; flex-wrap: wrap; margin-left: 10%;">
<%
try{

	Class.forName("com.mysql.jdbc.Driver").newInstance ();
	conn = DriverManager.getConnection(url, user, password);
	statement = conn.createStatement();
	//inmediatamente hacemos una consulta sencilla
	//creamos la consulta
	String sentence="SELECT * from cartes limit "+inicio+","+TAMANO_PAGINA;
	rs = statement.executeQuery(sentence);
	//leemos la consulta
	while(rs.next()) {
	//mostramos los resultados obtenidos
	//out.println(rs.getString("ID_carta"));
	//String nom=request.getParameter("nom");
	%>
	
	<br>
	

	<div class="divPrincipal" style="width: 30%; border: 1px solid black; margin: 0 3%; margin-bottom: 3%;" >
		<div>
			<h1><%out.print(rs.getString("nombre"));%></h1>
			<p>Tipus <%out.print(rs.getString("raza")); %><br></p>
		</div>
		<img src="images/<%out.print(rs.getString("imagen")); %>.png" style="display: block; margin-left: auto; margin-right: auto; width: 40%;">
		<div>
			FUE:<%out.print(rs.getString("fuerza")); %><br>
			DES:<%out.print(rs.getString("destreza")); %><br>
			CON:<%out.print(rs.getString("constitucion")); %><br>
			INT:<%out.print(rs.getString("inteligencia")); %><br>
			SAB:<%out.print(rs.getString("sabiduria")); %><br>
			CAR:<%out.print(rs.getString("carisma")); %><br>
			<progress id="pv" max="150" value="<%out.print(rs.getString("pv")); %>"></progress>
			<progress id="pm" max="150" value="<%out.print(rs.getString("pm")); %>"></progress>
		</div>
		
	
	

	<br>
	
	<br>
	</div>
	
<% 
	}
	//cerramos la conexión
	rs.close();
	}catch(SQLException error) {
	out.print("Error de Conexión : "+error.toString());
	}  


	
	%>
	
	</div>
