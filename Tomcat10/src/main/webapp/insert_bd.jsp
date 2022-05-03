<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rpg Card Generator</title>
 <link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
<%// variables per fer la connexio:
	String user="usr_generic";
	String password="Thico@2020";
	String host="localhost";
	String db = "m8_cartes";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;
	
	
	// recollim valors formulari:
	String nom=request.getParameter("nom");
	String race=request.getParameter("race");
	String picture=request.getParameter("picture");
	String fue=request.getParameter("fue");
	int nfue=Integer.parseInt(fue);
	String des=request.getParameter("des");
	int ndes=Integer.parseInt(des);
	String con=request.getParameter("con");
	int ncon=Integer.parseInt(con);
	String intt=request.getParameter("int");
	int nint=Integer.parseInt(intt);
	String sab=request.getParameter("sab");
	int nsab=Integer.parseInt(sab);
	String car=request.getParameter("car");
	int ncar=Integer.parseInt(car);
	String pv=request.getParameter("pv");
	int npv=Integer.parseInt(pv);
	String pm=request.getParameter("pm");
	int npm=Integer.parseInt(pm);


try{

	Class.forName("com.mysql.jdbc.Driver").newInstance ();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
int i=statement.executeUpdate("insert into cartes(nombre,imagen,raza,fuerza,destreza,constitucion,inteligencia,sabiduria,carisma,pv,pm)values('"+nom+"','"+picture+"','"+race+"',"+nfue+","+ndes+","+ncon+","+nint+","+sab+","+car+","+pv+","+pm+")");
out.println("Data is successfully inserted! <div style='width: 200px; border-radius: 3px;text-align: center;clear: both;padding: 10px;background-color: #667481;cursor: pointer;'><a href='index.jsp'>Inici</a></div>");
}catch(SQLException error) {
out.print("Error de Conexión : "+error.toString());
} %>
