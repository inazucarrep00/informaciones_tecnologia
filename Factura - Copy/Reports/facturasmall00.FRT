  �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=Microsoft Print to PDF
OUTPUT=PORTPROMPT:
ORIENTATION=0
PAPERSIZE=9
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=600
COLOR=2
YRESOLUTION=600
                       G  *  winspool  Microsoft Print to PDF  PORTPROMPT:                                                                        �Microsoft Print to PDF          � P/  	 �
od   X  X  Letter                                                        ����GIS4            DINU" � $,?]{~                                 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �   SMTJ     � { 0 8 4 F 0 1 F A - E 6 3 4 - 4 D 7 7 - 8 3 E E - 0 7 4 8 1 7 C 0 3 5 8 1 }   RESDLL UniresDLL PaperSize LETTER Orientation PORTRAIT Resolution ResOption1 ColorMode Color              ,  V4DM       �
p"   �      �O4�wM��H�5��   L                       *         @   V      D o c u m e n t U s e r P a s s w o r d   D o c u m e n t O w n e r P a s s w o r d   D o c u m e n t C r y p t S e c u r i t y                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Courier New                                                   order_number                                                  "VALOR"                                                       "@I"                                                          Arial                                                         freight                                                       "999.99"                                                                                                                    Arial                                                         0vFreicount > 0 and vImp2=0 and cod_seq.impnomvis              "%"                                                           "@I"                                                                                                                        Arial                                                         0vFreicount > 0 and vImp2=0 and cod_seq.impnomvis              cod_Seq.departamen                                                                                                          Arial                                                         'Res DGII :   '+cod_Seq.direcc2                                                                                             Arial                                                         !empty(cod_Seq.direcc2)                                       #'RNC  '+alltrim(cod_Seq.nro_tribut)                                                                                         Arial                                                         !empty(cod_Seq.nro_tribut)                                    orders_view3.cajero                                                                                                         Arial                                                         %!empty(SUBSTR(_USER,AT("*",_USER)+1))                         quantity                                                      "@ 9999"                                                                                                                    Arial                                                         !"NUMERO DE PRODUCTOS VENDIDOS  ="                             "@I"                                                          Arial                                                         quantity                                                      	"@B 9999"                                                     Arial                                                         Proper(name_product)                                                                                                        Arial                                                         quantity * MTON(unit_price)                                   "9,999,999.99"                                                Arial                                                         "DESCRIPCION"                                                 "@I"                                                          Arial                                                         cod_seq.coment_fac                                                                                                          Arial                                                         cod_Seq.Empresa                                                                                                             Arial                                                         orders_view3.notes                                                                                                          Arial                                                         EMPTY(product_name)                                           
datetime()                                                                                                                  Arial                                                         �"FACTURA PARA "+IIF(INLIST(VAL(SUBSTR(orders_view3.ncf,11,1)),0,2),'CONSUMIDOR FINAL',IIF(VAL(SUBSTR(orders_view3.ncf,11,1))=1,'CREDITO FISCAL',IIF(VAL(SUBSTR(orders_view3.ncf,11,1))=5,'NCF GUBERNAMENTAL','NCF  ESPECIAL')))                                                                                             Arial                                                         'Del :   '+cod_Seq.direcc3                                                                                                  Arial                                                         !empty(cod_Seq.direcc3)                                       cod_Seq.ciudad                                                                                                              Arial                                                         !empty(cod_Seq.ciudad)                                        "Items"                                                       "@I"                                                          Arial                                                          ALLT(UPPER(cod_seq. tit_impto1))                                                                                            Arial                                                         vImpto>0                                                      
"Cajero :"                                                    "@I"                                                                                                                        Arial                                                         %!empty(SUBSTR(_USER,AT("*",_USER)+1))                         #"! ! ! GRACIAS POR SU VISITA ! ! !"                           "@I"                                                          Arial                                                         "CAMBIO"                                                      "@I"                                                                                                                        Arial                                                         orders_view3.montorecibido > 0                                orders_view3.montorecibido                                    "9,999,999.99"                                                                                                              Arial                                                         orders_view3.montorecibido > 0                                3orders_view3.montorecibido - orders_view3.montofact           "9,999,999.99"                                                Arial                                                         orders_view3.montorecibido > 0                                'NIF :  '+cod_seq.nif                                                                                                       Arial                                                         !EMPTY(cod_seq.nif)                                           	vDisCount                                                     "@Z 99,999.99"                                                Arial                                                         vDiscount > 0                                                 "TOTAL A PAGAR"                                               "@I"                                                          Arial                                                         orders_view3.montofact                                        "9,999,999.99"                                                Arial                                                         <'NCF :  '+ ALLT(orders_view3.sec_fija)+ orders_view3.sec_ini                                                                                                                                Arial                                                         EMPTY(orders_view3.sec_fija)                                  'NIF :     '+cod_seq.nif                                                                                                    Arial                                                         !empty(cod_seq.nif)                                           �TRANS(quantity)+' x  '+ALLT(STR(MTON(unit_price)))+SUBSTR(TRANS(MTON(unit_price),'99,999.99'),AT('.',TRANS(MTON(unit_price),'99,999.99')),3)                                                                                                                Arial                                                         vImpto                                                        "@Z 99,999.99"                                                Arial Narrow                                                  $"Orden:  "+orders_view3.order_number                                                                                        Arial                                                         orders_view3.vendedor2                                                                                                      Arial                                                         !empty(orders_view3.vendedor2)                                "Vendedor :"                                                  "@I"                                                                                                                        Arial                                                         !empty(orders_view3.vendedor2)                                (IIF(terms.modo="1","EFECTIVO","TARJETA")                                                                                    Arial                                                         terms.modo<>"1"                                               
"EFECTIVO"                                                    "@I"                                                                                                                        Arial                                                         orders_view3.montorecibido > 0                                1"Tel.: "+TRANS(cod_seq.telefono,"(999) 999-9999")                                                                           Arial                                                         !empty(cod_seq.telefono)                                      ,"Fax.: "+TRANS(cod_seq.fax,"(999) 999-9999")                                                                                Arial                                                         !empty(cod_seq.fax)                                            "------------------------------"                              Courier New                                                   "-----------------------------"                               Courier New                                                   "-----------------------------"                               Courier New                                                   "-----------------------------"                               Courier New                                                    "------------------------------"                              Courier New                                                    "------------------------------"                              Courier New                                                    "------------------------------"                              Courier New                                                   !empty(cod_seq.nif)                                            "------------------------------"                              Courier New                                                   ,"Cliente: "+UPPER(orders_view3.company_name)                                                                                Arial                                                         "TOTAL DESCUENTO"                                             "@I"                                                                                                                        Arial                                                         vDiscount > 0                                                 	vSubTotal                                                     "9,999,999.99"                                                Arial                                                         "SubTotall"                                                   "@I"                                                          Arial Narrow                                                  "ITBIS"                                                       "@I"                                                          Arial Narrow                                                  	vDiscount                                                     "@Z 99,999.99"                                                Arial Narrow                                                  "IDescuento"                                                  "@I"                                                          Arial Narrow                                                  vDiscount > 0                                                 	vSubTotal                                                     quantity * MTON(unit_price)                                   0                                                             	vDisCount                                                     "quantity * unit_price * descto*.01                            0                                                             
vFreiCount                                                     quantity * unit_price *.01*impto                              0                                                             vimpto                                                         quantity * unit_price *.01*impto                              0                                                             vImp                                                          orders_view3.impto                                            0                                                             vFreiCount2                                                   Biif(excenimpto OR impto=0,0,quantity * unit_price * (impto / 100))                                                            0                                                             vImp2                                                          (vImp/freight)-INT(vImp/freight)                              0                                                             
descuento2                                                    0                                                             0                                                             Courier New                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial Narrow                                                  Arial Narrow                                                  dataenvironment                                               �Top = 17
Left = 202
Width = 454
Height = 401
AutoOpenTables = .F.
AutoCloseTables = .F.
InitialSelectedAlias = "orders_view3"
DataSource = .NULL.
Name = "Dataenvironment"
         �PROCEDURE Destroy
this.CloseTables
ENDPROC
PROCEDURE Init
#DEFINE C_TASTRADEDIR_LOC	"Samples\Tastrade\"		&& Location of Tastrade, off of HOME()
#INCLUDE "INCLUDE\TASTRADE.H"

IF !noParam
   cFactura = _nFac
   this.OpenTables()
   noParam = .T.
   RETURN 
ENDIF 
set date to DMY 
Set point to "."
set separator to ","

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
	DO FORM (HOME() + C_TASTRADEDIR_LOC + "forms\getinv2") NAME loGetInvoice LINKED
ELSE
	DO FORM forms\getinv2 NAME loGetInvoice LINKED
ENDIF
llContinue = loGetInvoice.lRetVal
IF llContinue
  cFactura = loGetInvoice.cFactura
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
             V  ..\include\tastrade.h�����Q ..\include\foxpro.h�[�*O ..\include\strings.h�[�*O  ,    )   �                         ParentAlias = "orders_view3"
RelationalExpr = "ven_id"
ChildAlias = "transporte"
ChildOrder = "ven_id"
Name = "Relation4"
                                                               relation                                                      �Top = 234
Left = 22
Height = 90
Width = 91
Alias = "transporte"
Database = ..\data\tastrade.dbc
CursorSource = "transporte"
Name = "Cursor7"
                                         cursor                                                        ~ParentAlias = "orders_view3"
RelationalExpr = "id_terms"
ChildAlias = "terms"
ChildOrder = "id_terms"
Name = "Relation2"
                                                                relation                                                      cursor                                                       �Top = 19
Left = 170
Height = 90
Width = 94
Alias = "cod_seq"
Database = ..\data\tastrade.dbc
CursorSource = "cod_seq"
Name = "Cursor2"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               cursor                                                        relation                                                      cursor                                                        �Top = 1
Left = 8
Height = 197
Width = 136
Alias = "orders_view3"
Database = ..\data\tastrade.dbc
CursorSource = "orders view3"
Filter = "Tipo_doc = Tipodoc AND !itemElim and !fac_elim"
Name = "Cursor1"
                                           cursor                                                        �Top = 22
Left = 288
Height = 90
Width = 91
Alias = "provincias"
Database = ..\data\tastrade.dbc
CursorSource = "provincias"
Name = "Cursor3"
                                         cursor                                                        �Top = 255
Left = 439
Height = 90
Width = 91
Alias = "provincias1"
Database = ..\data\tastrade.dbc
CursorSource = "provincias"
Name = "Cursor4"
                                       cursor                                                        �Top = 147
Left = 175
Height = 90
Width = 91
Alias = "paises"
Database = ..\data\tastrade.dbc
CursorSource = "paises"
Name = "Cursor6"
                                                relation                                                      �ParentAlias = "orders_view3"
RelationalExpr = "prov_id"
ChildAlias = "provincias"
ChildOrder = "prov_id"
Name = "Relation1"
                                                             ParentAlias = "orders_view3"
RelationalExpr = "cod_pais"
ChildAlias = "paises"
ChildOrder = "cod_pais"
Name = "Relation3"
                                                               �Top = 140
Left = 290
Height = 90
Width = 91
Alias = "terms"
Database = ..\data\tastrade.dbc
CursorSource = "terms"
Name = "Cursor5"
                                                 D���    +  +                        
T   %   u      �     �          �  U   
 ��  � � U  THIS CLOSETABLES� %��  
��7 � T� �� �� ��C� � �� T�  �a�� B� � G(� DMY� G;(�� .�� G<(�� ,�� �� � � %�C� Project Manager���� �6 �C�Q� Samples\Tastrade\� forms\getinv2�J� �� �� � � forms\getinv2J� �� � T� �� �	 �� %�� ���� T� �� � �� ��C� � �� T� �� � 
�� %�� 
����S ��C�, No hay informaci�n disponible para imprimir.�0� M�dulo de Facturaci�n�x�� ��C� �
 �� � � <� �	 B�� �� U  NOPARAM CFACTURA _NFAC THIS
 OPENTABLES DMY LOGETINVOICE
 LLCONTINUE FORMS LRETVAL CLOSETABLES Destroy,     �� InitP     ��1 � 2 � � � � A A � � � � �b� �A � � !� 3� A A q � 3                       #         >   �      )   +                  RD NYCOORD THIS	 BACKCOLOR PICTUREr  ��  � �