CLEAR
CLOSE DATABASES
SET TALK OFF

SET TEXTMERGE ON     && Enable embedding of expressions and functions
STORE FCREATE('names.txt') TO _TEXT     && Create low-level file
IF _TEXT = -1  && Can't create low-level file then exit program
   WAIT WINDOW 'Cannot create an output file; press a key to exit'
   CANCEL
ENDIF

CLOSE DATABASES
OPEN DATABASE 'c:\SISTEMAs\factura\data\tastrade.dbc'
SELECT Orders.order_id, Orders.ship_to_name, Orders.pos_hora,;
  Orders.order_date, Order_line_items.product_id,;
  Order_line_items.name_product, Order_line_items.quantity;
 FROM ;
     tastrade!Orders ;
    INNER JOIN tastrade!order_line_items ;
   ON  Orders.order_id = Order_line_items.order_id ;
    INNER JOIN tastrade!products ;
   ON  Order_line_items.product_id = Products.product_id;
   WHERE VAL(orders.order_id)=11;
 ORDER BY Orders.order_id INTO CURSOR reportecaja

SELECT reportecaja && Opens Customer table

orden = RIGHT(order_id,4)
TEXT
    <<ship_to_name>>    
    Orden <<orden>>  fecha <<order_date>>  Hora <<pos_hora>>
    
ENDTEXT
*WAIT WINDOW 'Press a key to generate the first ten names'
SCAN
   descripcion = LEFT(name_product,20)
   TEXT
     <<Descripcion>>   <<quantity>>
   ENDTEXT
ENDSCAN
CLOSE ALL  && Close the text file and the table
MODIFY FILE names.txt
ERASE names.txt



RETURN 
SET TALK OFF
SET TEXTMERGE ON NOSHOW      && Enable text merge, no output to screen
SET TEXTMERGE DELIMITERS TO   && Default text merge delimiters <<,>>
SET TEXTMERGE TO date.txt   && Create and send output to date.txt
STORE _TEXT TO gcDateHandle   && Save date.txt's file handle
STORE -1 TO _TEXT         && Output off to date.txt; keep it open
SET TEXTMERGE TO time.txt   && Create and send output to time.txt
STORE _TEXT TO gcTimeHandle   && Save time.txt's file handle
*** Send the following text to time.txt ***
\The time is:
STORE gcDateHandle TO _TEXT    && Now direct output to date.txt
*** Send the following text to date.txt ***
\Today's date is:
STORE gcTimeHandle TO _TEXT   && Now direct output to time.txt
*** Output the time on the same line ***
\\ <<TIME( )>>
STORE gcDateHandle TO _TEXT   && Now direct output to date.txt
*** Output the date on the same line ***
\\ <<DATE( )>>
CLOSE ALL  && Close all files
TYPE date.txt  && See what's in this file...
WAIT WINDOW  && Pause
TYPE time.txt  && ...and what's in this file
ERASE date.txt
ERASE time.txt


RETURN 


SELECT b.*, a.category_name;
FROM category a;
INNER JOIN products b;
ON a.category_id = b.category_id ;
where VAL(b.category_id) = 1 INTO CURSOR qq


RETURN 
cadena='uno-dos-tres-cuatro-cinco-seis-siete'
DO WHILE AT('-',cadena)>0
	subcadena = SUBSTR(cadena,1,AT('-',cadena)-1)
	cadena = SUBSTR(cadena,AT('-',cadena)+1)
ENDDO 
subcadena = cadena
RETURN 
WAIT WINDOW SUBSTR(aaa,2)
?SUBSTR(aaa,1,AT('-',aaa)-1)
STUFF(cadena,1,1,'')



RETURN
SELECT category 

FOR i=13 TO 45
	INSERT INTO category (category_id, category_name);
	VALUES (STR(i,6),'SANCHOCHO DE POLLO')
NEXT 

RETURN 

CLOSE DATABASES
OPEN DATABASE (HOME(2) + 'Data\testdata')
SET REPROCESS TO 3 AUTOMATIC
STORE '1,2,3,4' TO gcRecList
gcOldExc = SET('EXCLUSIVE')
SET EXCLUSIVE OFF
SELECT 0
USE employee  && Open Employee table
SELECT 0
USE customer  && Open Customer table
? LOCK('1,2,3,4', 'customer')  && Lock 1st 4 records in customer
? RLOCK(gcRecList, 'employee')  && Lock 1st 4 records in employee
UNLOCK IN customer
UNLOCK IN employee
SET EXCLUSIVE &gcOldExc





RETURN 

 SELECT * FROM docs WHERE !DELETED() AND turno=IIF(BETWEEN(VAL(LEFT(TIME(),2)),2,15),1,2) INTO CURSOR Docs2 
	 SELECT Maqpto.descri_cpu, Maqpto.name_abre, Maqpto.clave_oper,;
	  tmpcierre.nro_cierre, tmpcierre.monto_ini, tmpcierre.cash, tmpcierre.visa, tmpcierre.tar_master,tmpcierre.otros,;
	  tmpcierre.cheques, tmpcierre.monto_repo, tmpcierre.tot_al_cie,;
	  tmpcierre.resultado, docs2.descri_doc, docs2.monto, docs2.sw_cash,;
	  tmpcierre.apertura, tmpcierre.hora_abre, tmpcierre.cierre,Maqpto.turno,;
	  tmpcierre.hora_cie, docs2.fecha_e, docs2.nro_fact;
	 FROM maqpto INNER JOIN tmpcierre;
	    INNER JOIN docs2 ;
	   ON  tmpcierre.apertura = docs2.fecha_e ;
	   ON  Maqpto.descri_cpu = tmpcierre.descri_cpu;
	 WHERE tmpcierre.descri_cpu = docs2.maq_pto AND ;
	       docs2.tipo_doc = "P" ;
	   ORDER BY docs2.sw_cash, docs2.nro_fact INTO CURSOR reportecaja
   
   
RETURN 
MOUSE CLICK AT 3,3
MOUSE CLICK AT 3,3 DRAG TO 10,10
MOUSE DRAG TO 20,20
MOUSE DBLCLICK DRAG TO 30,30
MOUSE DRAG TO 10,10,20,20,30,30


RETURN 
SELECT category 

FOR i=9 TO 45
	INSERT INTO category (category_id, category_name);
	VALUES (STR(i,6),'SANCHOCHO DE POLLO')
NEXT 

RETURN 


CREATE CURSOR cCategoria (category_id C(6), category_name C(40), pagina N(2))

SELECT * FROM category INTO CURSOR cCat
ubica = DBF()
SELECT cCategoria
APPEND FROM &ubica
j=1
GO TOP 
SCAN
   replace pagina WITH j
   IF MOD(RECNO(),10) = 0
         j = j + 1
   ENDIF 

ENDSCAN


RETURN





DEFINE CLASS form1 AS Form

    Caption = "Form1"

    Name = "Form1"

    ADD OBJECT Grid1 AS Grid WITH ;

        ColumnCount = 2, ;

        Height = 200, ;

        Left = 24, ;

        RecordSource = "ardemo", ;

        Top = 24, ;

        Width = 320, ;

        Name = "Grid1", ;

        Column1.ControlSource = "ardemo.fruit", ;

        Column1.Width = 75, ;

        Column1.Name = "Column1", ;

        Column2.Bound = .F., ;

        Column2.ControlSource = "This.ActiveRow", ;

        Column2.Name = "Column2"



    PROCEDURE Init

    THIS.Grid1.Column2.Header1.Caption = 'ActiveRow'

ENDPROC

    PROCEDURE Unload

    CLEAR EVENTS

ENDPROC



ENDDEFINE

RETURN 
	SELECT IIF(ISNULL(MIN(order_number)),'',order_number) as order_number ;
	FROM orders ;
	WHERE TYPE(order_number)<>'U' AND !comanprocesada AND VAL(order_number)#0 GROUP BY order_number INTO CURSOR qMinOrden 

	SELECT MIN(order_number) as proxima FROM qMinOrden INTO CURSOR cOrderProxima





RETURN 
SELECT Orders.order_id, Orders.order_date, Orders.deliver_by,;
  SUM(Orditems.unit_price*Orditems.quantity)-SUM(Orditems.unit_price*Orditems.quantity*.01*descto)+SUM(quantity * unit_price *.01*impto) AS ord_total;
 FROM ;
     tastrade!Orders ;
    INNER JOIN tastrade!order_line_items Orditems ;
   ON  Orders.order_id = Orditems.order_id;
 WHERE  Orders.customer_id = '     3';
 GROUP BY Orders.order_id, Orders.order_date, Orders.deliver_by;
 ORDER BY Orders.order_date DESC
RETURN 
SUM(Orditems.unit_price*Orditems.quantity)-Orders.discount*0.01*SUM(Orditems.unit_price*Orditems.quantity)+Orders.freight AS ord_total
RETURN 
SELECT * FROM permisos WHERE group_id = '     1' ORDER BY numero_menu, opmenu3 INTO CURSOR cRoles

SELECT * FROM cRoles WHERE opmenu NOT IN (SELECT opmenu FROM permisos WHERE group_id = '     5') ;
       INTO CURSOR cRolesUsuarios 


quantity * MTON(unit_price) + (quantity * unit_price *.01*impto) -  (quantity * unit_price *.01*descto)

SUM(Orditems.unit_price*Orditems.quantity)-SUM(Orditems.unit_price*Orditems.quantity*.01*descto)+SUM(quantity * unit_price *.01*impto) AS ord_total

RETURN

		SELECT MIN(order_number) as order_number ;
		FROM orders ;
		WHERE TYPE(order_number)<>'U' AND !comanprocesada AND VAL(order_number)#0;
		GROUP BY order_number INTO CURSOR qMinOrden

RETURN

oForm = Createobject('myForm')
oForm.Show(1)

Define Class myForm As Form
  Height = 300
  Width = 470
  DoCreate=.T.
  DataSession=2
  nxtwips = .F.
  nytwips = .F.

  Add Object myTree As OleControl With ;
    Top = 0, ;
    Left = 0, ;
    Height = 300, ;
    Width = 200, ;
    Name = "myTree", ;
    OleClass = 'MSComCtlLib.TreeCtrl'

  Add Object myGrid As myGrid With ;
    Top = 0, ;
    Left = 220, ;
    Height = 300, ;
    Width = 250, ;
    Name = "myGrid"

  Procedure pixeltotwips
    *-- Code for PixelToTwips method
    Local liHWnd, liHDC, liPixelsPerInchX, liPixelsPerInchY
    #Define cnLOG_PIXELS_X 88
    #Define cnLOG_PIXELS_Y 90
    #Define cnTWIPS_PER_INCH 1440

    * Declare some Windows API functions.
    Declare Integer GetActiveWindow In WIN32API
    Declare Integer GetDC In WIN32API Integer iHDC
    Declare Integer GetDeviceCaps In WIN32API Integer iHDC, Integer iIndex

    * Get a device context for VFP.
    liHWnd = GetActiveWindow()
    liHDC = GetDC(liHWnd)

    * Get the pixels per inch.
    liPixelsPerInchX = GetDeviceCaps(liHDC, cnLOG_PIXELS_X)
    liPixelsPerInchY = GetDeviceCaps(liHDC, cnLOG_PIXELS_Y)

    * Get the twips per pixel.
    Thisform.nxtwips = ( cnTWIPS_PER_INCH / liPixelsPerInchX )
    Thisform.nytwips = ( cnTWIPS_PER_INCH / liPixelsPerInchY )
    Return
  Endproc

  Procedure Load
    Create Cursor myTest (myID i, myType c(20))
    For ix = 1 To 20
      Insert Into myTest (myID,myType) Values (ix,Sys(2015))
    Endfor
    Locate
    This.pixeltotwips()
  Endproc

  Procedure myTree.Init
    #Define tvwFirst    0
    #Define tvwLast    1
    #Define tvwNext    2
    #Define tvwPrevious    3
    #Define tvwChild    4

    With This
      .linestyle =1
      .labeledit =1
      .indentation = 5
      .PathSeparator = '\'
      .Scroll = .T.
      .OLEDragMode = 1
      .OLEDropMode = 1

      For ix=1 To 3
        .Nodes.Add(,tvwFirst,"root"+Ltrim(Str(ix)),'Main node '+Ltrim(Str(ix)))
        For jx=1 To 4
          .Nodes.Add("root"+Ltrim(Str(ix)),tvwChild,;
            "child"+Ltrim(Str((ix-1)*4+jx)),;
            'Child '+Ltrim(Str(jx))+' of '+Ltrim(Str(ix)))
        Endfor
      Endfor
    Endwith
  Endproc

  Procedure myTree.MouseDown
    *** ActiveX Control Event ***
    Lparameters Button, Shift, x, Y
    With Thisform
      oHitTest = This.HitTest( x * .nxtwips, Y * .nytwips )
      If Type("oHitTest")= "O" And !Isnull(oHitTest)
        This.SelectedItem = oHitTest
      Endif
    Endwith
    oHitTest = .Null.
  Endproc

  Procedure myTree.OLEDragOver
    *** ActiveX Control Event ***
    Lparameters Data, effect, Button, Shift, x, Y, state
    oHitTest = This.HitTest( x * Thisform.nxtwips, Y * Thisform.nytwips )
    If Type("oHitTest")= "O"
      This.DropHighlight = oHitTest
      If !Isnull(oHitTest)
        If Y <= This.Top + 150     And Type('oHitTest.Previous')='O'     And !Isnull(oHitTest.Previous)
          oHitTest.Previous.EnsureVisible
        Endif
        If Y >= This.Top + This.Height - 150 And Type('oHitTest.Next')='O' And !Isnull(oHitTest.Next)
          oHitTest.Next.EnsureVisible
        Endif
      Endif
    Endif
  Endproc

  Procedure myTree.OLEDragDrop
    *** ActiveX Control Event ***
    Lparameters Data, effect, Button, Shift, x, Y
    #Define tvwChild    4
    With This
      If Data.GetFormat(1)    And ;
          type(".DropHighLight") = "O" And !Isnull(.DropHighlight) &&CF_TEXT
        loTarget = .DropHighlight
        .Nodes.Add(loTarget.Key,tvwChild,;
          Sys(2015),;
          Data.GetData(1))
      Endif
    Endwith
    This.DropHighlight = .Null.
  Endproc
Enddefine

Define Class myGrid As Grid
*  OLEDropMode = 1
  OLEDragMode = 1

  Procedure OLEStartDrag
    Lparameters oDataObject, nEffect
    With This
      .OLEDropMode = 0
      Amouseobj(arrMouse,1)
      lnActiveRow = Ceiling( ;
        ( arrMouse[4] - (.Top + .HeaderHeight) ) / .RowHeight )
      .ActivateCell(lnActiveRow,2)
    Endwith
    oDataObject.SetData(myTest.myType,1)
  Endproc

  Procedure OLECompleteDrag
    Lparameters nEffect
    This.OLEDropMode = 1
  Endproc

  Procedure OLEDragOver
    Lparameters oDataObject, nEffect, nButton, nShift, nXCoord, nYCoord, nState
    Local nWhere,nRelRow,nRelCol,nView
    Store 0 To nWhere,nRelRow,nRelCol,nView
    This.GridHitTest(m.nXCoord,m.nYCoord,@nWhere,@nRelRow,@nRelCol,@nView)
    If m.nWhere = 3
      This.ActivateCell(m.nRelRow, m.nRelCol)
    Endif
  Endproc

  Procedure OLEDragDrop
    Lparameters oDataObject, nEffect, nButton, nShift, nXCoord, nYCoord
    If oDataObject.GetFormat(1)
      With This
        .Columns(2).Text1.Value = oDataObject.GetData(1)
      Endwith
    Endif
  Endproc
Enddefine



RETURN 
llswco = 0
SELECT a.order_id, a.ship_to_name as company_name,;
  a.order_number, a.order_date, a.pos_hora,;
  a.cajero, a.mozo, a.swco_ord,;
  b.product_id, b.name_product,;
  b.quantity;
 FROM ;
     tastrade!tmpcomanda1 a ;
    INNER JOIN tastrade!items_comanda1 b ;
   ON  a.order_id = b.order_id;
 WHERE  b.swco_ite = llswco;
 ORDER BY a.order_number INTO CURSOR viewcocina
 
RETURN

CLOSE ALL  && Close tables and databases
OPEN DATABASE (HOME(2) + 'Data\testdata')

USE customer  IN 0  && Opens Customer table

frmMyForm = CREATEOBJECT('Form')  && Create a form
frmMyForm.Closable = .f.  && Disable the window pop-up menu

frmMyForm.AddObject('cmdCommand1','cmdMyCmdBtn')  && Add Command button
frmMyForm.AddObject('grdGrid1','Grid')  && Add Grid control

frmMyForm.grdGrid1.Left = 25  && Adjust Grid position

frmMyForm.grdGrid1.SetAll("DynamicBackColor", "IIF(MOD(RECNO( ), 2)=0, RGB(255,255,255), RGB(0,255,0))", "Column")  && Alternate white and green records

frmMyForm.grdGrid1.Visible = .T.  && Grid control visible
frmMyForm.cmdCommand1.Visible =.T.  && "Quit" Command button visible
frmMyForm.grdGrid1.Column1.Header1.Caption = 'Customer ID'

frmMyForm.SHOW  && Display the form
READ EVENTS  && Start event processing

DEFINE CLASS cmdMyCmdBtn AS CommandButton  && Create Command button
   Caption = '\<Quit'  && Caption on the Command button
   Cancel = .T.  && Default Cancel Command button (Esc)
   Left = 125  && Command button column
   Top = 210  && Command button row
   Height = 25  && Command button height

   PROCEDURE Click
      CLEAR EVENTS  && Stop event processing, close form
      CLOSE ALL  && Close table and database
ENDDEFINE




RETURN 
CLOSE DATABASES
OPEN DATABASE (HOME(2) + 'data\testdata')
USE customer ORDER company  && Open Customer table
CLEAR
@ 2,2 SAY LOOKUP(contact, 'Ernst Handel', company, 'company')

RETURN 
CLOSE DATABASES
OPEN DATABASE c:\sistemas\factura\data\tastrade EXCLUSIVE && Open testdata database

VALIDATE DATABASE RECOVER 

RETURN 
i=4
cad = SPACE(4)
DO WHILE i>0
   nInsert = 1 + 100 * RAND()
   IF BETWEEN(nInsert,65,90) OR BETWEEN(nInsert,48,57)
      Cad = Cad + CHR(nInsert)
      i=i-1
   ENDIF 
ENDDO 
WAIT WINDOW "Caja "+ALLTRIM(cad)
return

FOR nItem = 1 TO 4  && Append 10 records,
   APPEND BLANK
   nInsert = 1 + 100 * RAND()
   IF BETWEEN(nInsert,65,90) OR BETWEEN(nInsert,48,57)
      REPLACE cValue WITH nInsert  && Insert random values
   ELSE 
         
   ENDIF 
ENDFOR
return
CLEAR
LIST  && Display the values
gnMaximum = 1  && Initialize minimum value
gnMinimum = 100  && Initialize maximum value
SCAN 
   gnMinimum = MIN(gnMinimum, cValue)
   gnMaximum = MAX(gnMaximum, cValue)
ENDSCAN
? 'The minimum value is: ', gnMinimum  && Display minimum value
? 'The maximum value is: ', gnMaximum  && Display maximum value

CLEAR
gnLower = 1
gnUpper = 10

? INT((gnUpper - gnLower + 1) * RAND( ) + gnLower)
65-90 A-Z
48-57 0-9
06:04:35 PM


