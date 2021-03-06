********************************************************************************
procedure __RI_UPDATE_detalle_pres
** "Referential integrity update trigger for" detalle_pres
LOCAL llRetVal
llRetVal = .t.
PRIVATE pcParentDBF,pnParentRec,pcChildDBF,pnChildRec,pcParentID,pcChildID
PRIVATE pcParentExpr,pcChildExpr
STORE "" TO pcParentDBF,pcChildDBF,pcParentID,pcChildID,pcParentExpr,pcChildExpr
STORE 0 TO pnParentRec,pnChildRec
IF _triggerlevel=1
  BEGIN TRANSACTION
  PRIVATE pcRIcursors,pcRIwkareas,pcRIolderror,pnerror,;
  pcOldDele,pcOldExact,pcOldTalk,pcOldCompat,PcOldDBC
  pcOldTalk=SET("TALK")
  SET TALK OFF
  pcOldDele=SET("DELETED")
  pcOldExact=SET("EXACT")
  pcOldCompat=SET("COMPATIBLE")
  SET COMPATIBLE OFF
  SET DELETED ON
  SET EXACT OFF
  pcRIcursors=""
  pcRIwkareas=""
  pcRIolderror=ON("error")
  pnerror=0
  ON ERROR pnerror=rierror(ERROR(),message(),message(1),program())
  IF TYPE('gaErrors(1)')<>"U"
    release gaErrors
  ENDIF
  PUBLIC gaErrors(1,12)
  pcOldDBC=DBC()
  SET DATA TO ("TASTRADE")
ENDIF first trigger
LOCAL lcParentID && parent's value to be sought in child
LOCAL lcOldParentID && previous parent id value
LOCAL lcChildWkArea && child work area handle returned by riopen
LOCAL lcChildID && child's value to be sought in parent
LOCAL lcOldChildID && old child id value
LOCAL lcParentWkArea && parentwork area handle returned by riopen
LOCAL lcStartArea
lcStartArea=select()
llRetVal=.t.
lcChildWkArea=select()
IF _triggerlevel=1 or type("pccascadeparent")#"C" or (NOT pccascadeparent=="PRODUCTS")
  SELECT (lcChildWkArea)
  lcChildID=PRODUCT_ID
  lcOldChildID=oldval("PRODUCT_ID")
  pcChildDBF=dbf(lcChildWkArea)
  pnChildRec=recno(lcChildWkArea)
  pcChildID=lcOldChildID
  pcChildExpr="PRODUCT_ID"
  IF lcChildID<>lcOldChildID
    lcParentWkArea=riopen("products","product_id")
    IF lcParentWkArea<=0
      IF _triggerlevel=1
        DO riend WITH .F.
      ENDIF at the end of the highest trigger level
      SELECT (lcStartArea)
      RETURN .F.
    ENDIF not able to open the child work area
    pcParentDBF=dbf(lcParentWkArea)
    llRetVal=SEEK(lcChildID,lcParentWkArea)
    pnParentRec=recno(lcParentWkArea)
    =rireuse("products",lcParentWkArea)
    IF NOT llRetVal
      DO rierror with -1,"Insert restrict rule violated.","",""
      IF _triggerlevel=1
        DO riend WITH llRetVal
      ENDIF at the end of the highest trigger level
      SELECT (lcStartArea)
      RETURN llRetVal
    ENDIF no parent
  ENDIF this value was changed
ENDIF not part of a cascade from "products"
IF _triggerlevel=1 or type("pccascadeparent")#"C" or (NOT pccascadeparent=="PRESTAMOS")
  SELECT (lcChildWkArea)
  lcChildID=pres_ID
  lcOldChildID=oldval("pres_ID")
  pcChildDBF=dbf(lcChildWkArea)
  pnChildRec=recno(lcChildWkArea)
  pcChildID=lcOldChildID
  pcChildExpr="pres_ID"
  IF lcChildID<>lcOldChildID
    lcParentWkArea=riopen("Prestamos","pres_id")
    IF lcParentWkArea<=0
      IF _triggerlevel=1
        DO riend WITH .F.
      ENDIF at the end of the highest trigger level
      SELECT (lcStartArea)
      RETURN .F.
    ENDIF not able to open the child work area
    pcParentDBF=dbf(lcParentWkArea)
    llRetVal=SEEK(lcChildID,lcParentWkArea)
    pnParentRec=recno(lcParentWkArea)
    =rireuse("Prestamos",lcParentWkArea)
    IF NOT llRetVal
      DO rierror with -1,"Insert restrict rule violated.","",""
      IF _triggerlevel=1
        DO riend WITH llRetVal
      ENDIF at the end of the highest trigger level
      SELECT (lcStartArea)
      RETURN llRetVal
    ENDIF no parent
  ENDIF this value was changed
ENDIF not part of a cascade from "Prestamos"
lcParentWkArea=lcChildWkArea
IF _triggerlevel=1
  do riend with llRetVal
ENDIF at the end of the highest trigger level
SELECT (lcStartArea)
RETURN llRetVal
** "End of Referential integrity Update trigger for" detalle_pres
********************************************************************************

********************************************************************************
** "Referential integrity insert trigger for" detalle_pres
PROCEDURE __RI_INSERT_detalle_pres
LOCAL llRetVal
llRetVal = .t.
PRIVATE pcParentDBF,pnParentRec,pcChildDBF,pnChildRec,pcParentID,pcChildID
PRIVATE pcParentExpr,pcChildExpr
STORE "" TO pcParentDBF,pcChildDBF,pcParentID,pcChildID,pcParentExpr,pcChildExpr
STORE 0 TO pnParentRec,pnChildRec
IF _triggerlevel=1
  BEGIN TRANSACTION
  PRIVATE pcRIcursors,pcRIwkareas,pcRIolderror,pnerror,;
  pcOldDele,pcOldExact,pcOldTalk,pcOldCompat,PcOldDBC
  pcOldTalk=SET("TALK")
  SET TALK OFF
  pcOldDele=SET("DELETED")
  pcOldExact=SET("EXACT")
  pcOldCompat=SET("COMPATIBLE")
  SET COMPATIBLE OFF
  SET DELETED ON
  SET EXACT OFF
  pcRIcursors=""
  pcRIwkareas=""
  pcRIolderror=ON("error")
  pnerror=0
  ON ERROR pnerror=rierror(ERROR(),message(),message(1),program())
  IF TYPE('gaErrors(1)')<>"U"
    release gaErrors
  ENDIF
  PUBLIC gaErrors(1,12)
  pcOldDBC=DBC()
  SET DATA TO ("TASTRADE")
ENDIF first trigger
LOCAL lcChildID && child's value to be sought in parent
LOCAL lcParentWkArea && parentwork area handle returned by riopen
LOCAL lcChildWkArea && child's work area
LOCAL lcStartArea
lcStartArea=select()
llRetVal=.t.
lcChildWkArea=SELECT()
SELECT (lcChildWkArea)
lcChildID=PRODUCT_ID
pcChildDBF=dbf(lcChildWkArea)
pnChildRec=recno(lcChildWkArea)
pcChildID=lcChildID
pcChildExpr="PRODUCT_ID"
lcParentWkArea=riopen("products","product_id")
IF lcParentWkArea<=0
  IF _triggerlevel=1
    DO riend WITH .F.
  ENDIF at the end of the highest trigger level
  SELECT (lcStartArea)
  RETURN .F.
ENDIF not able to open the child work area
pcParentDBF=dbf(lcParentWkArea)
llRetVal=SEEK(lcChildID,lcParentWkArea)
pnParentRec=recno(lcParentWkArea)
=rireuse("products",lcParentWkArea)
IF NOT llRetVal
  DO rierror with -1,"Insert restrict rule violated.","",""
  IF _triggerlevel=1
    DO riend WITH llRetVal
  ENDIF at the end of the highest trigger level
  SELECT (lcStartArea)
  RETURN llRetVal
ENDIF
SELECT (lcChildWkArea)
lcChildID=pres_ID
pcChildDBF=dbf(lcChildWkArea)
pnChildRec=recno(lcChildWkArea)
pcChildID=lcChildID
pcChildExpr="pres_ID"
lcParentWkArea=riopen("Prestamos","pres_id")
IF lcParentWkArea<=0
  IF _triggerlevel=1
    DO riend WITH .F.
  ENDIF at the end of the highest trigger level
  SELECT (lcStartArea)
  RETURN .F.
ENDIF not able to open the child work area
pcParentDBF=dbf(lcParentWkArea)
llRetVal=SEEK(lcChildID,lcParentWkArea)
pnParentRec=recno(lcParentWkArea)
=rireuse("Prestamos",lcParentWkArea)
IF NOT llRetVal
  DO rierror with -1,"Insert restrict rule violated.","",""
  IF _triggerlevel=1
    DO riend WITH llRetVal
  ENDIF at the end of the highest trigger level
  SELECT (lcStartArea)
  RETURN llRetVal
ENDIF
IF _triggerlevel=1
  do riend with llRetVal
ENDIF at the end of the highest trigger level
SELECT (lcStartArea)
RETURN llRetVal
** "End of Referential integrity insert trigger for" detalle_pres
********************************************************************************

********************************************************************************
