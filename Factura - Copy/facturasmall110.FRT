  �   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    ?  '  winspool  Generic / Text Only  USB002                                                   �Generic / Text Only              � 4C�  �
od   X  X  Letter                                                        ����                DINU"   4  ��s�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �DRIVER=winspool
DEVICE=Generic / Text Only
OUTPUT=USB002
ORIENTATION=0
PAPERSIZE=1
ASCII=1
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=600
COLOR=1
YRESOLUTION=600
TTOPTION=2
COLLATE=1
                                     order_number                   "@I"                           Device Font 10cpi              "VALOR"                        cod_Seq.departamen                                            Device Font 10cpi              'Res DGII :   '+cod_Seq.direcc2                                                                Device Font 10cpi              !empty(cod_Seq.direcc2)        #'RNC  '+alltrim(cod_Seq.nro_tribut)                                                            Device Font 10cpi              !empty(cod_Seq.nro_tribut)                                      Proper(product_name)                                          Device Font 10cpi              quantity * MTON(unit_price)                                                                    Device Font 10cpi              "9,999,999.99"                 "@I"                           Device Font 10cpi              "DESCRIPCION"                  cod_Seq.Empresa                                               Device Font 10cpi              
datetime()                                                    Device Font 10cpi              �"FACTURA PARA "+IIF(INLIST(VAL(SUBSTR(orders_view3.ncf,11,1)),0,2),'CONSUMIDOR FINAL',IIF(VAL(SUBSTR(orders_view3.ncf,11,1))=1,'CREDITO FISCAL',IIF(VAL(SUBSTR(orders_view3.ncf,11,1))=5,'NCF GUBERNAMENTAL','NCF  ESPECIAL')))                                     Device Font 10cpi              'Del :   '+cod_Seq.direcc3                                                                     Device Font 10cpi              !empty(cod_Seq.direcc3)        cod_Seq.ciudad                                                Device Font 10cpi              !empty(cod_Seq.ciudad)         'NIF :  '+cod_seq.nif                                         Device Font 10cpi              !EMPTY(cod_seq.nif)            <'NCF :  '+ ALLT(orders_view3.sec_fija)+ orders_view3.sec_ini                                                                    Device Font 10cpi              EMPTY(orders_view3.sec_fija)                                    1"Tel.: "+TRANS(cod_seq.telefono,"(999) 999-9999")                                              Device Font 10cpi              !empty(cod_seq.telefono)       ,"Fax.: "+TRANS(cod_seq.fax,"(999) 999-9999")                                                   Device Font 10cpi              !empty(cod_seq.fax)            ,"Cliente: "+UPPER(orders_view3.company_name)                                                   Device Font 10cpi              Courier New                    ,"------------------------------------------"                    Courier New                    ,"------------------------------------------"                    Courier New                    ,"------------------------------------------"                    "@I"                           Courier New                                                   "SUBTOTAL "                    vimpto                                                        Courier New                    !empty(vimpto)                 "99,999.99"                    "@I"                           Courier New                    orders_view3.montorecibido > 0                                                                 "CAMBIO"                       orders_view3.montorecibido                                                                     Courier New                    orders_view3.montorecibido > 0                                  "9,999,999.99"                 �orders_view3.montorecibido-round(vSubTotal + iif(vImp=0,vFreiCount,vFreiCount2) - round(vDiscount,cod_seq.redon)+(vSubTotal*cod_seq.impto2*.01),cod_seq.redon)                                                                     Courier New                    orders_view3.montorecibido > 0                                  "9,999,999.99"                 "@I"                           Courier New                    vDiscount > 0                                                 "DESCUENTO"                    round(vDiscount,cod_seq.redon)                                                                 Courier New                    vDiscount > 0                  "99,999.99"                    "@I"                           Courier New                                                   "TOTAL A PAGAR"                �round(vSubTotal + iif(vImp=0,vFreiCount,vFreiCount2) - round(vDiscount,cod_seq.redon)+(vSubTotal*cod_seq.impto2*.01),cod_seq.redon)                                                               Courier New                    "9,999,999.99"                 	vSubTotal                                                     Courier New                    "9,999,999.99"                  vSubTotal * cod_seq.impto2 * .01                                                               Courier New                    (!empty(vSubTotal * cod_seq.impto2 * .01)                        "99,999.99"                     ALLT(UPPER(cod_seq. tit_impto1))                                                               Courier New                    !empty(vimpto)                 %'% '+ALLT(UPPER(cod_seq. tit_impto2))                                                          Courier New                    (!empty(vSubTotal * cod_seq.impto2 * .01)                        (IIF(terms.modo="1","EFECTIVO","TARJETA")                                                       Courier New                    terms.modo<>"1"                Courier New                    )"---------------------------------------"                       freight                                                       Courier New                    0vFreicount > 0 and vImp2=0 and cod_seq.impnomvis                "999.99"                       "@I"                           Courier New                    0vFreicount > 0 and vImp2=0 and cod_seq.impnomvis                                               "%"                            balltrim(LEFT(orders_view3.cajero,1)+"."+SUBSTR(orders_view3.cajero,AT(" ",orders_view3.cajero)+1))                                                               Courier New                    %!empty(SUBSTR(_USER,AT("*",_USER)+1))                           quantity                                                      Courier New                    "@ 9999"                       "@I"                           Courier New                    "Items"                         ALLT(UPPER(cod_seq. tit_impto1))                                                               Courier New                    0vFreicount > 0 and vImp2=0 and cod_seq.impnomvis                "@I"                           Courier New                    %!empty(SUBSTR(_USER,AT("*",_USER)+1))                                                          
"Cajero :"                     $"Orden:  "+orders_view3.order_number                                                           Courier New                    kalltrim(left(orders_view3.vendedor2,1)+"."+SUBSTR(orders_view3.vendedor2,AT(" ",orders_view3.vendedor2)+1))                                                      Courier New                    !empty(orders_view3.vendedor2)                                  "@I"                           Courier New                    !empty(orders_view3.vendedor2)                                                                 "Vendedor:"                    "@I"                           Courier New                    orders_view3.montorecibido > 0                                                                 
"EFECTIVO"                     .TRANS(quantity)+' x'+TRANS(unit_price,'9,999')                                                 Device Font 10cpi              "@I"                           Arial                          #"! ! ! GRACIAS POR SU VISITA ! ! !"                             	vSubTotal                      quantity * MTON(unit_price)                                     0                              	vDisCount                      %quantity * unit_price * discount *.01                           0                              
vFreiCount                      quantity * unit_price *.01*impto                                0                              vimpto                         &quantity * MTON(unit_price) *.01*impto                          0                              vImp                           orders_view3.impto             0                              vFreiCount2                    Biif(excenimpto OR impto=0,0,quantity * unit_price * (impto / 100))                               0                              vImp2                           (vImp/freight)-INT(vImp/freight)                                0                              Courier New                    Device Font 10cpi              Arial                          dataenvironment                �Left = 202
Top = 17
Width = 454
Height = 401
AutoOpenTables = .F.
AutoCloseTables = .F.
InitialSelectedAlias = "orders_view3"
Name = "Dataenvironment"
                                    �PROCEDURE Destroy
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
                   D���    +  +                        
T   %   u      �     �          �  U   
 ��  � � U  THIS CLOSETABLES� %��  
��7 � T� �� �� ��C� � �� T�  �a�� B� � G(� DMY� G;(�� .�� G<(�� ,�� �� � � %�C� Project Manager���� �6 �C�Q� Samples\Tastrade\� forms\getinv2�J� �� �� � � forms\getinv2J� �� � T� �� �	 �� %�� ���� T� �� � �� ��C� � �� T� �� � 
�� %�� 
����S ��C�, No hay informaci�n disponible para imprimir.�0� M�dulo de Facturaci�n�x�� ��C� �
 �� � � <� �	 B�� �� U  NOPARAM CFACTURA _NFAC THIS
 OPENTABLES DMY LOGETINVOICE
 LLCONTINUE FORMS LRETVAL CLOSETABLES Destroy,     �� InitP     ��1 � 2 � � � � A A � � � � �b� �A � � !� 3� A A q � 3                       #         >   �      )   +                                      cursor                        }Left = 170
Top = 19
Width = 94
Height = 90
Alias = "cod_seq"
Database = data\tastrade.dbc
CursorSource = "cod_seq"
Name = "Cursor2"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             M  include\tastrade.h��F�xD include\foxpro.h��Ϊ
+ include\strings.h��C�D                    cursor                         �Left = 8
Top = 1
Width = 136
Height = 197
Alias = "orders_view3"
Database = data\tastrade.dbc
CursorSource = "orders view3"
Filter = "Tipo_doc = Tipodoc AND !itemElim"
Name = "Cursor1"
                                   cursor                         �Left = 288
Top = 22
Width = 91
Height = 90
Alias = "provincias"
Database = data\tastrade.dbc
CursorSource = "provincias"
Name = "Cursor3"
                 cursor                         �Left = 439
Top = 255
Width = 91
Height = 90
Alias = "provincias1"
Database = data\tastrade.dbc
CursorSource = "provincias"
Name = "Cursor4"
               cursor                         �Left = 175
Top = 147
Width = 91
Height = 90
Alias = "paises"
Database = data\tastrade.dbc
CursorSource = "paises"
Name = "Cursor6"
                        relation                       �ParentAlias = "orders_view3"
RelationalExpr = "prov_id"
ChildAlias = "provincias"
ChildOrder = "prov_id"
Name = "Relation1"
                                  relation                       ParentAlias = "orders_view3"
RelationalExpr = "cod_pais"
ChildAlias = "paises"
ChildOrder = "cod_pais"
Name = "Relation3"
                                    cursor                         �Left = 290
Top = 140
Width = 91
Height = 90
Alias = "terms"
Database = data\tastrade.dbc
CursorSource = "terms"
Name = "Cursor5"
                          relation                       ~ParentAlias = "orders_view3"
RelationalExpr = "id_terms"
ChildAlias = "terms"
ChildOrder = "id_terms"
Name = "Relation2"
                                     cursor                         �Left = 22
Top = 234
Width = 91
Height = 90
Alias = "transporte"
Database = data\tastrade.dbc
CursorSource = "transporte"
Name = "Cursor7"
                 relation                       ParentAlias = "orders_view3"
RelationalExpr = "ven_id"
ChildAlias = "transporte"
ChildOrder = "ven_id"
Name = "Relation4"
                                     