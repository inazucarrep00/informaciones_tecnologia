  ?   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    @  )  winspool  HP LaserJet 1100 (MS)  LPT1:                                                  ?HP LaserJet 1100 (MS)            ? C??  ?4d   X  X  A4                                                            ????                DINU" ?   7#?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ?   SMTJ     ? H P   L a s e r J e t   1 1 0 0   ( M S )   InputBin Option1 RESDLL UniresDLL Orientation PORTRAIT Resolution Option1 PaperSize LETTER Economode Option1 RET Option1 Halftone HT_PATSIZE_AUTO                                                       ?DRIVER=winspool
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
                                     order_number                   "@I"                           Arial Narrow                   "VALOR"                        freight                                                       Arial Narrow                   0vFreicount > 0 and vImp2=0 and cod_seq.impnomvis                "999.99"                       "@I"                           Arial                          0vFreicount > 0 and vImp2=0 and cod_seq.impnomvis                                               "%"                            cod_Seq.departamen                                            Arial                          cod_Seq.direcc2                                               Arial                          #'RNC  '+alltrim(cod_Seq.nro_tribut)                                                            Arial                          SUBSTR(_USER,AT("*",_USER)+1)                                                                  Arial                          quantity                                                      Arial Narrow                   "@ 9999"                       "@I"                           Arial                          !"NUMERO DE ARTICULOS VENDIDOS  ="                               quantity                                                      Arial                          "@ 9999"                       product_name                                                  Arial Narrow                   EMPTY(product_name)            quantity * unit_price                                         Arial Narrow                   "9,999,999.99"                 _iif(cod_seq.codfabrica,TRANS(VAL(orders_view3.product_id),"@L 999999"), orders_view3.cod_fabri)                                                                  Arial Narrow                   EMPTY(product_name)            "@I"                           Arial Narrow                   "DESCRIPCION"                  cod_seq.coment_fac                                            Arial Narrow                   cod_Seq.Empresa                                               Gill Sans MT Condensed         orders_view3.notes                                            Arial Narrow                   EMPTY(product_name)            QTrans(VAL(orders_view3.order_number),"@L 999999")+SUBST(ALLT(STR(vsubtotal)),1,3)                                               Arial Narrow                   
datetime()                                                    Arial                          ?"FACTURA PARA "+IIF(INLIST(VAL(SUBSTR(orders_view3.ncf,11,1)),0,2),'CONSUMIDOR FINAL',IIF(VAL(SUBSTR(orders_view3.ncf,11,1))=1,'CREDITO FISCAL',IIF(VAL(SUBSTR(orders_view3.ncf,11,1))=5,'NCF GUBERNAMENTAL','NCF  ESPECIAL')))                                     Arial                          cod_Seq.direcc3                                               Arial                          cod_Seq.ciudad                                                Arial                           ALLT(UPPER(cod_seq. tit_impto1))                                                               Arial Narrow                   vimpto                                                        Arial Narrow                   "99,999.99"                    Courier New                    ("--------------------------------------"                        Courier New                    ("--------------------------------------"                        Courier New                    ("--------------------------------------"                        "@I"                           Arial Narrow                   "Items"                         ALLT(UPPER(cod_seq. tit_impto1))                                                               Arial Narrow                   0vFreicount > 0 and vImp2=0 and cod_seq.impnomvis                Courier New                    ("--------------------------------------"                        Courier New                    ("--------------------------------------"                        "@I"                           Arial Narrow                   "Le Atendio :"                 vimpto                                                        Arial Narrow                   "99,999.99"                    1023012039870                                                 BC C39 3 to 1 Medium           "@I"                           Arial Narrow                   #"! ! ! GRACIAS POR SU VISITA ! ! !"                             "@I"                           Arial Narrow                   orders_view3.montorecibido > 0                                                                 
"EFECTIVO"                     "@I"                           Arial Narrow                   orders_view3.montorecibido > 0                                                                 "CAMBIO"                       orders_view3.montorecibido                                                                     Arial Narrow                   orders_view3.montorecibido > 0                                  "9,999,999.99"                 orders_view3.montorecibido-round(vSubTotal + iif(vImp=0,vFreiCount,vFreiCount2) - round(vDiscount,cod_seq.redon),cod_seq.redon)                                                                   Arial Narrow                   orders_view3.montorecibido > 0                                  "9,999,999.99"                 'NIF :  '+cod_seq.nif                                         Arial                          "@I"                           Arial Narrow                   vDiscount > 0                                                 "DESCUENTO"                    round(vDiscount,cod_seq.redon)                                                                 Arial Narrow                   vDiscount > 0                  "99,999.99"                    "@I"                           Arial Narrow                   descuenTo > 0                                                 "TOTAL A PAGAR"                wround(vSubTotal + iif(vImp=0,vFreiCount,vFreiCount2) - round(vDiscount,cod_seq.redon)+(vSubTotal*10*.01),cod_seq.redon)                                          Arial Narrow                   descuenTo > 0                  "9,999,999.99"                 <'NCF :  '+ ALLT(orders_view3.sec_fija)+ orders_view3.sec_ini                                                                    Arial                          Courier New                    ("--------------------------------------"                        'NIF :  '+cod_seq.nif                                         Arial                          6TRANS(quantity)+' x '+TRANS(unit_price,'9,999,999.99')                                         Arial Narrow                   "@I"                           Arial Narrow                   vDiscount > 0                                                 "% LEY"                        vSubTotal*10*.01                                              Arial Narrow                   "99,999.99"                     ALLT(UPPER(cod_seq. tit_impto1))                                                               Arial Narrow                   0vFreicount > 0 and vImp2=0 and cod_seq.impnomvis                	vSubTotal                      quantity * MTON(unit_price)                                     0                              	vDisCount                      %quantity * unit_price * discount *.01                           0                              
vFreiCount                      quantity * unit_price *.01*impto                                0                              vimpto                          quantity * unit_price *.01*impto                                0                              vImp                           orders_view3.impto             0                              vFreiCount2                    Biif(excenimpto OR impto=0,0,quantity * unit_price * (impto / 100))                               0                              vImp2                           (vImp/freight)-INT(vImp/freight)                                0                              Courier New                    Arial Narrow                   Arial                          Arial                          Arial Narrow                   Arial Narrow                   Gill Sans MT Condensed         Arial Narrow                   Arial                          BC C39 3 to 1 Medium           Arial Narrow                   Arial Narrow                   Arial Narrow                   dataenvironment                ?Left = 202
Top = 17
Width = 454
Height = 401
AutoOpenTables = .F.
AutoCloseTables = .F.
InitialSelectedAlias = "orders_view3"
Name = "Dataenvironment"
                                    ?PROCEDURE Init
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
PROCEDURE Destroy
this.CloseTables
ENDPROC
                    cursor                         cursor                         cursor                         ParentAlias = "orders_view3"
RelationalExpr = "ven_id"
ChildAlias = "transporte"
ChildOrder = "ven_id"
Name = "Relation4"
                                    relation                       ?Left = 22
Top = 234
Width = 91
Height = 90
Alias = "transporte"
Database = ..\data\tastrade.dbc
CursorSource = "transporte"
Name = "Cursor7"
              cursor                         ~ParentAlias = "orders_view3"
RelationalExpr = "id_terms"
ChildAlias = "terms"
ChildOrder = "id_terms"
Name = "Relation2"
                                     relation                       ?Left = 290
Top = 140
Width = 91
Height = 90
Alias = "terms"
Database = ..\data\tastrade.dbc
CursorSource = "terms"
Name = "Cursor5"
                       cursor                        ?Left = 173
Top = 19
Width = 91
Height = 90
Alias = "cod_seq"
Database = ..\data\tastrade.dbc
CursorSource = "cod_seq"
Name = "Cursor2"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          cursor                         relation                       relation                       cursor                         ?Left = 8
Top = 1
Width = 136
Height = 197
Alias = "orders_view3"
Database = ..\data\tastrade.dbc
CursorSource = "orders view3"
Filter = "Tipo_doc = Tipodoc AND !itemElim"
Name = "Cursor1"
                                ?Left = 288
Top = 22
Width = 91
Height = 90
Alias = "provincias"
Database = ..\data\tastrade.dbc
CursorSource = "provincias"
Name = "Cursor3"
              ?Left = 439
Top = 255
Width = 91
Height = 90
Alias = "provincias1"
Database = ..\data\tastrade.dbc
CursorSource = "provincias"
Name = "Cursor4"
            ?Left = 175
Top = 147
Width = 91
Height = 90
Alias = "paises"
Database = ..\data\tastrade.dbc
CursorSource = "paises"
Name = "Cursor6"
                     ?ParentAlias = "orders_view3"
RelationalExpr = "prov_id"
ChildAlias = "provincias"
ChildOrder = "prov_id"
Name = "Relation1"
                                  ParentAlias = "orders_view3"
RelationalExpr = "cod_pais"
ChildAlias = "paises"
ChildOrder = "cod_pais"
Name = "Relation3"
                                    V  ..\include\tastrade.hv????Q ..\include\foxpro.h~?[?*O ..\include\strings.h??[?*O9\fox     D???    +  +                        
T   %   u      ?     ?          ?  U  ? %??  
??7 ? T? ?? ?? ??C? ? ?? T?  ?a?? B? ? G(? DMY? G;(?? .?? G<(?? ,?? ?? ? ? %?C? Project Manager???? ?6 ?C?Q? Samples\Tastrade\? forms\getinv2?J? ?? ?? ? ? forms\getinv2J? ?? ? T? ?? ?	 ?? %?? ???? T? ?? ? ?? ??C? ? ?? T? ?? ? 
?? %?? 
????S ??C?, No hay informaci?n disponible para imprimir.?0? M?dulo de Facturaci?n?x?? ??C? ?
 ?? ? ? <? ?	 B?? ?? U  NOPARAM CFACTURA _NFAC THIS
 OPENTABLES DMY LOGETINVOICE
 LLCONTINUE FORMS LRETVAL CLOSETABLES 
 ??  ? ? U  THIS CLOSETABLES Init,     ?? DestroyQ    ??1 ? ? ? ? A A ? ? ? ? ?b? ?A ? ? !? 3? A A q ? 4 ? 1                       ?        ?  ?  .    )   +                   T? ? ? ?