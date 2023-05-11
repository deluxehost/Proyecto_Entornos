<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html>
<head>
<style>
* {
  margin: 0px;
  padding: 0px;
}

body {
margin: 0;
padding: 0;
background-color: #f5f5f5;
font-family: Arial, sans-serif;
text-align: center;
}

img{
 width:auto;
 height:100px;
 border:2px ;
}

.contenedor-imagen {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  overflow: hidden;
  margin: 20px;
  box-shadow: 0px 0px 6px 0px rgba(0, 0, 0, 0.5);
  cursor: pointer;
  transition: 400ms;
  margin-left:auto;
  margin-right:auto;
}

.contenedor-imagen > img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.container {
 display: inline-block;
 align-items: center;
 justify-content: center;
 height: auto;
 padding: 20px;
 width: 30%;
}

.login {
 background-color: #f1ffc4;
 border-radius: 10px;
 padding: 20px;
 box-shadow: 0 0 10px rgba(0,0,0,0.3);
}
.login-empleado {
 background-color: #c6e2e9;
 border-radius: 10px;
 padding: 20px;
 box-shadow: 0 0 10px rgba(0,0,0,0.3);
}
h1 {
 text-align: center;
 color: #333333;
 margin-bottom: 20px;
}
 label {
 display: block;
 margin-bottom: 10px;
 color: #666666;
 font-weight: bold;
}
.info {
 display: block;
 height: 25px;
 width: 50%;
 margin: 20px;
 margin-left:auto;
 margin-right:auto;
 border: 2px solid #cccccc;
 color: #333333;
}
button {
 padding-top: 5px;
 background-color: #4CAF50;
 color: white;
 border: none;
 border-radius: 5px;
 padding: 10px 20px;
 font-size: 16px;
 cursor: pointer;
}
button:hover {
 background-color: #3e8e41;
}

.empleado{
background-color:blue;
}
</style>
</head>
<body>

		<xsl:for-each select="hoteles/usuarios/user">
		<xsl:sort select="Contraseña"/>
		  <xsl:choose>
    		<xsl:when test="@tipo = 'empleado'">
	<div class="container">
		<div class="login-empleado">
			<h1>Iniciar sesión</h1>
			<div class="contenedor-imagen">
		        <img>
					<xsl:attribute name="src">
					<xsl:value-of select="imagen"/>
					</xsl:attribute>
				</img>
    		</div>
				<label>Usuario tipo <xsl:value-of select="@tipo"/></label>
				<label>Codigo de usuario:</label>
				<p class="info"><xsl:value-of select="Cod_Usu"/></p>
	            <label>Correo:</label>
	            <p class="info"><xsl:value-of select="Correo"/></p>
				<label>Contraseña:</label>
				<p class="info"><xsl:value-of select="Contraseña"/></p>
				<label>Codigo del hotel:</label>
				<p class="info"><xsl:value-of select="Id_hotel"/></p>
				<button type="submit">Ingresar</button>
			</div>
		</div>
			
	 </xsl:when>	
	
	  <xsl:otherwise>	
	  	<div class="container">
		<div class="login">
			<h1>Iniciar sesión</h1>
			<div class="contenedor-imagen">
		        <img>
					<xsl:attribute name="src">
					<xsl:value-of select="imagen"/>
					</xsl:attribute>
				</img>
    		</div>
				<label>Usuario tipo <xsl:value-of select="@tipo"/></label>
				<label>Codigo de usuario:</label>
				<p class="info"><xsl:value-of select="Cod_Usu"/></p>
	            <label>Correo:</label>
	            <p class="info"><xsl:value-of select="Correo"/></p>
				<label>Contraseña:</label>
				<p class="info"><xsl:value-of select="Contraseña"/></p>
				<label>Codigo del hotel:</label>
				<p class="info"><xsl:value-of select="Id_hotel"/></p>
				<button type="submit">Ingresar</button>
			</div>
		</div>
	  </xsl:otherwise>
	</xsl:choose>	

		</xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

