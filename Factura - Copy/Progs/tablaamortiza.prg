LPARAMETERS codigo,;
            fechai,;
            fechaf,;
            MontoPres,;
            nCuotas,;
            tiempocuota,;
            tiempoequi,;
            tasai,;
            Descto,;
            llIDYES
            
            
LOCAL MonSinInt2,;
      IntXDia2,;
      SaveArea,;
      nRec,;
      cestatus,;
      borre,;
      DescXDia,;
      SetDel,;
      PagaMora,;
      nCu,;
      nPrimerReg,;
      nOldRecNo
      
SaveArea = SELECT()                  
nRec = RECNO()
SetDel = SET("Deleted")
SET DELETED OFF   
*borre = .F.
*borre2 = .F.
*IF UltimoGen > 0
*   IF llIDYES
*      IF UltimoGen>=2
*         DELETE FOR order_id = codigo AND estatus < UltimoGen IN Order_line_items         
*         GO TOP IN Order_line_items  
*         borre = .T.
*     ENDIF  
*   ELSE 
*      borre2 = .T.
*Replace estatus WITH 2 FOR order_id = codigo IN Order_line_items 
*DELETE FOR order_id = codigo IN Order_line_items 

Replace estatus WITH 2 FOR order_id = codigo IN detalle_pres 
*DELETE FOR order_id = codigo IN detalle_pres 
DELETE ALL IN detalle_pres 
*   ENDIF    
*ENDIF    
CREATE CURSOR CurTablaAmortiza ;
 (fechaicu D(8), fechafpa D(8), Order_id C(13),cuota1 N(5,0), cuota2 N(5,0), Fechapago D(8), ResAdeudado N(12,2), MonSinInt N(12,2), Mora N(12,2),IntXnCuota N(12,2),;
 IntXDia N(12,2), MoraXDia N(12,2), MonSinInt_IntXDia N(12,2), ResAdeudado_IntXnCuota N(12,2),Estatus N(2,0), nDiasMora N(6,2), Descto N(6,2), pagado N(12,2))

*                             cTiempoList.tiempo_val,;
*                             cTiempoList.tiempo_equi,;

MonSinInt2 = ROUND(MontoPres / nCuotas,redondeo)
*IntXDia2 = MontoPres * tasai *0.01/tiempocuota*tiempoequi
*IntXDia2 = MontoPres * tasai *0.01/IIF(tiempocuota=1,1,30)*tiempocuota
IntXDia2 = ROUND(MontoPres * tasai *0.01/30*tiempocuota,redondeo)

DescXDia =  ROUND((MontoPres / nCuotas) * Descto,redondeo)
k=nCuotas
j=0
INSERT INTO CurTablaAmortiza (fechaicu, fechafpa, fechapago,order_id, Cuota2, ResAdeudado, MonSinInt, IntXDia, Mora, IntXnCuota,;
             MonSinInt_IntXDia, ResAdeudado_IntXnCuota,Estatus, descto);
VALUES (fechai, fechai, fechaf,Codigo, 0, MontoPres, MonSinInt2, IntXDia2,0.00, IntXDia2*nCuotas,0.00,;
        MontoPres+(IntXDia2*nCuotas),1,DescXDia)

FOR i=1 TO nCuotas*tiempocuota STEP tiempocuota
    j=j+1
    fechai = fechai + tiempocuota &&Orders.TiempoPaCuo 
    PagaMora = DATE()>fechai+cod_seq.PlazoNoMora
    MontoPres = MontoPres - MonSinInt2
    k=k-1
    MonSinInt3 = MonSinInt2
    IntXDia3 = IntXDia2
    IF j=nCuotas
       MonSinInt2 = 0
       IntXDia2 = 0
    ENDIF 
    INSERT INTO CurTablaAmortiza (fechaicu, fechafpa, order_id,Cuota1, Cuota2, ResAdeudado, MonSinInt, IntXDia, Mora, ;
                                  IntXnCuota, MonSinInt_IntXDia, ResAdeudado_IntXnCuota,Estatus, nDiasMora, descto,Pagado);
    VALUES (fechai, fechai+cod_seq.PlazoNoMora, Codigo, nCuotas-j, j, MontoPres, MonSinInt2, IntXDia2,;
            IIF(PagaMora,(MonSinInt2+IntXDia2)*0.01*cod_seq.tasamora/30*tiempocuota,0.00), IntXDia2*(k),;
            (MonSinInt2+IntXDia2)+IIF(PagaMora,ROUND(((MonSinInt2+IntXDia2)*0.01*cod_seq.tasamora/tiempoequi),0.00),redondeo),;
             MontoPres+(IntXDia2*(k))+IIF(PagaMora,ROUND(((MonSinInt2+IntXDia2)*0.01*cod_seq.tasamora/30*tiempocuota),0.00),redondeo),;
             1,IIF(PagaMora,DATE()-(fechai+cod_seq.PlazoNoMora)+cod_seq.PlazoNoMora,0),DescXDia,MonSinInt3+IntXDia3)

*             UltimoGen+1,IIF(PagaMora,DATE()-(fechai+cod_seq.PlazoNoMora)+cod_seq.PlazoNoMora,0),DescXDia,MonSinInt3+IntXDia3)

ENDFOR 
*IF EMPTY(fechapago)
*IIF(PagaMora,(MonSinInt2+IntXDia2)*0.01*cod_seq.tasamora/tiempoequi,0.00)
GO TOP 
nCu = 0
SCAN
*  SELECT Order_line_items 
  SELECT detalle_pres 
  APPEND BLANK
  Replace SecueCuota             WITH CurTablaAmortiza.Cuota2,;
          fechaicu               WITH CurTablaAmortiza.fechaicu,;
          fechapagar             WITH CurTablaAmortiza.fechafpa,; 
          order_id               WITH CurTablaAmortiza.order_id,;
          ResAdeudado            WITH CurTablaAmortiza.ResAdeudado,;
          MonSinInt              WITH CurTablaAmortiza.MonSinInt,;
          IntXDia                WITH CurTablaAmortiza.IntXDia,;
          MoraxDia               WITH CurTablaAmortiza.Mora,;
          IntXnCuota             WITH CurTablaAmortiza.IntXnCuota,;
          MonSinInt_IntXDia      WITH CurTablaAmortiza.MonSinInt_IntXDia,;
          ResAdeudado_IntXnCuota WITH CurTablaAmortiza.ResAdeudado_IntXnCuota,;
          nDiasMora              WITH CurTablaAmortiza.nDiasMora,;
          DescXDia               WITH CurTablaAmortiza.Descto,;
          estatus                WITH CurTablaAmortiza.Estatus,;
          pagado                 WITH CurTablaAmortiza.pagado
 nCu = nCu + 1 
 IF nCu = 1
    nPrimerReg = RECNO() 
 ENDIF 
 WAIT WINDOW "Filas generadas en la tabla para este Prestamo: "+TRANSFORM(nCu-1) NOWAIT            
 SELECT CurTablaAmortiza         
ENDSCAN 
USE IN CurTablaAmortiza
*SELECT order_line_items
SELECT detalle_pres

GO nPrimerReg 
nOldRecNo = IIF(EOF(), 0, RECNO())
CALCULATE MAX(SecueCuota) FOR order_id=Codigo AND MoraxDia>0 AND !DELETED() TO nMaxCuota
IF nOldRecNo <> 0
   GO nOldRecNo
ENDIF
IF nMaxCuota - 1 > 0
   Mora = MoraxDia
   FOR i=nMaxCuota-1 TO 1 STEP -1  
      =SEEK(Codigo+ALLTRIM(STR(i)),ALIAS(),"NCUOTAPRES")
*       LOCATE FOR SecueCuota=i AND !DELETED() AND order_id=Codigo
       Mora = Mora + (Mora*cod_seq.tasamora*0.01)  
       REPLACE MoraxDia          WITH MoraxDia + Mora,;
               MonSinInt_IntXDia WITH MonSinInt_IntXDia + Mora
               
       Mora = MoraxDia
  ENDFOR              
ENDIF 

*IF borre
*   Replace estatus WITH 1 FOR estatus = 2 AND !DELETED() AND order_id=codigo IN Order_line_items 
*   Replace estatus WITH 2 FOR estatus = 3 AND !DELETED() AND order_id=codigo IN Order_line_items 
*ENDIF    
*IF borre2
*   Replace estatus WITH 1 FOR !DELETED() AND order_id=codigo IN Order_line_items 
*   Replace estatus WITH 2 FOR DELETED() AND order_id=codigo IN Order_line_items 
*ENDIF    
*Codigo = STRTRAN(Codigo, 'P', ' ')
*WAIT WINDOW Codigo
*replace value WITH Codigo FOR UPPER(key_name) = "PRES_ID" IN setup            
*WAIT WINDOW setup.value
*DELETE IN Orders 
SELECT (SaveArea)
GO nRec
SET DELETED &SetDel   
RETURN .T.
