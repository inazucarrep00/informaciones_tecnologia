  f   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    s  :  winspool  Microsoft Office Document Image Writer  Microsoft Document Imaging Writer Port:                                ,Microsoft Office Document Imag   � � /        d   X  X   Letter                                                                                widm               �          �                                                                                                                                           �DRIVER=winspool
DEVICE=Microsoft Office Document Image Writer
OUTPUT=Microsoft Document Imaging Writer Port:
ORIENTATION=0
PAPERSIZE=1
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=600
COLOR=1
YRESOLUTION=600
                  grupo                          resumen_prest.tiempo_id        DATE()                         Arial                          "@I"                           Arial                          "P�gina"                       _PAGENO                        Arial                          "@I"                           Arial                          "Fecha"                        R'(Para '+IIF(EMPTY(fDesde),'0',Alltrim(TRANS(fHasta-fDesde+1)))+' dias, en Pesos)'                                              Arial                          5'Desde '+DTOC(fDesde)+' Hasta '+allTrim(DTOC(fHasta))                                          Arial                          "@I"                           Arial                          $"CLASIFICADO POR PERIODO DE CUOTAS"                            "@I"                           Arial                          '"P R E S T A M O S    V E N C I D O S "                         cod_Seq.departamen                                            Arial                          cod_seq.encab = 'S'            cod_Seq.direccion                                             Arial                          cod_seq.encab = 'S'            cod_Seq.direcc2                                               Arial                          cod_seq.encab = 'S'            #'RNC  '+alltrim(cod_Seq.nro_tribut)                                                            Arial                          cod_seq.encab = 'S'            cod_Seq.direcc3                                               Arial                          cod_seq.encab = 'S'            'Imail: '+cod_seq.imail                                       Arial                          cod_seq.encab = 'S'            cod_seq.imagen                  (c) Microsoft Corporation 1995                                 !cod_seq.nombEmp               cod_Seq.Empresa                                               Bookman Old Style              cod_seq.nombEmp                "@I"                           Arial Narrow                   "Capital Aprob."               "@I"                           Arial Narrow                   "Total Pagado"                 "@I"                           Arial Narrow                   "No Prest."                    "@I"                           Arial Narrow                   "Total Gral. >>"               resumen_prest.aprobado                                        Arial                          "99,999,999.99"                resumen_prest.pagado                                          Arial                          "99,999,999.99"                resumen_prest.aprobado                                        Arial                          "9,999,999.99"                 resumen_prest.pagado                                          Arial                          "9,999,999.99"                 resumen_prest.tiempo_desc                                     Arial Narrow                   resumen_prest.pres_id                                         Arial                          "@I"                           Arial Narrow                   	"Per�odo"                      resumen_prest.deliver_by                                      Arial                          "@I"                           Arial Narrow                   
"F-Inicio"                     resumen_prest.propietario                                     Arial Narrow                   "@I"                           Arial Narrow                   "Propietario"                  "@I"                           Arial Narrow                   "Cuotas"                       CTRANS(resumen_prest.secuecuota)+"/"+TRANS(resumen_prest.nro_cuotas)                                                             Arial                          resumen_prest.tasai                                           Arial                          "999.99"                       "@I"                           Arial Narrow                   "Tasa %"                       CTRANS(resumen_prest.secuecuota)+"/"+TRANS(resumen_prest.nro_cuotas)                                                             Arial                          resumen_prest.aprobado                                        Arial                          "99,999,999.99"                resumen_prest.pagado                                          Arial                          "99,999,999.99"                CTRANS(resumen_prest.secuecuota)+"/"+TRANS(resumen_prest.nro_cuotas)                                                             Arial                          9"Total Pr�stamos "+ALLTR(resumen_prest.tiempo_desc)+" >>"                                      Arial Narrow                   resumen_prest.order_date                                      Arial                          "@I"                           Arial Narrow                   "Total Adeudado"               resumen_prest.deuda                                           Arial                          "99,999,999.99"                resumen_prest.deuda                                           Arial                          "999,999.99"                   resumen_prest.deuda                                           Arial                          "99,999,999.99"                "@I"                           Arial Narrow                   	"F-Vence"                      Arial                          "P"                            Arial                          "V"                            Courier New                    Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          Bookman Old Style              Arial Narrow                   Arial Narrow                   Arial Narrow                   Arial                          dataenvironment                �Left = 202
Top = 18
Width = 256
Height = 295
AutoOpenTables = .F.
AutoCloseTables = .F.
InitialSelectedAlias = "resumen_prest"
Name = "Dataenvironment"
                                   �PROCEDURE Destroy
This.CloseTables
ENDPROC
PROCEDURE Init
#DEFINE C_TASTRADEDIR_LOC	"Samples\Tastrade\"		&& Location of Tastrade, off of HOME()
#INCLUDE "INCLUDE\TASTRADE.H"

LOCAL loGetInvoice, ;
      llContinue
IF WEXIST("Project Manager")
	*- assume that TasTrade isn't running, since it closes the Project Manager window
	DO FORM (HOME() + C_TASTRADEDIR_LOC + "forms\getinv3") NAME loGetInvoice LINKED
ELSE
	DO FORM forms\getinv3 NAME loGetInvoice LINKED
ENDIF
llContinue = loGetInvoice.lRetVal
IF llContinue
  dDateFrom = loGetInvoice.dDateFrom
  dDateTo = loGetInvoice.dDateTo
  this.OpenTables()
  *- SET ENVIRONMENT
  formatdate = IIF(cod_seq.tipo_fecha='E','DMY','MDY')
  pointsepar = IIF(VAL(cod_seq.separador)=1,'.',',')
  comasepar = IIF(VAL(cod_seq.separador)=1,',','.') 
  redondeo = cod_seq.redon
  SET DECIMALS TO redondeo
  SET POINT TO pointsepar
  SET separator to comasepar
  SET DATE &formatdate 

  llContinue = !(_tally = 0)
  IF !llContinue
    =MESSAGEBOX(NOTHINGTOPRINT_LOC, ;
                MB_ICONEXCLAMATION, ;
                TASTRADE_LOC)
    this.CloseTables()
  ENDIF
ENDIF
RELEASE loGetInvoice
RETURN llContinue
ENDPROC
                      cursor                         cursor                         cursor                         �Left = 18
Top = 16
Width = 102
Height = 89
Alias = "resumen_prest"
Database = ..\data\tastrade.dbc
CursorSource = "resumen prest"
Filter = "DATE()>deliver_by"
Name = "Cursor2"
           �Left = 25
Top = 133
Width = 91
Height = 90
Alias = "customer"
Database = ..\data\tastrade.dbc
CursorSource = "customer"
Name = "Cursor3"
                 <Left = 134
Top = 16
Width = 91
Height = 90
Alias = "cod_seq"
Database = ..\data\tastrade.dbc
CursorSource = "cod_seq"
Name = "Cursor1"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        V  ..\include\tastrade.h�{���Q ..\include\foxpro.h�|[�*O ..\include\strings.h�}[�*O9\fox     ����    �  �                        �M   %   .      �     M          �  U   
 ��  � � U  THIS CLOSETABLES) ��  � � %�C� Project Manager���_ �6 �C�Q� Samples\Tastrade\� forms\getinv3�J�  �� �� � � forms\getinv3J�  �� � T� ��  � �� %�� ��� T� ��  � �� T� ��  � �� ��C� � ��) T� �C�	 �
 � E�	 � DMY� � MDY6��& T� �CC�	 � g�� � .� � ,6��& T� �CC�	 � g�� � ,� � .6�� T� ��	 � �� G(�� �� G;(�� �� G<(�� �� SET DATE &formatdate 
 T� �� � 
�� %�� 
���S ��C�, No hay informaci�n disponible para imprimir.�0� M�dulo de Facturaci�n�x�� ��C� � �� � � <�  �	 B�� �� U  LOGETINVOICE
 LLCONTINUE FORMS LRETVAL	 DDATEFROM DDATETO THIS
 OPENTABLES
 FORMATDATE COD_SEQ
 TIPO_FECHA
 POINTSEPAR	 SEPARADOR	 COMASEPAR REDONDEO REDON CLOSETABLES Destroy,     �� InitP     ��1 � 2 � �b� �A � � �aa� � � �"� 3� A A q � 1                       #         >   �      )   �                  LL
 ACTIVEFORM PARENT
 WIN