  _   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    s  :  winspool  Microsoft Office Document Image Writer  Microsoft Document Imaging Writer Port:                                ,Microsoft Office Document Imag   � � /        d   X  X   Letter                                                                                widm               �          �                                                                                                                                           �DRIVER=winspool
DEVICE=Microsoft Office Document Image Writer
OUTPUT=Microsoft Document Imaging Writer Port:
ORIENTATION=0
PAPERSIZE=1
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=600
COLOR=1
YRESOLUTION=600
                  ordertotal5.grupo              ordertotal5.shipper_id         DATE()                         Arial                          "@I"                           Arial                          "P�gina"                       _PAGENO                        Arial                          "@I"                           Arial                          "Fecha"                        R'(Para '+IIF(EMPTY(fDesde),'0',Alltrim(TRANS(fHasta-fDesde+1)))+' dias, en Pesos)'                                              Arial                          5'Desde '+DTOC(fDesde)+' Hasta '+allTrim(DTOC(fHasta))                                          Arial                          "@I"                           Arial                          "POR VENDEDOR"                "@I"                           Arial                          &"I S T A D O   DE       A C T U R A S"                          Arial                          "L"                            Arial                          "F  "                          cod_Seq.departamen                                            Arial                          cod_seq.encab = 'S'            cod_Seq.direccion                                             Arial                          cod_seq.encab = 'S'            cod_Seq.direcc2                                               Arial                          cod_seq.encab = 'S'            #'RNC  '+alltrim(cod_Seq.nro_tribut)                                                            Arial                          cod_seq.encab = 'S'            cod_Seq.direcc3                                               Arial                          cod_seq.encab = 'S'            cod_seq.imagen                  (c) Microsoft Corporation 1995                                 !cod_seq.nombEmp               ordertotal5.order_date                                        Arial                          "@D"                           "@I"                           Arial                          "  Num   Fact."               "@I"                           Arial                          	"Emitida"                      "@I"                           Arial                          "TotalFactura"                "@I"                           Arial                          	"Cliente"                      "@I"                           Arial                          " DiasVencidos"               customer.company_name                                         Arial                          ordertotal5.order_id                                          Arial                          ordertotal5.terms                                             Arial                          ordertotal5.ordertotal                                        Arial                          "9,999,999.99"                 ordertotal5.order_id                                          Arial                          "9999"                         "@I"                           Arial                          "Total factura(s):"            ordertotal5.ordertotal                                        Arial                          "999,999,999.99"               "@I"                           Arial                          "Fecha Vencim."               "@I"                           Arial                          "Vendedor:"                   ordertotal5.order_id                                          Arial                          "9999"                         "@I"                           Arial                          "Total Vendedor:"              ordertotal5.ordertotal                                        Arial                          "99,999,999.99"                'Imail: '+cod_seq.imail                                       Arial                          cod_seq.encab = 'S'            "@I"                           Arial                          
"Terminos"                     UPPER(ordertotal5.company_name)                                                                Arial                          date()-ordertotal5.deliver_by                                                                  Arial                          Ldate()>ordertotal5.deliver_by and !INLIST(UPPER(terms),"EFECTIVO","CHEQUE")                      	"@Z 9999"                      ordertotal5.deliver_by                                        Arial                          cod_Seq.Empresa                                               Bookman Old Style              cod_seq.nombEmp                Courier New                    Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          Bookman Old Style              dataenvironment                �Left = 201
Top = 18
Width = 257
Height = 295
AutoOpenTables = .F.
AutoCloseTables = .F.
InitialSelectedAlias = "ordertotal5"
Name = "Dataenvironment"
                                     �PROCEDURE Destroy
*DELETE TAG employee_i
This.CloseTables
ENDPROC
PROCEDURE Init
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
     this.cursor2.Filter = "Ven_id = cVendedor"  
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

*  INDEX ON employee_i TAG employee_i ASCENDING  
  llContinue = !(_tally = 0)
  IF !llContinue
    =MESSAGEBOX(NOTHINGTOPRINT_LOC, ;
                MB_ICONEXCLAMATION, ;
                TASTRADE_LOC)
*    this.Filter = null 
    this.CloseTables()
  ENDIF
ENDIF
RELEASE loGetInvoice
RETURN llContinue
ENDPROC
         cursor                         cursor                         cursor                         �ParentAlias = "ordertotal5"
RelationalExpr = "customer_i"
ChildAlias = "customer"
ChildOrder = "customer_i"
Name = "Relation1"
                               relation                       �Left = 7
Top = 20
Width = 91
Height = 90
Alias = "ordertotal5"
Database = ..\data\tastrade.dbc
CursorSource = "ordertotal5"
Name = "Cursor2"
              �Left = 9
Top = 139
Width = 91
Height = 90
Alias = "customer"
Database = ..\data\tastrade.dbc
CursorSource = "customer"
Name = "Cursor3"
                  QLeft = 150
Top = 20
Width = 91
Height = 90
Alias = "cod_seq"
Database = ..\data\tastrade.dbc
CursorSource = "cod_seq"
Name = "Cursor1"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 V  ..\include\tastrade.h�����Q ..\include\foxpro.h��[�*O ..\include\strings.h��[�*O9\fox     {���    b  b                        C?   %   �      	  $   �          �  U   
 ��  � � U  THIS CLOSETABLES� ��  � � %�C� Project Manager���^ �5 �C�Q� Samples\Tastrade\� forms\getinv�J�  �� � � � forms\getinvJ�  �� � T� ��  � �� %�� ��j� T� ��  � �� T� ��  � �� %�C� f� TODOS��� � T� � �	 ���� ��% T� � �	 �� Ven_id = cVendedor�� � ��C� �
 ��) T� �C� � � E�	 � DMY� � MDY6��& T� �CC� � g�� � .� � ,6��& T� �CC� � g�� � ,� � .6�� T� �� � �� G(�� �� G;(�� �� G<(�� �� SET DATE &formatdate 
 T� �� � 
�� %�� 
��f�S ��C�, No hay informaci�n disponible para imprimir.�0� M�dulo de Facturaci�n�x�� ��C� � �� � � <�  �	 B�� �� U  LOGETINVOICE
 LLCONTINUE FORMS LRETVAL	 DDATEFROM DDATETO	 CVENDEDOR THIS CURSOR2 FILTER
 OPENTABLES
 FORMATDATE COD_SEQ
 TIPO_FECHA
 POINTSEPAR	 SEPARADOR	 COMASEPAR REDONDEO REDON CLOSETABLES Destroy,     �� InitP     ��1 � 2 � �R� �A � �� QA � �aa� � � �#� 3� A A q � 1                       ;         V   �      )   b                  