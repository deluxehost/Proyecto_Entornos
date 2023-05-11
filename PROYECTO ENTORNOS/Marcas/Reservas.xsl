<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:date="http://exslt.org/dates-and-times" version="2.0">
  <xsl:template match="/">
    <html>
      <head>
        <style type="text/css">
          @import url('https://fonts.googleapis.com/css?family=Montserrat');         
          h1{
          color: blue;
          text-align: center;
          font-weight: bold;
          text-decoration: green wavy underline;
          }
          #tr1{
          weight: 30%;
          text-align: center;
          font-weight: bold;
          font-size: 120%;
          
          }
          .td1{
          background-color red;
          border: 2px;
          }
          td{
          text-align: center;
          }
        </style>
      </head>
      <body>
        <h1>RESERVAS</h1>
        <table>
          <tr id="tr1">
            <td  class="td1">Codigo de Reserva</td>
            <td  class="td1">Numero Habitaciones</td>
            <td  class="td1">Fecha de Devolucion</td>
          </tr>
          <xsl:for-each select="/hoteles/usuarios/user/reservas">
          	<xsl:sort select="Fech_Dev" data-type="date"/>
            <tr>
              <td ><xsl:value-of select="Cod_Reserva"/></td>
              <td><xsl:value-of select="Num_Habitacion"/></td>
               <xsl:choose>
                  <xsl:when test="Fech_Dev &lt; current-date()">
                    <td style="color:red;" ><xsl:value-of select="Fech_Dev"/></td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td style="color:green;"><xsl:value-of select="Fech_Dev"/></td>
                  </xsl:otherwise>
                </xsl:choose>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>