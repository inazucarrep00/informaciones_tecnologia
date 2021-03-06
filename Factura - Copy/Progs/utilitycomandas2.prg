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
  OLEDropMode = 1
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