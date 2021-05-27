LPARAMETERS lnNroFact
LOCAL lcSeleRepo, lcArchivoRep
IF SYS(13) = 'OFFLINE'
   =MESSAGEBOX("El printer no esta Ready",48,"Error de printer")
   RETURN 
ENDIF
STORE PRINTSTATUS( ) TO glReady
IF NOT glReady
   WAIT 'Make sure printer is attached and turned on!' WINDOW
ENDIF


*lcSeleRepo = "REPORTS\FACTURAS" + IIF(cod_seq.impsepar=2,"IMP.FRX",;
*                                  IIF(cod_seq.impsepar=3,"IMPD.FRX",;
*                                  IIF(cod_seq.impsepar=4,"MALL.FRX",".FRX")))
   DO CASE 
      CASE cod_seq.impsepar=1
           IF UPPER(cod_seq.sizepapel)='G'
           		lcArchivoRep = "IMP.FRX"
           ELSE
           		lcArchivoRep = "MALL00.FRX"
           ENDIF 

      CASE cod_seq.impsepar=2
           IF UPPER(cod_seq.sizepapel)='G'
              lcArchivoRep = "IMP.FRX"
           ELSE 
              lcArchivoRep = "MALL.FRX"
*              lcArchivoRep = "MALL0.FRX"
           ENDIF    
         
      CASE cod_seq.impsepar=3
           IF UPPER(cod_seq.sizepapel)='G'
              lcArchivoRep = "IMPD.FRX"
           ELSE
              lcArchivoRep = "MALLIMPD.FRX"
           ENDIF    

   ENDCASE 
   lcSeleRepo = "REPORTS\FACTURAS" + lcArchivoRep   
noParam = .F.
keyF10 = .F.
IF PRINTSTATUS()
    REPORT FORM (lcSeleRepo) ;
    TO PRINTER NOCONSOLE FOR VAL(order_number)=VAL(lnNroFact)

*    REPORT FORM (lcSeleRepo) ;
*    TO PRINTER NOCONSOLE FOR VAL(order_number)=lnNroFact

*    SET PRINTER TO NAME GETPRINTER()
*    SET PRINTER TO NAME Generic/Text Only
*    IF vSandw > 0
*       REPORT FORM FacturasCocina2 ;
*       TO PRINTER NOCONSOLE FOR VAL(order_number)=lnNroFact AND listapara = 1
*    ENDIF 
*    IF vJugos > 0
*       REPORT FORM FacturasCocina2 ;
*       TO PRINTER NOCONSOLE FOR VAL(order_number)=lnNroFact AND listapara = 2
*    ENDIF 
*    SET DEVICE TO PRINTER
*    SET PRINT ON
*    _PADVANCE = "FORMFEED"
*    EJECT  
*    SET PRINT OFF
*    SET DEVICE TO SCREEN
*    lsetDevice = SET("Device")
*    lsetPrint = SET("Printer") 
*    SET DEVICE TO PRINTER
*    SET PRINT ON
*    EJECT
*    SET DEVICE TO lsetDevice
*    SET PRINT &lsetPrint
*    REPORT FORM (lcSeleRepo) ;
*    PREVIEW
ELSE
     =MESSAGEBOX(PRINTERNOTREADY_LOC, MB_ICONEXCLAMATION)
ENDIF

RETURN 

