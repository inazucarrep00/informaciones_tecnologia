* _UTILITY.H

***********************************
* Constants for classes
#DEFINE MB_ICONEXCLAMATION		48
#DEFINE MB_QUESTIONYESNO	36
#DEFINE MB_ISYES			6

***********************************
* strings for _filer classes

#DEFINE ERR_NOCLASS_LOC	"No se pudo crear una instancia del objeto Filer COM. Aseg?rese de que est? registrado correctamente."
#DEFINE C_FILERCLASS	"filer.fileutil"
#DEFINE ERR_NOFILERDLL_LOC	"Debe tener FILER.DLL para poder utilizar esta utilidad."
#DEFINE MSG_REGFILERDLL_LOC	"El objeto Filer COM no est? registrado, ?desea registrarlo?"
#DEFINE C_FILERDLL	"FILER.DLL"
#DEFINE C_FILERPATH	"FILER\"


***********************************
* strings for _fileversion classes

#DEFINE CRLF	CHR(13)+CHR(10)
#DEFINE FILEVER_COMMENT_LOC 		"Comentarios: "
#DEFINE FILEVER_COMPANY_LOC 		"Nombre de la organizaci?n: "
#DEFINE FILEVER_FILEDESC_LOC 		"Descripci?n de archivo: "
#DEFINE FILEVER_FILEVER_LOC 		"Versi?n de archivo: "
#DEFINE FILEVER_INTERNAL_LOC		"Nombre interno: "
#DEFINE FILEVER_COPYRIGHT_LOC	 	"Copyright legal: "
#DEFINE FILEVER_TRADMARK_LOC		"Marcas comerciales legales: "
#DEFINE FILEVER_FILENAME_LOC	 	"Nombre de archivo original: "
#DEFINE FILEVER_PRIVATE_LOC 		"Revisi?n privada: "
#DEFINE FILEVER_PRODUCTNAME_LOC		"Nombre del producto: "
#DEFINE FILEVER_PRODUCTVER_LOC	 	"Versi?n del producto: "
#DEFINE FILEVER_SPECIAL_LOC			"Revisi?n especial: "
#DEFINE FILEVER_LANGUAGE_LOC		"Idioma: "
#DEFINE FILEVER_NOVERSION_LOC		"No se ha encontrado informaci?n de versi?n."
#DEFINE MSG_FILEVERSION_LOC			"Informaci?n de versi?n para: "

***********************************
* strings for _graphbyrecord classes

#DEFINE C_NOALIAS_LOC	"Debe tener un cursor seleccionado."
#DEFINE C_RECDESC_LOC	"Registro:"
#DEFINE ERR_NOGRAPH_LOC	"No se pudo generar el gr?fico. Intente cambiar la propiedad Tipo de gr?fico o Dibujar por."

#DEFINE C_AREA_GRAPH		"Area"
#DEFINE C_AREA3D_GRAPH		"3D Area"
#DEFINE C_BAR_GRAPH			"Bar"
#DEFINE C_BAR3D_GRAPH		"3D Bar"
#DEFINE C_COLUMN_GRAPH		"Column"
#DEFINE C_COLUMN3D_GRAPH	"3D Column"
#DEFINE C_PIE_GRAPH			"Pie"
#DEFINE C_PIE3D_GRAPH		"3D Pie"
#DEFINE C_LINE_GRAPH		"Line"
#DEFINE C_LINE3D_GRAPH		"3D Line"
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



***********************************
* strings for _typelib classes

#DEFINE TYPELIBSPACING			SPACE(0)
#DEFINE TYPEINFOSPACING			SPACE(2)
#DEFINE FUNCDESCSPACING			SPACE(4)
#DEFINE FUNCDESCSPACING2		SPACE(6)

#DEFINE GETFILE1_LOC			"Bibliotecas de tipos: TLB,DLL,EXE"
#DEFINE GETFILE2_LOC			"Typelib:"

#DEFINE TLIB1_LOC			 	"Biblioteca de tipos = "
#DEFINE TLIB2_LOC			 	"Identificador TypeLib = "
#DEFINE TLIB3_LOC			 	"Cuenta TypeInfo = "
#DEFINE TDOC1_LOC			 	"Nombre = "
#DEFINE TDOC2_LOC				"Descripci?n = "
#DEFINE TDOC3_LOC				"Archivo de Ayuda = "
#DEFINE TDOC4_LOC				"Nombre descriptivo = "

#DEFINE TINFO1_LOC			 	"?ndice de TypeInfo = "
#DEFINE TINFO2_LOC		 		"GUID de TypeInfo = "
#DEFINE TFUNC1_LOC				"Nombre de miembro = "
#DEFINE TFUNC2_LOC				"Id. de miembro = "
#DEFINE TFUNC3_LOC				"Tipo de funci?n = "
#DEFINE TFUNC4_LOC				"Tipo de invocaci?n = "
#DEFINE TFUNC5_LOC				"Conversi?n de llamada = "
#DEFINE TFUNC6_LOC				"Tipo de retorno = "
#DEFINE TFUNC7_LOC				"Par?metros:"

#DEFINE FUNCKIND_LOC			"Virtual    PureVirtualNonVirtual Static     Dispatch   "
#DEFINE INVOKEKIND_LOC			"Method        PropertyGet   PropertyPut   PropertyPutRef"
#DEFINE CALLCONV_LOC			"CDECL    Pascal   MacPascalSTDCall  Reserved Syscall  MPWCDECL MPWPascal"
