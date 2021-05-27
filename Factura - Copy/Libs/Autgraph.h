*- AUTGRAPH.H
*- #DEFINEs for AUTGRAPH.VCX

#DEFINE L_DEBUG .F.

*- localize these
#DEFINE ALERTTITLE_LOC			"Asistentes de Microsoft Visual FoxPro"

#DEFINE		OS_W32S				1
#DEFINE		OS_NT				2
#DEFINE		OS_WIN95			3

#DEFINE 	HKEY_CLASSES_ROOT   -2147483648  && BITSET(0,31)
#DEFINE 	HKEY_CURRENT_USER   -2147483647  && BITSET(0,31)+1
#DEFINE 	HKEY_LOCAL_MACHINE  -2147483646  && (( HKEY ) 0x80000002 )

#DEFINE 	ERROR_SUCCESS		0

#DEFINE		C_GRAPHDBF			"vfpgraph.dbf"
#DEFINE		C_GRAPHSCX			"vfpgraph.scx"

#DEFINE MSGRAPH_CLASS		"MSGraph.Chart"		&& version of MS Graph needed
#DEFINE MSGRAPH_8_CLASS		"MSGraph.Chart.8"	&& class of MS Graph needed
#DEFINE MSGRAPH_VERSION		5					&& version of MS Graph needed
#DEFINE MSGRAPH_APPNAME		"Microsoft Graph"	&& app name returned by application.name
#DEFINE MAX_MSGRAPH 		4000
#DEFINE MAX_DATAPOINTS		100
#DEFINE PIETYPE 			5
#DEFINE TAB 				CHR(9)
#DEFINE CRLF 				CHR(13)+CHR(10)
#DEFINE IS_NO				7
#DEFINE IS_YES				6
#DEFINE IS_CANCEL			2
#DEFINE OKCAN_DIALOG		33
#DEFINE YESNOCAN_DIALOG		35
#DEFINE YESNO_DIALOG		36
#DEFINE NO_BTN				256
#DEFINE I_DEFAULTGALLERY	21

#DEFINE C_BADMSGRAPH_LOC	"Al parecer, Microsoft Graph no est� instalado correctamente. La �ltima versi�n de Graph est� disponible en Microsoft Office."
#DEFINE C_NOMSGRAPH_LOC		"No se pudo encontrar el archivo MS Graph. Vu�lvalo a instalar desde Microsoft Office."
#DEFINE C_MSGRAPHVER_LOC	"Debe tener cargada la versi�n 8.0 de MS Graph. Instale la versi�n correcta desde Microsoft Office."
#DEFINE C_NOSOURCE_LOC		"No se ha seleccionado ning�n origen de datos. La herramienta de automatizaci�n de gr�ficos ha finalizado."
#DEFINE C_SAVEPROMPT1_LOC	"Guardar el gr�fico en la tabla:"
#DEFINE C_SAVEPROMPT2_LOC	"Guardar el gr�fico en la consulta:"
#DEFINE C_SAVEPROMPT3_LOC	"Guardar el gr�fico en el formulario:"
#DEFINE C_FILEINUSE_LOC		"La tabla que ha seleccionado ya est� en uso."
#DEFINE C_READONLY_LOC		"La tabla que ha seleccionado es de s�lo lectura."
#DEFINE C_NODATAPOINTS_LOC	"No hay datos que representar."
#DEFINE C_MAXGRAPH_LOC		"Tiene m�s de " + ALLTRIM(STR(MAX_MSGRAPH)) + " registros en la tabla. "+"Esta cantidad supera el valor m�ximo permitido por MS Graph."

#DEFINE C_TOOMANYPOINTS_LOC	"Tiene m�s de "+ALLTRIM(STR(MAX_DATAPOINTS))+" registros para representar gr�ficamente. "+"Puede que haya demasiados puntos en el gr�fico y sea dif�cil su lectura. "+							"�Desea preparar el gr�fico?"


#DEFINE C_BADCATEGORY_LOC	"El campo de categor�a especificado no est� en la tabla seleccionada."
#DEFINE C_NOTNUMERIC_LOC	"No todos los campos de datos elegidos son num�ricos. "+"�Desea continuar representando s�lo las series num�ricas?"

#DEFINE C_BADDATAFIELD_LOC	"Uno de los campos de datos no est� en la tabla seleccionada."
#DEFINE C_NODATAFLDS_LOC	"No se encontraron campos con datos num�ricos"
#DEFINE C_WAITDATA_LOC		"Agregando datos al gr�fico..."
#DEFINE C_WAITFORMAT_LOC	"Dando formato al gr�fico..."
#DEFINE C_HADERROR_LOC		"Error al escribir el gr�fico en la tabla seleccionada. "+"Compruebe si la tabla ya est� en uso."

#DEFINE C_OLEERROR_LOC		"No se pudo continuar por un error de OLE."

#DEFINE C_BADFIELDS_LOC		"La tabla de gr�fico de origen no tiene un campo General v�lido."
#DEFINE C_APPENDREC_LOC		"Ha seleccionado una tabla que ya existe. "+"Elija S� para anexar el gr�fico a la tabla existente o No para crear una nueva tabla."

#DEFINE C_NOAPPENDREC_LOC	"Ha seleccionado una tabla que no tiene un campo General para agregar el gr�fico. "+"�Desea crear una nueva tabla?"


#DEFINE C_CLOSE_LOC			"Cerrar"
#DEFINE C_FORMCAPTION_LOC	"Gr�fico de VFP"
#DEFINE C_PRVWCAPTION_LOC	"Vista previa del gr�fico"

#IF 1
	*- chart types for Graph5
	#DEFINE I_AREA_GRAPH		1
	#DEFINE I_AREA3D_GRAPH		9
	#DEFINE I_BAR_GRAPH			2
	#DEFINE I_BAR3D_GRAPH		10
	#DEFINE I_COLUMN_GRAPH		3
	#DEFINE I_COLUMN3D_GRAPH	11
	#DEFINE I_PIE_GRAPH			7
	#DEFINE I_PIE3D_GRAPH		8
	#DEFINE I_LINE_GRAPH		1
	#DEFINE I_LINE3D_GRAPH		12
	#DEFINE I_HILO_GRAPH		8
	#DEFINE I_HILOCOLOR_GRAPH	7
#ELSE
	#DEFINE I_AREA_GRAPH		76
	#DEFINE I_AREA3D_GRAPH		78
	#DEFINE I_BAR_GRAPH			57
	#DEFINE I_BAR3D_GRAPH		60
	#DEFINE I_COLUMN_GRAPH		51
	#DEFINE I_COLUMN3D_GRAPH	54
	#DEFINE I_PIE_GRAPH			5
	#DEFINE I_PIE3D_GRAPH		-4102
	#DEFINE I_LINE_GRAPH		4
	#DEFINE I_LINE3D_GRAPH		-4101
	#DEFINE I_HILO_GRAPH		88
	#DEFINE I_HILOCOLOR_GRAPH	88
#ENDIF
