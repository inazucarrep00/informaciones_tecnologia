LOCAL laTables[1], ;
      i,;
      lSafety,;
      lDel,;
      Foldersres,;
      RespaldoxDia,;
      NuevoFolders,;
      laTablesIndep[3]
 *     Procese
  lDel = SET("Deleted") 
  lSafety = SET("SAFETY")     
  SET SAFETY OFF
  SET DELETED OFF 
  IF !USED("cod_seq")
      USE tastrade!cod_seq IN 0
  ENDIF
  SELECT cod_seq
  Foldersres = ALLT(SYS(5)+Cod_seq.Respaldo)
  NuevoFolders = .F.
  IF DIRECTORY(Foldersres) 
     IF Cod_seq.sw_respa > 1 OR EMPTY(Arrtablas)
        SET SAFETY &lSafety
        RETURN .T.
     ENDIF 
  ENDIF 
*  procese = .F.
  IF !DIRECTORY(Foldersres)
     MKDIR (Foldersres) 
     NuevoFolders = .T.
  ENDIF    
  RespaldoxDia = ALLT(Foldersres) + ALLT(UPPER(NombreDia(DOW(DATE())))) + "\" 
  REPLACE Cod_seq.Ult_respa WITH DATE() 

  IF !DIRECTORY(RespaldoxDia)
     MKDIR (RespaldoxDia)
     NuevoFolders = .T.
  ENDIF 
CLOSE TABLES
FOR i = 1 to ADBOBJECTS(laTables, "Table")
  IF !EMPTY(laTables[i]) 
      IF ASCAN(Arrtablas, laTables[i])<>0 OR NuevoFolders
         IF !USED(laTables[i])
            USE (laTables[i]) IN 0 EXCL
            SELECT (laTables[i])
*            DO FORM termoWith WITH "Folders "+"'"+RespaldoxDia+"'",UPPER(ALLTRIM(laTables[i])) + ".DBF"
            IF INLIST(UPPER(ALIAS()),"ORDITEMS,ORDER_LINE_ITEMS","PAGOSPRES","ORDERS")
               PACK
            ENDIF 
*            wait window laTables[i]+"="+Arrtablas(ASCAN(Arrtablas, laTables[i]))
            COPY TO ALLT(RespaldoxDia) + UPPER(ALLTRIM(laTables[i])) + ".DBF"
            WAIT WINDOW "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                               "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                               "Copiando ... " + UPPER(ALLTRIM(laTables[i])) + ".DBF"
            COPY TO ALLT(RespaldoxDia) + UPPER(ALLTRIM(laTables[i])) + ".CDX"
            WAIT WINDOW NOWAIT "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                               "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                               "Copiando ... " + UPPER(ALLTRIM(laTables[i])) + ".CDX"
            COPY TO ALLT(RespaldoxDia) + UPPER(ALLTRIM(laTables[i])) + ".BAK"
            WAIT WINDOW NOWAIT "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                               "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                               "Copiando ... " + UPPER(ALLTRIM(laTables[i])) + ".BAK"
            COPY TO ALLT(RespaldoxDia) + UPPER(ALLTRIM(laTables[i])) + ".TBX"
            WAIT WINDOW NOWAIT "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                               "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                               "Copiando ... " + UPPER(ALLTRIM(laTables[i])) + ".TBX"
*            Procese = .T.                   
         ENDIF
      ENDIF
  ENDIF 
ENDFOR

*IF procese
*------  tablas independientes ----------*

laTablesIndep[1] = "behindsc"
laTablesIndep[2] = "repolist"
*laTablesIndep[3] = "terms"

 FOR i = 1 TO 2
     IF !EMPTY(laTablesIndep[i])
        IF !USED(laTablesIndep[i])
            USE (laTablesIndep[i]) IN 0 EXCL
            SELECT (laTablesIndep[i])
        COPY TO ALLT(RespaldoxDia) + UPPER(ALLTRIM(laTablesIndep[i])) + ".DBF"
        WAIT WINDOW NOWAIT "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                           "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                           "Copiando ... " + UPPER(ALLTRIM(laTablesIndep[i])) + ".DBF"
        COPY TO ALLT(RespaldoxDia) + UPPER(ALLTRIM(laTablesIndep[i])) + ".CDX"
        WAIT WINDOW NOWAIT "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                           "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                           "Copiando ... " + UPPER(ALLTRIM(laTablesIndep[i])) + ".CDX"
        COPY TO ALLT(RespaldoxDia) + UPPER(ALLTRIM(laTablesIndep[i])) + ".BAK"
        WAIT WINDOW NOWAIT "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                           "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                           "Copiando ... " + UPPER(ALLTRIM(laTablesIndep[i])) + ".BAK"
        COPY TO ALLT(RespaldoxDia) + UPPER(ALLTRIM(laTablesIndep[i])) + ".TBX"
        WAIT WINDOW NOWAIT "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                           "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                           "Copiando ... " + UPPER(ALLTRIM(laTablesIndep[i])) + ".TBX"
        ENDIF 
     ENDIF         
 ENDFOR 
*------  tablas independientes ----------*
CLOSE TABLES
CLOSE DATABASES
COPY FILE SYS(2003)+"\DATA\tastrade.dcx" TO RespaldoxDia + "tastrade.dcx"
WAIT WINDOW NOWAIT "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                   "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                   "Copiando ... TASTRADE.DCX"
COPY FILE SYS(2003)+"\DATA\tastrade.dbc" TO RespaldoxDia + "tastrade.dbc"
WAIT WINDOW NOWAIT "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                   "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                   "Copiando ... TASTRADE.DBC"
COPY FILE SYS(2003)+"\DATA\tastrade.dct" TO RespaldoxDia + "tastrade.dct"
WAIT WINDOW NOWAIT "Realizando copia de respaldo de sus datos en el folder " + RespaldoxDia + CHR(13) +;
                   "Esto puede tardar varios minutos" + CHR(13) + CHR(13)+;
                   "Copiando ... TASTRADE.DCT"

WAIT WINDOW "La copia de respaldo fue realizada en el folders " + RespaldoxDia + CHR(13) +;
               "Abandonando la aplicacion ..." TIMEOUT 1
SET SAFETY &lSafety
SET DELETED &lDel
CLOSE TABLES

RETURN .T.
