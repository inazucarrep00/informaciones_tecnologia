  %   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    @  )  winspool  HP LaserJet 1100 (MS)  LPT1:                                                  �HP LaserJet 1100 (MS)            � C�  �4d   X  X  A4                                                            ����                DINU" �   7#�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          �   SMTJ     � H P   L a s e r J e t   1 1 0 0   ( M S )   InputBin Option1 RESDLL UniresDLL Orientation PORTRAIT Resolution Option1 PaperSize LETTER Economode Option1 RET Option1 Halftone HT_PATSIZE_AUTO                                                       �DRIVER=winspool
DEVICE=HP LaserJet 1100 (MS)
OUTPUT=LPT1:
ORIENTATION=0
PAPERSIZE=1
ASCII=1
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=600
COLOR=1
YRESOLUTION=600
TTOPTION=3
COLLATE=1
                                     orders_viewpres3.pres_id       orders_viewpres3.cuotavenc                                                                     Arial                          "999"                          *round(orders_viewpres3.monsinint,redondeo)                                                     Arial                          "9,999,999.99"                 (round(orders_viewpres3.intxdia,redondeo)                                                       Arial                          "999,999.99"                   "round(orders_viewpres3.moraxdia,2)                                                             Arial                          
"9,999.99"                     "@I"                           Arial                                                         "Cuotas Vencidas:"             "@I"                           Arial                                                         "Capital                  :"                                    "@I"                           Arial                                                         "Interes                  : "                                   "@I"                           Arial                                                         "Mora                      :"                                   Y"Capital pendte. despues del pago: "+trans(orders_viewpres3.resadeudado,"999,999,999.99")                                       Arial                          "@I"                           Arial                          
"Fecha  "                     date()                                                        Arial                          orders_viewpres3.company_name                                                                  Arial                          orders_viewpres3.descrip                                      Arial                          #"PRESTAMO "+tipoprestamo.des_tipres                                                            Arial                          #'RNC  '+alltrim(cod_Seq.nro_tribut)                                                            Arial                          :"Numero "+Trans(VAL(orders_viewpres3.pres_id),"@L 999999")                                     Arial                          cod_Seq.Empresa                                               Bookman Old Style              "@I"                           Verdana                        " Comprobante de Pago"         "@I"                           Arial                                                         "DETALLE DEL PAGO"             Courier New                    Arial                          Arial                          Arial                          Bookman Old Style              Verdana                        dataenvironment                �Left = 202
Top = 17
Width = 443
Height = 418
AutoOpenTables = .F.
AutoCloseTables = .F.
InitialSelectedAlias = "orders_viewpres3"
Name = "Dataenvironment"
                                PROCEDURE Destroy
this.CloseTables
ENDPROC
PROCEDURE Init
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
           ����    �  �                        �   %         f     8          �  U   
 ��  � � U  THIS CLOSETABLESj ��  � � %�C� Project Manager���_ �6 �C�Q� Samples\Tastrade\� forms\getinv4�J�  �� �� � � forms\getinv4J�  �� � T� ��  � �� %�� ��S� T� ��  � �� T� ��  � �� ��C� � �� T� �� � 
�� %�� 
��O�S ��C�, No hay informaci�n disponible para imprimir.�0� Modulo de Facturaci�n�x�� ��C� � �� � � <�  �	 B�� �� U	  LOGETINVOICE
 LLCONTINUE FORMS LRETVAL CFACTURA DFECHA THIS
 OPENTABLES CLOSETABLES Destroy,     �� InitP     ��1 � 2 � �b� �A � � !� 3� A A q � 3                       #         >         )   �                                               cursor                        �Left = 339
Top = 34
Width = 91
Height = 90
Alias = "cod_seq"
Database = ..\data\tastrade.dbc
CursorSource = "cod_seq"
Name = "Cursor2"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            V  ..\include\tastrade.hk�C ..\include\foxpro.hΪ
+ ..\include\strings.hx�[D           cursor                         �Left = 200
Top = 48
Width = 91
Height = 90
Alias = "paises"
Database = ..\data\tastrade.dbc
CursorSource = "paises"
Name = "Cursor6"
                      cursor                         �Left = 332
Top = 158
Width = 91
Height = 90
Alias = "pagotiempo"
Database = ..\data\tastrade.dbc
CursorSource = "pagotiempo"
Name = "Cursor5"
             cursor                         �Left = 25
Top = 39
Width = 159
Height = 324
Alias = "orders_viewpres3"
Database = ..\data\tastrade.dbc
CursorSource = "orders viewpres3"
Name = "Cursor1"
                                  cursor                         �Left = 208
Top = 173
Width = 106
Height = 156
Alias = "tipoprestamo"
Database = ..\data\tastrade.dbc
CursorSource = "tipoprestamo"
Name = "Cursor3"
       relation                       �ParentAlias = "orders_viewpres3"
RelationalExpr = "tipres_id"
ChildAlias = "tipoprestamo"
ChildOrder = "tipres_id"
Name = "Relation1"
                         