<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Arrays,java.util.List"%> <!-- per arrays -->
    <%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>M8-captcha</title>
</head>
<body>
<%!public int dau() {
	int valor = 0;

	int img = (int) (Math.random() * 6);

	int daus [] = {0,0,0,0};

	// DAU1
	for (int i = 0; i<daus.length; i++) {
		daus[i] = (int) (Math.random() * 6 +1);
	}
	
	Arrays.sort(daus);

	for (int i = 1; i<daus.length; i++) {
		valor=valor+daus[i];
	}
	
	return valor;
}

	int imgPerson = 0;
	String nomPerson = "";
	
	public int[] razaModificador (int num) {
		int resultatRaza[] = {0,0,0,0,0,0};
		
		
		switch(num) {		
		
		    case 0 : //elf
		    	int resultatRaza0[] = {0,2,-2,0,2,0};
		    	imgPerson = 0;
		    	nomPerson = "Elf";
		      
		    	return resultatRaza0;
			
		    case 1 : //nans
		    	int resultatRaza1[] = {0,0,2,0,2,2};
		    	imgPerson = 1;
		    	nomPerson = "Nan";
			      
		    	return resultatRaza1;
		    	
		    case 2 : //nomos
		    	int resultatRaza2[] = {-2,0,2,0,0,2};
		    	imgPerson = 2;
		    	nomPerson = "Nomos";
			      
		    	return resultatRaza2;
		    	
		    case 3 : //mitjans
		    	int resultatRaza3[] = {-2,2,0,0,0,0};
		    	imgPerson = 3;
		    	nomPerson = "Mitjans";
			      
		    	return resultatRaza3;
		    	
		    case 4 : //semiorc
		    	int resultatRaza4[] = {2,0,0,-2,0,-2};
		    	imgPerson = 4;
		    	nomPerson = "Semi-Orc";
			      
		    	return resultatRaza4;
			
			default: //huma
				imgPerson = 5;
				nomPerson = "Huma";
			
				return resultatRaza;
				
		}
	}
	
	public int dau4() {

		return (int) (Math.random() * 4 + 1);

	}
	
	public int dau8() {

		return (int) (Math.random() * 8 + 1);

	}

	

%>

<%
		
	int dausFinal [] = {0,0,0,0,0,0};

	for (int i = 0; i<dausFinal.length; i++){
		dausFinal[i] = dau();
	}
	
	int razaValors[] = razaModificador((int) (Math.random() * 6));
	
	
	




%>
<a href="./index.jsp">Torna enrera</a> 

<h1><%= nomPerson %></h1>
<table class="tg">
<thead>
  <tr>
    <td class="tg-0pky" rowspan="9">
    	 <img src="images/<%=imgPerson %>.png" alt="NPC" width="150" height="200" style="margin-top: 26%;"> 
    </td>
    <th class="tg-0pky">Carac.</th>
    <th class="tg-0pky">Valor Base.</th>
    <th class="tg-0pky">Mod.</th>
    <th class="tg-0pky">Valor Final.</th>
  </tr>
  <tr>
    <td class="tg-0pky">FUE:</td>
    <td class="tg-0pky"><%=dausFinal[0] %></td>
    <td class="tg-0pky"><%=razaValors[0] %></td>
    <td class="tg-0pky"><%=dausFinal[0] + razaValors[0]%></td>
  </tr>
  <tr>
    <td class="tg-0pky">DES:</td>
    <td class="tg-0pky"><%=dausFinal[1] %></td>
    <td class="tg-0pky"><%=razaValors[1] %></td>
    <td class="tg-0pky"><%= dausFinal[1] + razaValors[1]%></td>
  </tr>
  <tr>
    <td class="tg-0pky">CON:</td>
    <td class="tg-0pky"><%=dausFinal[2] %></td>
    <td class="tg-0pky"><%=razaValors[2] %></td>
    <td class="tg-0pky"><%=dausFinal[2] + razaValors[2]%></td>
    </tr>
  <tr>
    <td class="tg-0pky">INT:</td>
    <td class="tg-0lax"><%=dausFinal[3] %></td>
    <td class="tg-0lax"><%=razaValors[3] %></td>
    <td class="tg-0lax"><%=dausFinal[3] + razaValors[3]%></td>
  </tr>
  <tr>
    <td class="tg-0lax">SAB:</td>
    <td class="tg-0lax"><%=dausFinal[4] %></td>
    <td class="tg-0lax"><%=razaValors[4] %></td>
    <td class="tg-0lax"><%=dausFinal[4] + razaValors[4]%></td>
  </tr>
  <tr>
    <td class="tg-0lax">CAR:</td>
    <td class="tg-0lax"><%=dausFinal[5] %></td>
    <td class="tg-0lax"><%=razaValors[5] %></td>
    <td class="tg-0lax"><%=dausFinal[5] + razaValors[5]%></td>
  </tr>
  <%
  	int pVida = dau8() * (dausFinal[2] + razaValors[2]);
  %>
  <tr>
    <td class="tg-0lax">P.V (<%= pVida %>)</td>
    <td class="tg-0lax" colspan="3">
    	<progress id="vida" max="150" value="<%= pVida %>"></progress>
    </td>
  </tr>
  <%
  	int mitjana = ((dausFinal[3] + razaValors[3] + dausFinal[4] + razaValors[4])/2) * dau4();
  %>
  <tr>
    <td class="tg-0lax">P.M (<%= mitjana %>)</td>
    <td class="tg-0lax" colspan="3">
    	<progress id="mana" max="150" value="<%= mitjana %>"></progress>
    </td>
  </tr>
</thead>
</table>
<button class="button">Guardar</button>
</body>
</html>