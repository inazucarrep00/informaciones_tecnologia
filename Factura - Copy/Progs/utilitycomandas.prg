oForm = Createobject('myForm')
oForm.Show(1)

Define Class myForm As Form
  Height = 526
  Width = 1168
  Left = -6
  Top = 1
  DoCreate=.T.
  DataSession=2
  BorderStyle = 3
  BackColor = RGB(214,231,254)
  Caption = 'Comandas'
  WindowType = 1
  nxtwips = .F.
  nytwips = .F.
  

ADD OBJECT txtOrder_number AS TEXTBOX WITH ;
    Left = 41, ;
    Top = 26, ;
    height = 18, ;
    width = 58, ;
    BorderStyle = 0, ;
    BackStyle = 0, ;
    Alignment = 0
    


  Add Object myTree As OleControl With ;
    Top = 88, ;
    Left = 300, ;
    Height = 243, ;
    Width = 250, ;
    Name = "myTree", ;
    OleClass = 'MSComCtlLib.TreeCtrl'

  Add Object myGrid As myGrid With ;
    Top = 88, ;
    Left = 12, ;
    Height = 243, ;
    Width = 281, ;
    Name = "myGrid", ;
    ColumnCount = 2, ;
    GridLineColor = RGB(214,214,214)

  Procedure comandas
  PARAMETERS SeqTabla, Fact

	LOCAL lcPrinter, llswco, lSave, nOldRecNo, encontre, cTabla1, cTabla2
	cTabla1 = 'tmpcomanda' + ALLTRIM(SeqTabla) + ' a'
	cTabla2 = 'items_comanda' + ALLTRIM(SeqTabla) + ' b'

	lSave = SELECT()

	SELECT MAX(swco_ite) AS nMaxsw FROM &cTabla2 WHERE !DELETED() AND VAL(order_id)=VAL(fact) INTO CURSOR qListaMaxSw
	llswco = nMaxsw
	USE IN qListaMaxSw

	SELECT a.order_id, a.ship_to_name as company_name,;
	  a.order_number, a.order_date, a.pos_hora,;
	  a.cajero, a.mozo, a.swco_ord,;
	  b.product_id, b.name_product,;
	  b.quantity;
	 FROM ;
	     &cTabla1 ;
	    INNER JOIN &cTabla2 ;
	   ON  a.order_id = b.order_id;
	 WHERE  b.swco_ite = llswco AND !DELETED();
	 ORDER BY a.order_number INTO CURSOR viewcocina
	 
	  
	REPORT FORM ReporteComandas PREVIEW NOCONSOLE
	       
	       
	SELECT (lSave)
  
  Endproc
  
 
  PROCEDURE cambiacursormouese
  PARAMETERS cambia

	thisform.mousepointer = cambia 
	FOR i = 1 TO THisform.ControlCount &&Controles que contiene el contenerdor formulario 
	   IF !INLIST(UPPER(LEFT(thisform.Controls(i).name,5)),'TIMER')
	      thisform.Controls(i).mousepointer = cambia
	   ENDIF 
	ENDFOR 
  ENDPROC 
  
  
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
    OPEN DATABASE ('C:\SISTEMAS\FACTURA\DATA\' + 'tastrade.dbc')
    SELECT 0
    USE tmpcomanda1
    SELECT 0
    USE items_comanda1 &&ORDER order_id
    SELECT items_comanda1
*    SET RELATION TO order_id INTO items_comanda1 ADDITIVE 
*    SELECT tmpcomanda1
*    GO TOP 

    
*    Create Cursor myTest (myID i, myType c(20))
*    SELECT quantity as cant, name_product FROM items_comanda1 INTO CURSOR myTest
    SELECT quantity, name_product, item_visiblecomanda FROM items_comanda1 INTO table myTest
    
*    For ix = 1 To 20
*      Insert Into myTest (myID,myType) Values (ix,Sys(2015))
*    Endfor
    Locate
    This.pixeltotwips()
  Endproc

  Procedure Refresh
      
  ENDPROC
  
*  Procedure txtOrder_number.Init
*     WITH this
*          .controlSource = 'tmpcomanda1.order_number'
*     ENDWITH 
*   EndProc
  
  Procedure txtOrder_number.GotFocus
      NoDefault
  
  EndProc


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
          SELECT myTest
  	      LOCATE FOR UPPER(name_produ) = UPPER(Data.GetData(1))
    	  IF FOUND()
 	  	      replace item_visib WITH .F. 
          ENDIF
          SET FILTER TO item_visib  
          thisform.myGrid.refresh()
      Endif
    Endwith
    This.DropHighlight = .Null.
  ENDPROC
Enddefine

Define Class myGrid As Grid
  OLEDropMode = 1
  OLEDragMode = 1
  RowSourceType = 1

  
 Procedure init

  WITH this
       .DeleteMark = .F.
       .RecordMark = .F. 
	   .GridLines = 3
	   this.GridLineWidth = 1
	   .ScrollBars = 2 
	   .BackColor = RGB(252,230,193)
       .Columns(1).Name = 'Column1'
       .Columns(2).Name = 'Column2'
	   .Column1.Width = 40
	   .Column2.Width = 220       
*	   .Column1.AddObject("txtQuantity", "TEXTBOX")
*	   .Column1.CurrentControl = "txtQuantity"
*	   .Column2.AddObject("txtDescripcion", "TEXTBOX")
*	   .Column2.CurrentControl = "txtDescripcion"	   
	   .Column1.Header1.caption = 'Cant'
	   .Column2.Header1.caption = 'Descripcion'
*	   .Column1.ControlSource = 'items_comanda1.quantity'
*	   .Column2.ControlSource = 'items_comanda1.name_product'

  ENDWITH 
 Endproc

  Procedure OLEStartDrag
    Lparameters oDataObject, nEffect
    With This
      .OLEDropMode = 0
      Amouseobj(arrMouse,1)
      lnActiveRow = Ceiling( ;
        ( arrMouse[4] - (.Top + .HeaderHeight) ) / .RowHeight )
      .ActivateCell(lnActiveRow,2)
    Endwith
    oDataObject.SetData(myTest.name_produ,1)
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
    o = THISFORM.myTree

    If oDataObject.GetFormat(1)
        SELECT myTest
        SET FILTER TO 
	    LOCATE FOR UPPER(name_produ) = UPPER(oDataObject.GetData(1))
    	IF FOUND()
  	      replace item_visib WITH .T.
    	ENDIF   
    	SET FILTER TO item_visib 
    	thisform.myGrid.refresh()
      	IF !Isnull(o.selectedItem.Index)
        	o.Nodes.Remove(o.SelectedItem.Index)
      	ENDIF
      	With This
        	.Columns(2).Text1.Value = oDataObject.GetData(1)
      ENDWITH
    Endif
  Endproc
Enddefine

