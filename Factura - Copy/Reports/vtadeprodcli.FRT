  V   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    s  :  winspool  Microsoft Office Document Image Writer  Microsoft Document Imaging Writer Port:                                ,Microsoft Office Document Imag   � � /        d   X  X   Letter                                                                                widm               �          �                                                                                                                                           �DRIVER=winspool
DEVICE=Microsoft Office Document Image Writer
OUTPUT=Microsoft Document Imaging Writer Port:
ORIENTATION=0
PAPERSIZE=1
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=600
COLOR=1
YRESOLUTION=600
                  grupo                          ordertotal8.customer_id        DATE()                         Arial                          "@I"                           Arial                          "P�gina"                       _PAGENO                        Arial                          "@I"                           Arial                          "Fecha"                        "@I"                           Times New Roman                "Total General:"               R'(Para '+IIF(EMPTY(fDesde),'0',Alltrim(TRANS(fHasta-fDesde+1)))+' dias, en Pesos)'                                              Times New Roman                >'Facturas desde '+DTOC(fDesde)+' hasta '+allTrim(DTOC(fHasta))                                                                  Times New Roman                "@I"                           Times New Roman                "POR CLIENTE"                  "@I"                           Arial                          $"ISTADO  DE    ENTAS DE    RODUCTOS"                            Arial                          "L"                            Arial                          "V "                           customer.company_name                                         Times New Roman                "@I"                           Times New Roman                "Cliente:"                    "@I"                           Times New Roman                "Total productos :"            venta                                                         Arial                          "999,999,999.99"               venta                                                         Times New Roman                "999,999,999.99"               product_name                                                  Times New Roman                ,iif(cod_seq.impartvis,product_id, cod_fabri)                                                   Times New Roman                
unit_price                                                    Times New Roman                "9,999,999.99"                 undven                                                        Times New Roman                "999,999.99"                   venta                                                         Times New Roman                "99,999,999.99"                "@I"                           Times New Roman                " Codigo Prod. "              "@I"                           Times New Roman                
"Producto"                     "@I"                           Times New Roman                	" Precio"                      "@I"                           Times New Roman                
"Subtotal"                     "@I"                           Times New Roman                
"Cantidad"                     Arial                          "P  "                          "@I"                           Times New Roman                "(No incluye impuestos)"       "@I"                           Times New Roman                "Subtotal en pesos:"           
product_id                                                    Times New Roman                
product_id                                                    Times New Roman                "@I"                           Times New Roman                "Subtotal en pesos:"           cod_Seq.departamen                                            Arial                          cod_seq.encab = 'S'            cod_Seq.direccion                                             Arial                          cod_seq.encab = 'S'            cod_Seq.direcc2                                               Arial                          cod_seq.encab = 'S'            #'RNC  '+alltrim(cod_Seq.nro_tribut)                                                            Arial                          cod_seq.encab = 'S'            cod_Seq.direcc3                                               Arial                          cod_seq.encab = 'S'            'Imail: '+cod_seq.imail                                       Arial                          cod_seq.encab = 'S'            cod_seq.imagen                  (c) Microsoft Corporation 1995                                 !cod_seq.nombEmp               cod_Seq.Empresa                                               Bookman Old Style              cod_seq.nombEmp                Courier New                    Arial                          Arial                          Times New Roman                Times New Roman                Times New Roman                Arial                          Arial                          Arial                          Arial                          Arial                          Bookman Old Style              dataenvironment                �Left = 202
Top = 18
Width = 256
Height = 295
AutoOpenTables = .F.
AutoCloseTables = .F.
InitialSelectedAlias = "ordertotal8"
Name = "Dataenvironment"
                                     lPROCEDURE Init
#DEFINE C_TASTRADEDIR_LOC	"Samples\Tastrade\"		&& Location of Tastrade, off of HOME()
#INCLUDE "INCLUDE\TASTRADE.H"
LOCAL loGetInvoice, ;
      llContinue
IF WEXIST("Project Manager")
	*- assume that TasTrade isn't running, since it closes the Project Manager window
	DO FORM (HOME() + C_TASTRADEDIR_LOC + "forms\getinv") NAME loGetInvoice LINKED
ELSE
	DO FORM forms\getinv NAME loGetInvoice LINKED
ENDIF
llContinue = loGetInvoice.lRetVal
IF llContinue
  dDateFrom = loGetInvoice.dDateFrom
  dDateTo = loGetInvoice.dDateTo
*  cVendedor = loGetInvoice.cVendedor 
  IF UPPER(cVendedor) = "TODOS"
     this.cursor2.Filter = NULL  
  ELSE
     this.cursor2.Filter = "UPPER(Customer_id) = UPPER(cVendedor)"  
  ENDIF
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
PROCEDURE Destroy
This.CloseTables
ENDPROC
                             cursor                         cursor                         cursor                         �ParentAlias = "ordertotal8"
RelationalExpr = "customer_id"
ChildAlias = "customer"
ChildOrder = "customer_i"
Name = "Relation1"
                              relation                       �Left = 10
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
Alias = "ordertotal8"
Database = ..\data\tastrade.dbc
CursorSource = "ordertotal8"
Name = "Cursor2"
            �Left = 123
Top = 22
Width = 91
Height = 90
Alias = "cod_seq"
Database = ..\data\tastrade.dbc
CursorSource = "cod_seq"
Name = "Cursor1"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              V  ..\include\tastrade.h�{���Q ..\include\foxpro.h�|[�*O ..\include\strings.h�}[�*O9\fox     ����    u  u                        �l   %   �        $   �          �  U  � ��  � � %�C� Project Manager���^ �5 �C�Q� Samples\Tastrade\� forms\getinv�J�  �� � � � forms\getinvJ�  �� � T� ��  � �� %�� ��}� T� ��  � �� T� ��  � �� %�C� f� TODOS��� � T� � �	 ���� �)�8 T� � �	 ��% UPPER(Customer_id) = UPPER(cVendedor)�� � ��C� �
 ��) T� �C� � � E�	 � DMY� � MDY6��& T� �CC� � g�� � .� � ,6��& T� �CC� � g�� � ,� � .6�� T� �� � �� G(�� �� G;(�� �� G<(�� �� SET DATE &formatdate 
 T� �� � 
�� %�� 
��y�S ��C�, No hay informaci�n disponible para imprimir.�0� M�dulo de Facturaci�n�x�� ��C� � �� � � <�  �	 B�� �� U  LOGETINVOICE
 LLCONTINUE FORMS LRETVAL	 DDATEFROM DDATETO	 CVENDEDOR THIS CURSOR2 FILTER
 OPENTABLES
 FORMATDATE COD_SEQ
 TIPO_FECHA
 POINTSEPAR	 SEPARADOR	 COMASEPAR REDONDEO REDON CLOSETABLES 
 ��  � � U  THIS CLOSETABLES Init,     �� Destroy�    ��1 � �R� �A � �� �A � �aa� � � �"� 3� A A q � 2 � 1                       3     "   Q  a  ,    )   u                  DER_DATE ORDE