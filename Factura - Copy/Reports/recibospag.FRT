  %   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    s  :  winspool  Microsoft Office Document Image Writer  Microsoft Document Imaging Writer Port:                                ,Microsoft Office Document Imag   � � /       d   ,  ,   Letter                                                                                widm               �          �                                                                                                                                           �DRIVER=winspool
DEVICE=Microsoft Office Document Image Writer
OUTPUT=Microsoft Document Imaging Writer Port:
ORIENTATION=0
PAPERSIZE=259
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=300
COLOR=1
YRESOLUTION=300
                orders_viewpres3.pres_id       orders_viewpres3.cuotavenc                                                                     Arial                          "999"                          orders_viewpres3.cuocapital                                                                    Arial                          "9,999,999.99"                 orders_viewpres3.intxdia                                      Arial                          "999,999.99"                   orders_viewpres3.moradia                                      Arial                          
"9,999.99"                     "@I"                           Arial Narrow                                                  "Cuotas Vencidas   :"          "@I"                           Arial Narrow                                                  "Capital                   :"                                   "@I"                           Arial Narrow                                                  "Interes                   : "                                  "@I"                           Arial Narrow                                                  "Mora                     :"                                    W"Capital pendte. despu�s del pago: "+trans(orders_viewpres3.resadeudado,"9,999,999.99")                                         Arial Narrow                   "@I"                           Arial                          
"Fecha  "                     date()                                                        Arial                          orders_viewpres3.company_name                                                                  Arial                          %"Concepto: "+orders_viewpres3.descrip                                                          Arial                          $"PRESTAMO  "+tipoprestamo.des_tipres                                                           Arial                          #'RNC  '+alltrim(cod_Seq.nro_tribut)                                                            Arial                          :"Numero "+Trans(VAL(orders_viewpres3.pres_id),"@L 999999")                                     Arial                          cod_Seq.Empresa                                               Bookman Old Style              "@I"                           Arial                          " Comprobante de Pago"         "@I"                           Arial                                                         "* DETALLES DEL PAGO *"        totalPagado                                                   Arial                          "9,999,999.99"                 "@I"                           Arial Narrow                                                  "TOTAL PAGADO   : "            Courier New                    "------------------------"                                      Courier New                    "------------------------"                                      totalPagado                    Oorders_viewpres3.cuocapital+ orders_viewpres3.intxdia+ orders_viewpres3.moradia                  0                              Courier New                    Arial                          Arial Narrow                   Arial                          Bookman Old Style              Arial                          Arial Narrow                   dataenvironment                �Left = 202
Top = 17
Width = 443
Height = 418
AutoOpenTables = .F.
AutoCloseTables = .F.
InitialSelectedAlias = "orders_viewpres3"
Name = "Dataenvironment"
                                PROCEDURE Init
#DEFINE C_TASTRADEDIR_LOC	"Samples\Tastrade\"		&& Location of Tastrade, off of HOME()
#INCLUDE "INCLUDE\TASTRADE.H"

*IF !noParam
*   cFactura = _nFac
*   this.OpenTables()
*   noParam = .T.
*   RETURN 
*ENDIF 
*set date to DMY 
*Set point to "."
*set separator to ","

LOCAL loGetInvoice, ;
      llContinue
*IF WEXIST("Project Manager")
  *- assume that TasTrade isn't running, since it closes the Project Manager window
*	DO FORM (HOME() + C_TASTRADEDIR_LOC + "forms\imprimefac") NAME loGetInvoice LINKED
*ELSE
*	DO FORM forms\imprimefac NAME loGetInvoice LINKED
*ENDIF
IF WEXIST("Project Manager")
  *- assume that TasTrade isn't running, since it closes the Project Manager window
	DO FORM (HOME() + C_TASTRADEDIR_LOC + "forms\getinv4") NAME loGetInvoice LINKED
ELSE
	DO FORM forms\getinv4 NAME loGetInvoice LINKED
ENDIF
llContinue = loGetInvoice.lRetVal
IF llContinue
  cFactura = loGetInvoice.cFactura
  dFecha = loGetInvoice.dFecha
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
PROCEDURE Destroy
this.CloseTables
ENDPROC
            cursor                         cursor                         cursor                         �ParentAlias = "orders_viewpres3"
RelationalExpr = "tipres_id"
ChildAlias = "tipoprestamo"
ChildOrder = "tipres_id"
Name = "Relation1"
                        relation                       �Left = 208
Top = 173
Width = 106
Height = 156
Alias = "tipoprestamo"
Database = ..\data\tastrade.dbc
CursorSource = "tipoprestamo"
Name = "Cursor3"
       cursor                         �Left = 25
Top = 39
Width = 159
Height = 324
Alias = "orders_viewpres3"
Database = ..\data\tastrade.dbc
CursorSource = "orders viewpres3"
Name = "Cursor1"
                                  cursor                        �Left = 339
Top = 34
Width = 91
Height = 90
Alias = "cod_seq"
Database = ..\data\tastrade.dbc
CursorSource = "cod_seq"
Name = "Cursor2"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            �Left = 200
Top = 48
Width = 91
Height = 90
Alias = "paises"
Database = ..\data\tastrade.dbc
CursorSource = "paises"
Name = "Cursor6"
                      �Left = 332
Top = 158
Width = 91
Height = 90
Alias = "pagotiempo"
Database = ..\data\tastrade.dbc
CursorSource = "pagotiempo"
Name = "Cursor5"
             V  ..\include\tastrade.h�����Q ..\include\foxpro.h��[�*O ..\include\strings.h��[�*O9\fox     ����    �  �                        �   %         f     8          �  U  j ��  � � %�C� Project Manager���_ �6 �C�Q� Samples\Tastrade\� forms\getinv4�J�  �� �� � � forms\getinv4J�  �� � T� ��  � �� %�� ��S� T� ��  � �� T� ��  � �� ��C� � �� T� �� � 
�� %�� 
��O�S ��C�, No hay informaci�n disponible para imprimir.�0� M�dulo de Facturaci�n�x�� ��C� � �� � � <�  �	 B�� �� U	  LOGETINVOICE
 LLCONTINUE FORMS LRETVAL CFACTURA DFECHA THIS
 OPENTABLES CLOSETABLES 
 ��  � � U  THIS CLOSETABLES Init,     �� Destroy�    ��1 � �b� �A � � !� 3� A A q � 4 � 1                       �        �    /    )   �                  e� U  TASTRADE Befo