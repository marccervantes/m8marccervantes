<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Arrays,java.util.List"%> <!-- per arrays -->
    <%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<title>M8</title>
</head>

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
	
	int fuerza = dausFinal[0];
	int destreza = dausFinal[1];
	int constitucion = dausFinal[2];
	int inteligencia = dausFinal[3] + razaValors[3];
	int sabiduria = dausFinal[4];
	int carisma = dausFinal[5];
	
	int totsPunts[] = {fuerza,destreza,constitucion,inteligencia,sabiduria,carisma};
	
	
%>
<body>
<div class="newCarta">

<h1>JOC DE CARTES </h1>
<p><a href="./index.jsp">Anar a l'inici</a></p>
<p>punts disponibles: <% for (int i = 0; i<totsPunts.length; i++) {
    		out.print(totsPunts[i]+" ");
    	} 
    	%></p>

<form name="dataForm" action="insert_bd.jsp">
	<label for="nom">Nombre de la carta: </label>
	<input type="text" id="nom" name="nom" value="John Smith"><br>
	<label for="race">Raza: </label>
 	<select id="race" name="race">
 		<option value="elf">Elf</option>
 		<option value="nan">Nan</option>
 		<option value="nomos">Nomos</option>
 		<option value="mitjans">Mitjans</option>
 		<option value="semiOrc">Semi-Orc</option>
 		<option value="huma">Huma</option>
 	</select><br>
 	<%
  	int pVida = dau8() * (dausFinal[2] + razaValors[2]);
 	int pMana = ((dausFinal[3] + razaValors[3] + dausFinal[4] + razaValors[4])/2) * dau4();
  	%>
	<input type="hidden" id="picture" name="picture" value="<%= imgPerson %>">
	<input type="hidden" id="pv" name="pv" value="<%= pVida %>">
	<input type="hidden" id="pm" name="pm" value="<%= pMana %>">
	
 	<label for="fue">FUERZA:</label>
 	<select id="fue" name="fue">	
    	<% for (int i = 0; i<totsPunts.length; i++) {
    		out.print("<option id='fue1' value='"+totsPunts[i]+"'>"+totsPunts[i]+"</option>");
    	} 
    	%>  
 	</select>
 	
 	<br />
 	
 	<label for="des">DESTREZA:</label>
 	<select id="des" name="des">
    	<% for (int i = 0; i<totsPunts.length; i++) {
    		out.print("<option value='"+totsPunts[i]+"'>"+totsPunts[i]+"</option>");
    	} 
    	%>
 	</select>
 	
 	<br />
 	
 	<label for="con">CONSTITUCION:</label>
 	<select id="con" name="con">
    	<% for (int i = 0; i<totsPunts.length; i++) {
    		out.print("<option value='"+totsPunts[i]+"'>"+totsPunts[i]+"</option>");
    	} 
    	%>
 	</select>
 	
 	<br />
 	
 	<label for="int">INTELIGENCIA:</label>
 	<select id="int" name="int">
    	<% for (int i = 0; i<totsPunts.length; i++) {
    		out.print("<option value='"+totsPunts[i]+"'>"+totsPunts[i]+"</option>");
    	} 
    	%>
 	</select>
 	
 	<br />
 	
 	<label for="sab">SABIDURIA:</label>
 	<select id="sab" name="sab">
    	<% for (int i = 0; i<totsPunts.length; i++) {
    		out.print("<option value='"+totsPunts[i]+"'>"+totsPunts[i]+"</option>");
    	} 
    	%>
 	</select>
 	
 	<br />
 	
 	<label for="car">CARISMA:</label>
 	<select id="car" name="car">
    	<% for (int i = 0; i<totsPunts.length; i++) {
    		out.print("<option value='"+totsPunts[i]+"'>"+totsPunts[i]+"</option>");
    	} 
    	%>
 	</select>
 	
 	<br />
 	<input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
	  <label for="soyHumano"> Soc huma</label><br>
	  <input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
	  <label for="soyRobot"> Soc Robot</label><br>
  	<input type="submit" value="Submit">
  	
  	<br />
 
 	<input name="ver" type="button" value="Veure la carta / Actualitzar la carta" />
 	<input type="submit" value="Guardar la carta">
</form> 


<script>
function escribe() {
	
    escribir = document.getElementById("table");
    escribir.innerHTML = "";
    
    var race = document.getElementById("race").value;
    var img = 0;
    
    
    const resultatRaza = [];
    
        
    if (race == 'elf') {
    	img = 0;
    	
    	resultatRaza[0] = 0;
    	resultatRaza[1] = 2;
    	resultatRaza[2] = -2;
    	resultatRaza[3] = 0;
    	resultatRaza[4] = 2;
    	resultatRaza[5] = 0;
    	
    	document.getElementById("picture").value = img;
    	
    } else if (race == 'nan') {
    	img = 1;
    	
    	resultatRaza[0] = 0;
    	resultatRaza[1] = 0;
    	resultatRaza[2] = 2;
    	resultatRaza[3] = 0;
    	resultatRaza[4] = 2;
    	resultatRaza[5] = 2;
    	
    	document.getElementById("picture").value = img;
    }
    else if (race == 'nomos') {
    	img = 2;
    	
    	resultatRaza[0] = -2;
    	resultatRaza[1] = 0;
    	resultatRaza[2] = 2;
    	resultatRaza[3] = 0;
    	resultatRaza[4] = 0;
    	resultatRaza[5] = 2;
    	
    	document.getElementById("picture").value = img;
    }
    else if (race == 'mitjans') {
    	img = 3;
    	
    	resultatRaza[0] = -2;
    	resultatRaza[1] = -2;
    	resultatRaza[2] = 0;
    	resultatRaza[3] = 0;
    	resultatRaza[4] = 0;
    	resultatRaza[5] = 0;
    	
    	document.getElementById("picture").value = img;
    }
    else if (race == 'semiOrc') {
    	img = 4;
    	
    	resultatRaza[0] = 2;
    	resultatRaza[1] = 0;
    	resultatRaza[2] = 0;
    	resultatRaza[3] = -2;
    	resultatRaza[4] = 0;
    	resultatRaza[5] = -2;
    	
    	document.getElementById("picture").value = img;
    } else {
    	img = 5;
    	
    	resultatRaza[0] = 0;
    	resultatRaza[1] = 0;
    	resultatRaza[2] = 0;
    	resultatRaza[3] = 0;
    	resultatRaza[4] = 0;
    	resultatRaza[5] = 0;
    	
    	document.getElementById("picture").value = img;
    }
        
    var fue1 = document.getElementById("fue").value;
    var sumaFue1 = (parseInt(fue1) + parseInt(resultatRaza[0]));
    
    var des1 = document.getElementById("des").value;
    var sumaDes1 = (parseInt(des1) + parseInt(resultatRaza[1]));
    
    var con1 = document.getElementById("con").value;
    var sumaCon1 = (parseInt(con1) + parseInt(resultatRaza[2]));
    
    var int1 = document.getElementById("con").value;
    var sumaInt1 = (parseInt(int1) + parseInt(resultatRaza[3]));
    
    var sab1 = document.getElementById("con").value;
    var sumaSab1 = (parseInt(sab1) + parseInt(resultatRaza[4]));
    
    var car1 = document.getElementById("con").value;
    var sumaCar1 = (parseInt(car1) + parseInt(resultatRaza[5]));  
    
  	var dau8 = (Math.random() * 8 + 1) * sumaCon1;
  	var vida2 = Math.round(dau8);    
  	var vida = vida2;
  	document.getElementById("pv").value = vida;

  	
  	var dau4 = (Math.random() * 4 + 1);
    var mana1 = ((sumaInt1 + sumaSab1) / 2) * dau4;  	
    var mana = Math.round(mana1);
    document.getElementById("pm").value = mana;
    

    
    
    html = '<table class="tg">';
    html +=	'<thead>';
    html += '<tr>';
    html += '<td class="tg-0pky" rowspan="9">';
    html += '<img src="images/'+ img +'.png" alt="NPC" width="150" height="200" style="margin-top: 26%;">'
    html += '</td>';
    html += '<th class="tg-0pky">Carac.</th>';
    html += '<th class="tg-0pky">Valor Base.</th>';
    html += '<th class="tg-0pky">Mod.</th>';
    html += '<th class="tg-0pky">Valor Final.</th>';
    html += '</tr>';
    html += '<tr>';
    html += '<td class="tg-0pky">FUE:</td>';
    html += '<td class="tg-0pky">'+ fue1 +'</td>';
    html += '<td class="tg-0pky">'+ resultatRaza[0] +'</td>';
    html += '<td class="tg-0pky">'+ sumaFue1 +'</td>'    
    html += '</tr>';
    html += '<tr>';
    html += '<td class="tg-0pky">DES:</td>';
    html += '<td class="tg-0pky">'+ des1 +'</td>';
    html += '<td class="tg-0pky">'+ resultatRaza[1] +'</td>';
    html += '<td class="tg-0pky">'+ sumaDes1 +'</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td class="tg-0pky">CON:</td>';
    html += '<td class="tg-0pky">'+ con1 +'</td>';
    html += '<td class="tg-0pky">'+ resultatRaza[2] +'</td>';
    html += '<td class="tg-0pky">'+ sumaCon1 +'</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td class="tg-0pky">INT:</td>';
    html += '<td class="tg-0pky">'+ int1 +'</td>';
    html += '<td class="tg-0pky">'+ resultatRaza[3] +'</td>';
    html += '<td class="tg-0pky">'+ sumaInt1 +'</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td class="tg-0pky">SAB:</td>';
    html += '<td class="tg-0pky">'+ sab1 +'</td>';
    html += '<td class="tg-0pky">'+ resultatRaza[4] +'</td>';
    html += '<td class="tg-0pky">'+ sumaSab1 +'</td>';
    html += '</tr>';
    html += '<td class="tg-0pky">CAR:</td>';
    html += '<td class="tg-0pky">'+ car1 +'</td>';
    html += '<td class="tg-0pky">'+ resultatRaza[5] +'</td>';
    html += '<td class="tg-0pky">'+ sumaCar1 +'</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td class="tg-0lax">P.V ('+vida+')</td>';
	html += '<td class="tg-0lax" colspan="3">';
    html += '<progress id="pv" max="150" value="'+vida+'"></progress>';
    html += '</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td class="tg-0lax">P.M ('+mana+')</td>';
    html += '<td class="tg-0lax" colspan="3">';
    html += '<progress id="pm" max="150" value="'+mana+'"></progress>';
    html += '</td>';
    html += '</tr>';
    html += '</thead>';
    html += '</table>';
    
    escribir.innerHTML = html;
    }
    
window.onload = function() {
document.dataForm.ver.onclick = escribe;
} 
</script>

<div id="table"></div>

</div>

</body>
</html>