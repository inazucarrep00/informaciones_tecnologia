DEFINE CLASS myform AS FORM
  ADD OBJECT cmdOK AS COMMANDBUTTON
  ADD OBJECT PROTECTED cmdCancel AS COMMANDBUTTON
ENDDEFINE
Utilice el m�todo AddObject para agregar objetos a un contenedor despu�s de crear el objeto contenedor. Por ejemplo, las l�neas de c�digo siguientes crean un objeto Form y le agregan dos botones de comando:

frmMessage = CREATEOBJECT("FORM")
frmMessage.AddObject("txt1", "TEXTBOX")
frmMessage.AddObject("txt2", "TEXTBOX")
Tambi�n puede utilizar el m�todo AddObject en el c�digo de m�todo de una clase. Por ejemplo, la definici�n de clase siguiente utiliza AddObject en el c�digo asociado al evento Init para agregar un control a una columna de cuadr�cula.

DEFINE CLASS mygrid AS GRID
ColumnCount = 3
PROCEDURE Init
  THIS.Column2.AddObject("cboClient", "COMBOBOX")
  THIS.Column2.CurrentControl = "cboClient"
ENDPROC
ENDDEFINE


RETURN


********************************
PUBLIC oform1
oform1 = NEWOBJECT("form1")
oform1.SHOW
RETURN

DEFINE CLASS form1 AS FORM
  TOP = 0
  LEFT = 0
  HEIGHT = 190
  WIDTH = 480
  DOCREATE = .T.
  CAPTION = "Form1"
  NAME = "Form1"

  ADD OBJECT combo1 AS COMBOBOX WITH ;
    COMMENT = "", ;
    ROWSOURCETYPE = 2, ;
    HEIGHT = 25, ;
    INCREMENTALSEARCH = .T., ;
    LEFT = 30, ;
    SELECTONENTRY = .T., ;
    TABINDEX = 2, ;
    TOP = 28, ;
    WIDTH = 350, ;
    INPUTMASK = "", ;
    NAME = "Combo1"

  ADD OBJECT label4 AS LABEL WITH ;
    AUTOSIZE = .T., ;
    FONTBOLD = .T., ;
    BACKSTYLE = 0, ;
    CAPTION = "Uno de la lista o nuevo, desplegado", ;
    HEIGHT = 17, ;
    LEFT = 30, ;
    TOP = 12, ;
    WIDTH = 207, ;
    TABINDEX = 4, ;
    FORECOLOR = RGB(88,99,124), ;
    NAME = "Label4"

  ADD OBJECT command1 AS COMMANDBUTTON WITH ;
    TOP = 12, ;
    LEFT = 408, ;
    HEIGHT = 36, ;
    WIDTH = 49, ;
    CAPTION = "Salir", ;
    TABINDEX = 3, ;
    NAME = "Command1"

  PROCEDURE LOAD
    CAPSLOCK(.F.) && simulo trabajar con minusculas
    PUBLIC mf
    mf = SYS(2015)
    OPEN DATABASE (HOME(2) + "Northwind\Northwind.dbc")
    SELECT 0
    USE Customers
  ENDPROC

  PROCEDURE combo1.INIT
    * Creo propiedad para almacenar configuracion CapsLock
    IF PEMSTATUS(THIS,'lCaps',5) = .F.
      WITH THIS
        .ADDPROPERTY('lCaps',.F.)
      ENDWITH
    ENDIF
    THIS.COMMENT = ''
  ENDPROC

  PROCEDURE combo1.KEYPRESS
    LPARAMETERS nKeyCode, nShiftAltCtrl
    IF BETWEEN(nKeyCode, 32, 122)
      * Primero comprueba la lista
      FOR X=1 TO THIS.LISTCOUNT
        IF UPPER(SUBSTR(THIS.LIST(X), 1, THIS.SELSTART+1)) == ;
            UPPER(SUBSTR(THIS.TEXT, 1, THIS.SELSTART)+CHR(nKeyCode))
          NCURPOS = THIS.SELSTART + 1
          THIS.VALUE = THIS.LIST(X)
          THIS.SELSTART = NCURPOS
          THIS.SELLENGTH = LEN(LTRIM(THIS.LIST(X))) - NCURPOS
          THIS.COMMENT = SUBSTR(THIS.LIST(X),1,NCURPOS)
          NODEFAULT
          EXIT
        ENDIF
      NEXT X
      * Si no est� en la lista
      IF X > THIS.LISTCOUNT
        NCURPOS = LEN(THIS.COMMENT) + 1
        THIS.COMMENT = THIS.COMMENT + CHR(nKeyCode)
        THIS.DISPLAYVALUE = THIS.COMMENT
        THIS.SELSTART = NCURPOS
        NODEFAULT
      ENDIF
    ENDIF
    * Si pulsamos Retroceso o flecha izda.
    IF nKeyCode = 127 OR nKeyCode = 19
      NCURPOS = LEN(THIS.COMMENT) -1
      THIS.COMMENT = LEFT(THIS.COMMENT, NCURPOS)
      THIS.DISPLAYVALUE = THIS.COMMENT
      THIS.SELSTART = NCURPOS
      NODEFAULT
    ENDIF
    IF nKeyCode = 13
      THIS.LOSTFOCUS
    ENDIF
  ENDPROC

  PROCEDURE combo1.LOSTFOCUS
    THIS.ROWSOURCE = ''
    USE IN SELECT('curcombo')
    * Devolvemos config. inicial CapsLock
    CAPSLOCK(THIS.lcaps)
    * Tiempo busqueda incremental predeterminado
    _INCSEEK = 0.5
    *
    *  El dato introducido / seleccionado, se encuentra
    *  en la propiedad 'DisplayValue'.
    *
  ENDPROC

  PROCEDURE combo1.GOTFOCUS
    THIS.lcaps = CAPSLOCK()
    IF CAPSLOCK() = .F.
      CAPSLOCK(.T.) && Fuerzo a may�sculas
    ENDIF
    _INCSEEK = 5.5 && Tiempo busqueda incremental al maximo
    LOCAL cFile, cCampo
    cFile='customers' && Tabla de la que tomar los datos
    cCampo='upper(ltrim(companyname))' && campo a mostrar
    SELECT &cCampo AS cDato FROM &cFile DISTINCT WHERE !EMPTY(&cCampo) ;
      ORDER BY cDato INTO CURSOR curcombo nofilter
    THIS.ROWSOURCE = 'curcombo' && Establecemos origen de datos
    KEYBOARD '{ALT+DNARROW}' && Desplegamos lista
    *
    *  Si le pasamos un valor previo (en la propiedad 'DisplayValue'),
    *  simulamos haberlo tecleado para que se situe en la lista.
    *
    IF !EMPTY(THIS.DISPLAYVALUE)
      cTexto = THIS.DISPLAYVALUE
      FOR yy = 1 TO LEN(cTexto)
        cLetra = SUBSTR(cTexto, yy, 1)
        KEYBOARD cLetra
      ENDFOR
    ENDIF
  ENDPROC

  PROCEDURE command1.CLICK
    * El dato lo obtenemos de la propiedad 'DisplayValue'
    IF !EMPTY(ALLTRIM(THISFORM.combo1.DISPLAYVALUE))
      =MESSAGEBOX(THISFORM.combo1.DISPLAYVALUE)
    ENDIF
    USE IN SELECT('customers')
    CLOSE ALL
    RELEASE mf
    THISFORM.RELEASE
  ENDPROC

ENDDEFINE
*-- EndDefine: form1
**************************************************












RETURN 
#DEFINE tvwFirst 0
#DEFINE tvwLast 1
#DEFINE tvwNext 2
#DEFINE tvwPrevious 3
#DEFINE tvwChild 4

oForm = CREATEOBJECT('myForm')
WITH oForm
  .ADDOBJECT('Tree','myTreeView')
  .ADDOBJECT('Lister','Lister')
  WITH .Tree
    .Nodes.ADD(,0,"root1",'Main node 2')
    .Nodes.ADD(,0,"root2",'Main node 3')
    .Nodes.ADD('root1',4,"child11",'Child11')
    .Nodes.ADD('root1',4,"child12",'Child12')
    .Nodes.ADD('root2',4,"child21",'Child22')
    .Nodes.ADD('child21',3,"child20",'Child21')
    .Nodes.ADD('child11',4,"child111",'child113')
    .Nodes.ADD('child111',3,"child112",'child112')
    .Nodes.ADD('child112',3,"child113",'child111')
    .Nodes.ADD('root1',3,"root0",'Main node 1')
    .VISIBLE = .T.
  ENDWITH
  .Lister.LEFT = .WIDTH - .Lister.WIDTH
  .Lister.VISIBLE = .T.
  .SHOW()
ENDWITH
READ EVENTS

DEFINE CLASS myForm AS FORM
  AUTOCENTER = .T.
  HEIGHT = 640
  WIDTH = 800
  PROCEDURE QUERYUNLOAD
    CLEAR EVENTS
  ENDPROC
ENDDEFINE

DEFINE CLASS myTreeView AS OLECONTROL
  OLEDRAGMODE = 1
  OLEDROPMODE = 1
  NAME = "OleTreeView"
  OLECLASS = 'MSComCtlLib.TreeCtrl'
  HEIGHT = 600
  WIDTH = 700

  PROCEDURE INIT
    WITH THIS
      .linestyle =1
      .labeledit =1
      .indentation = 5
      .PathSeparator = '\'
    ENDWITH
  ENDPROC

  PROCEDURE NodeClick
    *** ActiveX Control Event ***
    LPARAMETERS NODE
    NODE.ensurevisible
    MESSAGEBOX(NODE.FULLPATH,TRANS(NODE.INDEX))
  ENDPROC

  PROCEDURE _SubNodes
    LPARAMETERS tnIndex, tnLevel
    LOCAL lnIndex
    lcFs = ''
    WITH THIS
      ? IIF(tnLevel=0,'',REPLICATE(CHR(9),tnLevel))+.Nodes(tnIndex).TEXT, "[Actual index :"+TRANS(tnIndex)+"]"
      IF .Nodes(tnIndex).Children > 0
        lnIndex  = .Nodes(tnIndex).CHILD.INDEX
        ._SubNodes(lnIndex,tnLevel+1)
        DO WHILE lnIndex # .Nodes(tnIndex).CHILD.LastSibling.INDEX
          lnIndex = .Nodes(lnIndex).NEXT.INDEX
          ._SubNodes(lnIndex,tnLevel+1)
        ENDDO
      ENDIF
    ENDWITH
  ENDPROC
ENDDEFINE

DEFINE CLASS lister AS COMMANDBUTTON
  CAPTION = 'Listado'
  HEIGHT = 32
  WIDTH = 100

  PROCEDURE CLICK
    ACTIVATE SCREEN
    CLEAR
    LOCAL lnIndex
    WITH THISFORM.Tree
      lnIndex = .Nodes(1).Root.FirstSibling.INDEX
      ._SubNodes(lnIndex,0)
      DO WHILE lnIndex # .Nodes(1).Root.LastSibling.INDEX
        lnIndex = .Nodes(lnIndex).NEXT.INDEX
        ._SubNodes(lnIndex,0)
      ENDDO
    ENDWITH
  ENDPROC
ENDDEFINE

RETURN 

*save this code as ymaster.prg
*I disabled the backcolor treeview button (can see the code and test).its a bug in MS treeview version 6).

*Begin code ymaster.prg
Publi ymaster As Form , yslave As Form
ymaster=Newobject("ymast")
ymaster.Show
Read Events
Retu
*

Define Class ymast As Form
    BorderStyle = 3
	Height = 593
	Width = 410
	ShowWindow = 2
	ShowTips = .T.
	AutoCenter = .T.
	Caption = "Treeview"
   Icon = home(4)+"icons\industry\sinewave.ico"
	AlwaysOnTop = .T.
	lexpanded = .F.
	Name = "ymaster"

	Add Object oleimageslist As OleControl With ;
		oleclass="MSComctlLib.ImageListCtrl.2",;
		Top = 0, ;
		Left = 372, ;
		Height = 100, ;
		Width = 100, ;
		Name = "oleImagesList"

	Add Object oletreeview As OleControl With ;
		oleclass="MSComctlLib.TreeCtrl.2",;
		Top = 0, ;
		Left = 0, ;
		Height = 445, ;
		Width = 413, ;
		Anchor = 15, ;
		Name = "oleTreeview"

	Add Object text1 As TextBox With ;
		Anchor = 240, ;
		Height = 25, ;
		Left = 81, ;
		Top = 475, ;
		Width = 314, ;
		Name = "Text1"

	Add Object cmdgetdir As CommandButton With ;
		Top = 475, ;
		Left = 4, ;
		Height = 25, ;
		Width = 72, ;
		Anchor = 240, ;
		Caption = "\<Directory...", ;
		Name = "cmdGetDir"

	Add Object cmdch As CommandButton With ;
		Top = 506, ;
		Left = -1, ;
		Height = 25, ;
		Width = 85, ;
		Anchor = 240, ;
		Caption = "\<Change icon...", ;
		Name = "cmdCh"

	Add Object command3 As CommandButton With ;
		Top = 503, ;
		Left = 291, ;
		Height = 25, ;
		Width = 110, ;
		Anchor = 240, ;
		Caption = "Expand All Nodes", ;
		Name = "Command3"


	Add Object command1 As CommandButton With ;
		Top = 503, ;
		Left = 85, ;
		Height = 25, ;
		Width = 132, ;
		Anchor = 240, ;
		Caption = "Treeview BackColor...", ;
		Enabled = .F., ;
		ToolTipText = "Bug with API painting", ;
		Name = "Command1"

	Add Object command2 As CommandButton With ;
		Top = 552, ;
		Left = 84, ;
		Height = 27, ;
		Width = 132, ;
		Caption = "Treeview forecolor1...", ;
		ToolTipText = "Forecolor method1", ;
		Name = "Command2"

	Add Object command4 As CommandButton With ;
		Top = 557, ;
		Left = 85, ;
		Height = 27, ;
		Width = 132, ;
		Anchor = 240, ;
		Caption = "Treeview forecolor2...", ;
		ToolTipText = "Forecolor method2", ;
		Name = "Command4"

	Add Object command5 As CommandButton With ;
		Top = 532, ;
		Left = 294, ;
		Height = 27, ;
		Width = 84, ;
		Anchor = 240, ;
		Caption = "Font object", ;
		Visible = .T., ;
		Name = "Command5"

	Add Object check1 As Checkbox With ;
		Top = 507, ;
		Left = 222, ;
		Height = 24, ;
		Width = 60, ;
		Anchor = 240, ;
		Alignment = 0, ;
		Caption = "Bold", ;
		Style = 1, ;
		Visible = .T., ;
		Name = "Check1"

	Add Object check2 As Checkbox With ;
		Top = 530, ;
		Left = 223, ;
		Height = 24, ;
		Width = 60, ;
		Anchor = 240, ;
		Alignment = 0, ;
		Caption = "Italic", ;
		Style = 1, ;
		Visible = .T., ;
		Name = "Check2"

	Add Object check3 As Checkbox With ;
		Top = 556, ;
		Left = 225, ;
		Height = 24, ;
		Width = 60, ;
		Anchor = 240, ;
		Alignment = 0, ;
		Caption = "Underline", ;
		Style = 1, ;
		Visible = .T., ;
		Name = "Check3"

	Add Object command6 As CommandButton With ;
		Top = 563, ;
		Left = 297, ;
		Height = 25, ;
		Width = 110, ;
		FontBold = .T., ;
		FontSize = 8, ;
		Anchor = 240, ;
		Caption = "yAlpha_Backcolor", ;
		ToolTipText = "Alpha backcolor ", ;
		ForeColor = Rgb(255,0,0), ;
		BackColor = Rgb(0,255,0), ;
		Name = "Command6"

	Add Object command7 As CommandButton With ;
		Top = 560, ;
		Left = 1, ;
		Height = 27, ;
		Width = 84, ;
		FontBold = .T., ;
		FontSize = 8, ;
		Anchor = 240, ;
		Caption = "yAlpha_Image...", ;
		ForeColor = Rgb(255,0,0), ;
		BackColor = Rgb(0,255,0), ;
		Name = "Command7"

	Add Object optiongroup1 As OptionGroup With ;
		AutoSize = .T., ;
		ButtonCount = 1, ;
		Anchor = 240, ;
		BackStyle = 0, ;
		BorderStyle = 0, ;
		Value = 1, ;
		Height = 27, ;
		Left = 27, ;
		Top = 532, ;
		Width = 28, ;
		Name = "Optiongroup1", ;
		Option1.BackStyle = 0, ;
		Option1.Caption = "", ;
		Option1.Value = 1, ;
		Option1.Height = 17, ;
		Option1.Left = 5, ;
		Option1.MousePointer = 15, ;
		Option1.ToolTipText = "image or backcolor", ;
		Option1.Top = 5, ;
		Option1.Width = 18, ;
		Option1.AutoSize = .T., ;
		Option1.Name = "Option1"

	Add Object label1 As Label With ;
		AutoSize = .T., ;
		FontBold = .T., ;
		FontSize = 18, ;
		Anchor = 240, ;
		BackStyle = 0, ;
		Caption = "?", ;
		Height = 32, ;
		Left = 380, ;
		MousePointer = 15, ;
		Top = 531, ;
		Width = 17, ;
		ForeColor = Rgb(0,255,0), ;
		ToolTipText = "Summary help", ;
		Name = "Label1"

	Procedure filltree
		Parameters m.path, m.nlevel, m.nCount
		Local DirArr,i,nTotDir,lvl,pkey
		m.path = Alltrim(m.path)

		If Parameters()<2 Or Type("m.nlevel") #"N"
			lvl = 0
		Else
			lvl = m.nlevel
		Endif

		If Parameters()<2 Or Type("m.nCount") #"N"
			Cnt = 0
		Else
			Cnt = m.nCount
		Endif

		lvl = lvl + 1
		Cnt = Cnt + 1
		pkey = Lower(Substr(m.path,1,Rat("\",m.path,2)))+"_"

		* Add items to treeview control
		o = This.oletreeview
		If Cnt = 1
			oNode = o.nodes.Add(,1,Lower(m.path)+"_",Lower(m.path),,)
			oNode.Image ="openfolder14"  &&14th icon of vfp graphics.. win95 folder
		Else
			oNode = o.nodes.Add(m.pkey,4,Lower(m.path)+"_",Lower(m.path),,)
			oNode.Image="openfolder2"   &&closeFolder"  &&can put many function of level cnt
		Endif

		Dimension DirArr[1,1]
		nTotDir=Adir(DirArr,m.path+"*.","D")
		Asort(DirArr)

		For i = 1 To m.nTotDir
			If DirArr[m.i,1] != '.' And Atc('D',DirArr[m.i,5])#0
				This.filltree(m.path+DirArr[m.i,1]+'\', m.lvl, m.cnt)
			Endif
		Endfor
	Endproc

	Procedure ycolor
		&&from Doug Henning and same article in  http://support.microsoft.com/kb/178491
		Lparameters toTree, ;
			tnColor
		Local lnhWnd, ;
			loNode, ;
			lnStyle
		* Declare some Windows API functions and constants we need.
		Declare Long GetWindowLong In Win32API Long HWnd, Long nIndex
		Declare Long SetWindowLong In Win32API Long HWnd, Long nIndex, ;
			long dwNewLong
		Declare SendMessage In Win32API Long HWnd, Long Msg, Long wParam, ;
			long Lparam
		#Define GWL_STYLE -16
		#Define TVM_SETBKCOLOR 4381
		#Define TVS_HASLINES 2

		* Get the TreeView's window handle.
		lnhWnd = toTree.HWnd

		* Set the BackColor for every node.
		For Each loNode In toTree.nodes
			loNode.BackColor = tnColor
		Next loNode

		* Set the BackColor for the TreeView's window.
		SendMessage(lnhWnd, TVM_SETBKCOLOR, 0, tnColor)

		* Get the current style, then temporarily hide lines and redisplay them so
		* they'll redraw in the new color.
		lnStyle = GetWindowLong(lnhWnd, GWL_STYLE)
		SetWindowLong(lnhWnd, GWL_STYLE, Bitxor(lnStyle, TVS_HASLINES))
		SetWindowLong(lnhWnd, GWL_STYLE, lnStyle)
	Endproc

	Procedure zcolor
		Lparameters toTree, ;
			tnColor
		Local lnhWnd, ;
			loNode, ;
			lnStyle
		* Declare some Windows API functions and constants we need.
		Declare Long GetWindowLong In Win32API Long HWnd, Long nIndex
		Declare Long SetWindowLong In Win32API Long HWnd, Long nIndex, ;
			long dwNewLong
		Declare SendMessage In Win32API Long HWnd, Long Msg, Long wParam, ;
			long Lparam
		#Define GWL_STYLE -16
		#Define TVM_SETBKCOLOR 4381
		#Define TVS_HASLINES 2
		#Define TVM_SETTEXTCOLOR 0x111E

		*!define TVM_SETBKCOLOR 0x111D ;Window Message Background
		*!define TVM_SETTEXTCOLOR 0x111E ;Window Message Text

		* Get the TreeView's window handle.
		lnhWnd = toTree.HWnd
		* Set the BackColor for every node.
		For Each loNode In toTree.nodes
			loNode.ForeColor = tnColor
		Next loNode
		* Set the BackColor for the TreeView's window.
		SendMessage(lnhWnd, TVM_SETTEXTCOLOR, 0, tnColor)

		* Get the current style, then temporarily hide lines and redisplay them so
		* they'll redraw in the new color.
		lnStyle = GetWindowLong(lnhWnd, GWL_STYLE)
		SetWindowLong(lnhWnd, GWL_STYLE, Bitxor(lnStyle, TVS_HASLINES))
		SetWindowLong(lnhWnd, GWL_STYLE, lnStyle)
	Endproc

	Procedure yactions
		Lparameters yindex
		Messagebox("-node index="+Trans(yindex)+  " --- execute any vfp action from here",0+32+4096,"",2000)

		*can make actions to execute from here
		*do case
		*case yindex=1
		*execute any action....
		*case yindex=2
		*...........
		*case yindex=n
		*....
		*endcase
	Endproc

	Procedure my1
		Thisform.LockScreen=.T.

		With yslave
			If ymaster.WindowState=1
				.Hide()
			Else
				.Top=This.Top
				.Left=This.Left
				.Width=This.Width
				.Height=This.Height
				.Show()
			Endi
		Endwith
		Thisform.LockScreen=.F.
	Endproc

	Procedure Destroy
		Set Defa To (yrep)
		Clear Events
	Endproc

	Procedure Unload
		yslave.Release
	Endproc

	Procedure Init

		m.yrep=Addbs(Justpath(Sys(16,1 )))     && for form :sys(1271,this)))
		Set Default To (yrep)

		This.SetAll("mousepointer",15,"commandbutton")
		This.SetAll("mousepointer",15,"checkBox")

		If  Fontmetric(1, 'MS Sans Serif', 8, '') # 13 Or ;
				fontmetric(4, 'MS Sans Serif', 8, '') # 2 Or ;
				fontmetric(6, 'MS Sans Serif', 8, '') # 5 Or ;
				fontmetric(7, 'MS Sans Serif', 8, '') # 11
			This.SetAll('fontname', 'Tahoma')
		Else
			This.SetAll('fontname','MS Sans Serif')
		Endif
		This.SetAll('fontsize',8)
		This.label1.FontSize=18
		* Check to see if OCX installed and loaded.
		If Type("THIS.oleTreeview") # "O" Or Isnull(This.oletreeview)
			Return .F.
		Endif
		* Check to see if OCX installed and loaded.
		If Type("THIS.oleImagesList") # "O" Or Isnull(This.oleimageslist)
			Return .F.
		Endif

		This.oletreeview.ImageList = This.oleimageslist   &&.object

		#Define LWA_COLORKEY 1
		#Define LWA_ALPHA 2
		#Define GWL_EXSTYLE -20
		#Define WS_EX_LAYERED 0x80000

		Local nExStyle, nRgb, nAlpha, nFlags
		nExStyle = GetWindowLong(Thisform.HWnd, GWL_EXSTYLE)
		nExStyle = Bitor(nExStyle, WS_EX_LAYERED)
		= SetWindowLong(Thisform.HWnd, GWL_EXSTYLE, nExStyle)
		= SetLayeredWindowAttributes(Thisform.HWnd, 0, 200,LWA_ALPHA)   &&LWA_COLORKEY+

		Do yslave.prg  With This.Top,This.Left,This.Width,This.Height-Thisform.cmdgetdir.Height-5

		Bindevent(Thisform,"moved",Thisform,"my1")
		Bindevent(Thisform,"resize",Thisform,"my1")
	Endproc

	Procedure Load
		Publi m.yrep, yfolderIcons,m.gnbre
		m.gnbre=0
		m.yfolderIcons=Home(4)+"icons\win95\"   &&folder where the icons stay.HERE its for ex. in the vfp9 graphics icons folder

		Declare Integer GetWindowLong In user32;
			INTEGER HWnd, Integer nIndex

		Declare Integer SetWindowLong In user32;
			INTEGER HWnd, Integer nIndex, Integer dwNewLong

		Declare Integer SetLayeredWindowAttributes In user32;
			INTEGER HWnd, Integer crKey,;
			SHORT bAlpha, Integer dwFlags

		Declare Integer Sleep In kernel32 Integer
	Endproc

	Procedure oleimageslist.Init
		With This
			.ImageHeight = 16
			.ImageWidth =  16
			gnbre=Adir(gabase,m.yfolderIcons+"*.ico")
			xx=""
			For i=1 To gnbre
				.ListImages.Add(,"openfolder"+Trans(i),LoadPicture(m.yfolderIcons+gabase(i,1)) ) &&populate the imagelist object with desired icons
				Sleep(10)
			Endfor
		Endwith
		Sleep(100)
	Endproc

	Procedure oletreeview.NodeClick
		*** �v�nement de contr�le ActiveX  ***
		Lparameters Node
		Thisform.yactions(Node.Index)
	Endproc

	Procedure oletreeview.Init
		With This
			.HotTracking = .T.
			.Indentation = 20
			.LabelEdit = 1		&& no edit
			.lineStyle=1
			.Style=7
			.Scroll = .T.
		Endwith

		This.ImageList = Thisform.oleimageslist.Object
	Endproc

	Procedure text1.Init
		With This
			.		FontName = "MS Sans Serif"
			.		FontSize = 8
			.		Enabled = .F.
			.		Height = 23
			.		DisabledForeColor = Rgb(0,0,0)
			.		Name = "Text1"
		Endwith
	Endproc

	Procedure cmdgetdir.Init
		With This
			.FontName = "MS Sans Serif"
			.FontSize = 8
			.Caption = "\<Directory..."
			.Name = "cmdGetDir"
		Endwith
	Endproc

	Procedure cmdgetdir.Click
		Local cDir
		Set Defa To Home(1)
		cDir = Getdir()
		If Empty(m.cDir)
			Return
		Endif

		Thisform.text1.Value = m.cDir
		Thisform.oletreeview.nodes.Clear
		Thisform.filltree(m.cDir)

		Thisform.cmdch.Enabled=.T.
		Thisform.cmdch.Click()

		Thisform.Caption="Treeview ["+Trans(Thisform.oletreeview.nodes.Count)+" nodes]"
	Endproc

	Procedure cmdch.Click

		j=1
		For i=1 To Thisform.oletreeview.nodes.Count
			oNode=Thisform.oletreeview.nodes(i)
			If j>gnbre
				j=1
			Endi

			oNode.Image ="openfolder"+Trans(j)
			j=j+1
		Endfor
		Thisform.oletreeview.nodes(1).Image="openfolder14"
	Endproc

	Procedure cmdch.Init
		With This
			.FontName = "MS Sans Serif"
			.FontSize = 8
			.Caption = "\<Change icon..."
			.Enabled=.F.
			.Visible=.F.
			.Name = "cmdCh"
		Endwith
	Endproc

	Procedure command3.Init
		With This
			.FontBold = .T.
			.Caption = "Expand All Nodes"
			.ToolTipText = "Expands all nodes (Expanded property set to .T.)"
			.Name = "cmdExpandCollapse"
		Endwith

	Endproc

	Procedure command3.Click

		If Thisform.oletreeview.nodes.Count > 0
			* only do this if we have nodes in the treeview
			For Each loNode In Thisform.oletreeview.nodes
				If loNode.Children > 0
					* only do this if this node has child nodes
					loNode.Expanded = !Thisform.lexpanded
				Endif
			Endfor
			* set form's Expanded property to new value
			Thisform.lexpanded = !Thisform.lexpanded
			* update Caption for this command button
			This.Caption = Iif(Thisform.lexpanded,"Collapse","Expand") + " All Nodes"
			* update ToolTipText property
		Endif
	Endproc

	Procedure command1.Click
		Local xcolor
		m.xcolor=Getcolor()
		If Not Empty(m.xcolor) And m.xcolor#-1
			Thisform.ycolor(Thisform.oletreeview,m.xcolor)
		Endi
	Endproc

	Procedure command2.Click
		xcolor=Getcolor()
		If Empty(xcolor) And m.xcolor#-1
			Return .F.
		Endi


		If Thisform.oletreeview.nodes.Count > 0
			i=0
			For Each loNode In Thisform.oletreeview.nodes
				i=i+1
				Thisform.oletreeview.nodes(i).ForeColor=m.xcolor
			Endfor
			Thisform.oletreeview.Refresh
		Endif
	Endproc

	Procedure command4.Click
		Local xcolor
		m.xcolor=Getcolor()
		If Not Empty(xcolor) And m.xcolor#-1
			Thisform.zcolor(Thisform.oletreeview,m.xcolor)
		Endi
	Endproc

	Procedure command5.Click
		*CreateFont $1 "Comic Sans Ms" 8 0
		*SendMessage $0 ${WM_SETFONT} $1 0
		Messagebox("fontname="+Thisform.oletreeview.Font.Name+Chr(13)+"size="+Trans(Thisform.oletreeview.Font.Size,"999") ,0+32,"font set")
		x=Getfont()
		Try
			Thisform.oletreeview.Font.Name=Getwordnum(x,1,",")
			Thisform.oletreeview.Font.Size=Getwordnum(x,2,",")
		Catch
		Endtry
	Endproc

	Procedure check1.Click

		Thisform.oletreeview.Font.bold=!Thisform.oletreeview.Font.bold
	Endproc

	Procedure check2.Click
		Thisform.oletreeview.Font.Italic=!Thisform.oletreeview.Font.Italic
	Endproc

	Procedure check3.Click
		Thisform.oletreeview.Font.UnderLine=!Thisform.oletreeview.Font.UnderLine
	Endproc

	Procedure command6.Click
		Local xcolor
		m.xcolor=Getcolor()
		If Not Empty(m.xcolor) And m.xcolor#-1
			yslave.image1.Visible=.F.
			yslave.BackColor=m.xcolor
		Endi
	Endproc
	Procedure command7.Click
		yslave.image1.Picture=Getpict()
		yslave.image1.Visible=.T.
	Endproc

	Procedure optiongroup1.Option1.Click
		yslave.image1.Visible=!yslave.image1.Visible
	Endproc

	Procedure label1.Click
		Local m.myvar
		TEXT to m.myvar textmerge noshow
This buid a treeview (version6.0   )
The MSCOMCTL32 treeview have a bug in painting with API its
backcolor.there is some area not painting.I guess there is no
no correction of this bug at this time.
One solution is to embed same  treeview but version5.

To replace this effect and more i make :
-a second form "yslave"(alwaysonBottom=.t.) and bindevent the ymaster
form (events:resize,moved) to have always this form glued  behind
the first form (alwaysontop=.t.).the 2 forms are top evel.
i  apply to master form some transparency (color+alpha).
i can change (at runtime) the (backcolor & picture properties) of
yslave form.
With this i can have a semi transparent treeview with alpha
backcolor and alpha picture

Author: Yousfi Benameur El Bayadh Algeria
	Foxite 09 november 2014
		ENDTEXT
		Messagebox(m.myvar,0+32+4096,"Summary Help")
	Endproc

Enddefine
*

*End code ymaster.prg











RETURN 




RELEASE goForm
PUBLIC goForm as mytreeform OF ddtree2.prg

goForm = CREATEOBJECT( "myTreeForm" )
goForm.show

RETURN

DEFINE CLASS myTreeForm  AS form

  Top = 0
  Left = 0
  Height = 253
  Width = 375
  DoCreate = .T.
  OLEDropMode = 0
  Caption = "TreeView Test"
  Name = "myTreeForm"


  ADD OBJECT TV1 AS myTreeView WITH ;
      Top = 0, ;
      Left = 0, ;
      Height = 252, ;
      Width = 180, ;
      Name = "TV1"

  ADD OBJECT text1 AS textbox WITH ;
      OLEDragMode = 1, ;
      Height = 23, ;
      Left = 204, ;
      Top = 36, ;
      Width = 156, ;
      Name = "Text1"

  ADD OBJECT commandcancel AS myCancel WITH ;
      Top = 156, ;
      Left = 216, ;
      Height = 27, ;
      Width = 84, ;
      Cancel = .T., ;
      Caption = "Cancel", ;
      Name = "commandCancel"
ENDDEFINE

DEFINE CLASS myTreeView as OleControl
  oleclass = 'MSComctlLib.TreeCtrl'

  PROCEDURE Init

    this.object.oledropmode = 1

    this.Nodes.Add( .null., 0, "A1", "Drop text here" )

  ENDPROC

  PROCEDURE OLEDragOver
    *** ActiveX Control Event ***
    LPARAMETERS oData, effect, button, shift, x, y, state
    LOCAL loNode
    IF oData.GetFormat(1) && 1=text
       loNode = THIS.HitTest( 15*x, 15*y )
       effect = 2
       THIS.DropHighlight = loNode
    ELSE
       effect = 0
    ENDIF
  ENDPROC

  PROCEDURE OLEDragDrop
    *** ActiveX Control Event ***
    LPARAMETERS oData, effect, button, shift, x, y
    LOCAL lcData, loNode
    IF oData.GetFormat(1) && text-format
       THIS.DropHighlight = .NULL.
       effect =2
       lcData = oData.GetData(1) && text-format
       loNode = THIS.HitTest( 15*x,15*y )
       MessageBox( 'Node at ('+TRANSFORM(x)+','+transform(y)+') Got data: ' + lcData )
       if VarType(loNode)='O'
          this.nodes.Add( loNode, 4, "A" + SYS(3), lcData )
          loNode.expanded = .t.
       else
          this.nodes.Add( .null., 0, "A" + SYS(3), lcData )
       endif
    ENDIF
  ENDPROC

ENDDEFINE

DEFINE CLASS myCancel as CommandButton

  PROCEDURE Click
    thisform.release()
  ENDPROC

ENDDEFINE




*save this code as yslave.prg  in same folder

*Begin code yslave
Parameters xtop,xleft,xwidth,xheight
If Pcount()<>4
    Return .F.
Endif

yslave=Newobject("yslave_")
yslave.Show(1)
Retu
*
Define Class yslave_ As Form
	BorderStyle = 3
	Top = 1
	Left = 75
	Height = 358
	Width = 382
	ShowWindow = 2
	ShowInTaskbar = .F.
	Caption = ""
	ControlBox = .F.
	AlwaysOnBottom = .T.
	Name = "yslave"

	Add Object image1 As Image With ;
		Anchor = 15, ;
		Stretch = 2, ;
		Height = 360, ;
		Left = 0, ;
		Top = 0, ;
		Visible = .F., ;
		Width = 385, ;
		Name = "Image1"

	Procedure Init
		With Thisform
			.Top    =xtop
			.Left   =xleft
			.Width  =xwidth
			.Height =xheight
			.BackColor=255
		Endwith
	Endproc

Enddefine
*Endcode yslave







RETURN 
* TreeView101.prg
* creates a treeview
* By CarlKarsten

RELEASE goOtForm
PUBLIC goOtForm

* Create a form with a treeview on it
goOtForm = CREATEOBJECT( "cForm" )

* do some things to the treeview
* Add the first node (aka the Root)
goOtForm.tree1.Nodes.Add( , , "A1", "Hello" )

* Add a child, under the Root (4)
loNode = goOtForm.tree1.Nodes.item["A1"]
goOtForm.tree1.Nodes.Add( loNode, 4, "A2", "World" )

* Make the A2 node visible
goOtForm.tree1.Nodes.item["A2"].EnsureVisible()

* Add 20 more nodes under A2
loNode = goOtForm.tree1.Nodes.item["A2"]
For lnI = 1 to 20
	lcKey = "B" + Transform(lnI)
	goOtForm.tree1.Nodes.Add( loNode, 4, lcKey, "Moon " + Transform(lnI) )
endfor

* Expand the A2 subtree (scrools the A1 off the top)
goOtForm.tree1.Nodes.item["A2"].Expanded = .t.

* Make the A1 node visible again
loNode = goOtForm.tree1.Nodes.item["A1"].EnsureVisible()

Return


DEFINE CLASS cForm as Form

	PROCEDURE init( toBO )

		WITH this
			
			.show()
			
			.AddObject('cmdCancel', 'cCancel' )
			.cmdCancel.visible = .t.
			
			.AddObject('tree1', 'olecontrol', 'COMCtl.treectrl')
			WITH .tree1
				.visible = .t.
				.height = thisform.height - 35
				.width = thisform.width - 20
			ENDWITH
		ENDWITH

		RETURN

	endproc
	
ENDDEFINE
	
DEFINE CLASS cCancel as CommandButton
	CANCEL = .t.
	caption = "Cancel"
	PROCEDURE init
		this.Height = 25
		this.Top = thisform.height - this.Height - 5
		this.left = thisform.width - this.Width - 5
	endproc
	PROCEDURE click
		thisform.release
	ENDPROC
ENDDEFINE


* Assign an ImageList to the treeview
OleTree.ImageList = OleImagesList.Object

* Load a picture in the ImageList and set an alias for the picture
strImgKey = "MyImageCaption" && sets an alias for the image
objImage = OleImagesList.ListImages.Add(, , LoadPicture(strPath)) && Load an icon and return the ListImage Object
objImage.Key = strImgKey
ImageListIndex = OleImagesList.ListImages(strImgKey).index

* Adding Nodes to the Treeview
strNodeIndex = "_1"
strText = "Parent"
oleTree.Nodes.add(,,strNodeIndex,strText, ImageListIndex) && adds a Top
Level Node
strParentNodeIndex = "_1"
strNodeIndex = "_2"
strText = "Child"
oleTree.Nodes.add(strParentNodeIndex, 4, strNodeIndex, strText,
ImageListIndex) && adds a child node


Textbox.OLEDragMode = 1 && automatic

* TreeView's Init:
this.Nodes.Add( .null., 0, "A1", "Drop text here" )

* In the TreeView's OLEDragOver event:
*** ActiveX Control Event ***
LPARAMETERS oData, effect, button, shift, x, y, state
LOCAL loNode
IF oData.GetFormat(1) && 1=text
   loNode = THIS.HitTest( x*15, y*15 )
   THIS.DropHighlight = loNode
ENDIF

* In the OLEDragDrop event of the TreeView:
*** ActiveX Control Event ***
LPARAMETERS oData, effect, button, shift, x, y
LOCAL lcData, loNode
IF oData.GetFormat(1) && text-format

   THIS.DropHighlight = .NULL.
   lcData = oData.GetData(1) && text-format
   loNode = THIS.HitTest( x*15,y*15 )
   MessageBox( 'Node at ('+TRANSFORM(x)+','+transform(y)+') Got data: ' + lcData )
   if VarType(loNode)='O'
	   this.nodes.Add( loNode, 4, "A" + SYS(3), lcData )
	   loNode.expanded = .t.
   else
	   this.nodes.Add( .null., 0, "A" + SYS(3), lcData )
   endif

ENDIF

