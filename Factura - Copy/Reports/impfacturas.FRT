  :   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    s  :  winspool  Microsoft Office Document Image Writer  Microsoft Document Imaging Writer Port:                                ,Microsoft Office Document Imag   � � /        d   X  X   Letter                                                                                widm               �          �                                                                                                                                           �DRIVER=winspool
DEVICE=Microsoft Office Document Image Writer
OUTPUT=Microsoft Document Imaging Writer Port:
ORIENTATION=0
PAPERSIZE=1
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=600
COLOR=1
YRESOLUTION=600
                  ordertotal9.grupo              ordertotal9.freight                                           ordertotal9.freight#16         ordertotal9.order_date                                        Arial                          "@D"                           DATE()                         Arial                          "@I"                           Arial                          "P�gina"                       _PAGENO                        Arial                          "@I"                           Arial                          "Fecha"                        "@I"                           Times New Roman                "  Num   Fact."               "@I"                           Times New Roman                "Emitido en"                   "@I"                           Times New Roman                "Total pesos"                  "@I"                           Times New Roman                	"Cliente"                      "@I"                           Times New Roman                "ITBIS pesos"                  customer.company_name                                         Arial                          ordertotal9.order_id                                          Arial                          ordertotal9.impto                                             Arial                          "999,999.99"                   ordertotal9.ordertotal                                        Arial                          "999,999,999.99"               ordertotal9.order_id                                          Times New Roman                "9999"                         "@I"                           Times New Roman                "factura (s)"                  ordertotal9.impto                                             Times New Roman                "999,999.99"                   ordertotal9.ordertotal                                        Times New Roman                "9,999,999,999.99"             R'(Para '+IIF(EMPTY(fDesde),'0',Alltrim(TRANS(fHasta-fDesde+1)))+' dias, en Pesos)'                                              Times New Roman                5'Desde '+DTOC(fDesde)+' Hasta '+allTrim(DTOC(fHasta))                                          Times New Roman                "@I"                           Arial                          ""MPUESTOS     OBRADOS A   ACTURAS"                              Arial                          "I"                            Arial                          "F     "                       Arial                          "C"                            trans(ordertotal9.freight)+"%"                                                                 Arial                          "999.99"                       "@I"                           Times New Roman                "Total General :"              ordertotal9.order_id                                          Times New Roman                "9999"                         "@I"                           Times New Roman                "facturas   con"               ordertotal9.impto                                             Times New Roman                "999,999.99"                   ordertotal9.ordertotal                                        Times New Roman                "9,999,999,999.99"             "@I"                           Times New Roman                	"Total :"                      cod_Seq.departamen                                            Arial                          cod_seq.encab = 'S'            cod_Seq.direccion                                             Arial                          cod_seq.encab = 'S'            cod_Seq.direcc2                                               Arial                          cod_seq.encab = 'S'            #'RNC  '+alltrim(cod_Seq.nro_tribut)                                                            Arial                          cod_seq.encab = 'S'            cod_Seq.direcc3                                               Arial                          cod_seq.encab = 'S'            'Imail: '+cod_seq.imail                                       Arial                          cod_seq.encab = 'S'            cod_seq.imagen                  (c) Microsoft Corporation 1995                                 !cod_seq.nombEmp               cod_Seq.Empresa                                               Bookman Old Style              cod_seq.nombEmp                ordertotal9.nomimpto                                          Arial                          ordertotal9.nomimpto                                          Times New Roman                Courier New                    Arial                          Arial                          Arial                          Times New Roman                Times New Roman                Times New Roman                Arial                          Arial                          Arial                          Arial                          Arial                          Bookman Old Style              dataenvironment                �Left = 202
Top = 18
Width = 256
Height = 295
AutoOpenTables = .F.
AutoCloseTables = .F.
InitialSelectedAlias = "ordertotal9"
Name = "Dataenvironment"
                                     �PROCEDURE Destroy
This.CloseTables
ENDPROC
PROCEDURE Init
#DEFINE C_TASTRADEDIR_LOC	"Samples\Tastrade\"		&& Location of Tastrade, off of HOME()
#INCLUDE "INCLUDE\TASTRADE.H"

set date to DMY 
Set point to "."
set separator to ","

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
*  cVendedor = loGetInvoice.cVendedor 
  this.OpenTables()
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
                 cursor                         cursor                         cursor                         �ParentAlias = "ordertotal9"
RelationalExpr = "customer_i"
ChildAlias = "customer"
ChildOrder = "customer_i"
Name = "Relation1"
                               relation                       �Left = 10
Top = 140
Width = 91
Height = 90
Alias = "customer"
Database = ..\data\tastrade.dbc
CursorSource = "customer"
Name = "Cursor3"
                  �Left = 10
Top = 20
Width = 91
Height = 90
Alias = "ordertotal9"
Database = ..\data\tastrade.dbc
CursorSource = "ordertotal9"
Name = "Cursor2"
            ZLeft = 149
Top = 18
Width = 91
Height = 90
Alias = "cod_seq"
Database = ..\data\tastrade.dbc
CursorSource = "cod_seq"
Name = "Cursor1"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 V  ..\include\tastrade.h�{���Q ..\include\foxpro.h�|[�*O ..\include\strings.h�}[�*O9\fox     	���    �  �                        �Z   %   D      �     c          �  U   
 ��  � � U  THIS CLOSETABLES� G(� DMY� G;(�� .�� G<(�� ,�� �� � � %�C� Project Manager���� �6 �C�Q� Samples\Tastrade\� forms\getinv3�J� �� �� � � forms\getinv3J� �� � T� �� � �� %�� ��w� T� �� � �� T� �� � �� ��C� � �� T� �� � 
�� %�� 
��s�S ��C�, No hay informaci�n disponible para imprimir.�0� M�dulo de Facturaci�n�x�� ��C� �	 �� � � <� �	 B�� �� U
  DMY LOGETINVOICE
 LLCONTINUE FORMS LRETVAL	 DDATEFROM DDATETO THIS
 OPENTABLES CLOSETABLES Destroy,     �� InitP     ��1 � 2 � � � � �b� �A � � !� 3� A A q � 1                       #         >   �      )   �                  FORMS 