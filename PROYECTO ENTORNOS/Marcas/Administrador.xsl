<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
<xsl:template match="*">
    <html>
    <head>
    <style>
        body{
            background-color: white-smoke;
            text-align: center;
        }
        h1{
            background: linear-gradient(IndianRed,FireBrick);
            -webkit-background-clip: text;
            color: transparent;
            text-align: center;
        }
        h3{
            background: linear-gradient(yellow,red);
            -webkit-background-clip: text;
            color: transparent;
            text-align: center;
        }
        img{
            widht: 120px;
            height: 100px;
        }
        <xsl:comment>Tabla del hotel, empleados y usuarios</xsl:comment>
        table{
            border: 1px solid black;
            text-align: center;
            align-items: center;
            widht: 120px;
            height: 80px;
            padding: 20px;
        }
        .tr1{
            background-color: #5DADE2;
            text-align: center;
        }
        .tr2{
            background-color: #D6EAF8;
            text-align: center;
        }
        td{
            padding: 10px;
        }
        .td1{
            widht: 60px;
        }
        .td2{
            widht: 120px;
        }
        
    </style>
    </head>
    <body>
    <h1>HOTELES</h1>
    <xsl:for-each select="/hoteles/hotel">
        <xsl:sort select="nombre"/>
        <h3><b><xsl:value-of select="nombre"/></b></h3>
        <center><img>
        <xsl:attribute name="src">
            <xsl:value-of select="imagen"/>
        </xsl:attribute>
        </img></center>
        <center><table style="padding-top=20px;">
        <tr class="tr1">
            <td class="td1">
                Características
            </td>
            <td class="td2">
                País
            </td>
        </tr>
        <tr class="tr2">
            <td>
                <xsl:value-of select="caracteristicas"/>
            </td>
            <td>
                <xsl:value-of select="pais"/>
            </td>
        </tr>
        </table></center>
        <br/>
        El numero de empleados del hotel "<xsl:value-of select="nombre"/>" es de: <xsl:value-of select="count(//usuarios/user[@tipo='empleado'])"/>
        <br/>
        Los datos de los empleados del hotel <xsl:value-of select="nombre"/> son:
        

        <center><table style="padding-top=20px;">
            <tr class="tr1">
                <td>Nombre</td>
                <td>Apellido</td>
                <td>Cod_Empleado</td>
                <td>Cod_Hotel</td>
                <td>Telefono</td>
                <td>Salario</td>
            </tr>
            <xsl:for-each select="//user[@tipo='empleado']/datos">
            <tr class="tr2">
                <td><xsl:value-of select="NOMBRE"/></td>
                <td><xsl:value-of select="APELLIDO"/></td>
                <td><xsl:value-of select="COD_EMPLE"/></td>
                <td><xsl:value-of select="COD_HOTEL"/></td>
                <td><xsl:value-of select="TELEFONO"/></td>
                <td><xsl:value-of select="SALARIO"/></td>
            </tr>
            </xsl:for-each> 
        </table></center>
        
    </xsl:for-each>
    <h3>USUARIOS</h3>
    El numero de usuarios registrados en el software es de: <xsl:value-of select="count(/hoteles/usuarios/user)"/>
    <br/>
    Los datos de los registrados son los siguientes:
    <xsl:for-each select="//usuarios">
        <xsl:sort select="Cod_Usu"/>
        <center><table style="padding-top=20px;">
        <tr class="tr1">
            <td>Código</td>
            <td>Contraseña</td>
            <td>Correo</td>
            <td>Id_hotel</td>
            <td>Tipo</td>
        </tr>
        <xsl:for-each select="//user">
        <tr class="tr2">
            <td><xsl:value-of select="Cod_Usu"/></td>
            <td><xsl:value-of select="Contraseña"/></td>
            <td><xsl:value-of select="Correo"/></td>
            <td><xsl:value-of select="Id_hotel"/></td>
            <td><xsl:value-of select="@tipo"/></td>
        </tr>
        </xsl:for-each>
        </table></center>
    </xsl:for-each>
    
    </body>
    </html>
    </xsl:template>
</xsl:stylesheet>