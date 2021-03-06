********************************************************************************

********************************************************************************
** "Referential integrity delete trigger for" Prestamos
PROCEDURE __RI_DELETE_Prestamos
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
LOCAL lcChildWkArea && child work area handle returned by riopen
LOCAL lcParentWkArea
LOCAL llDelHeaderarea
lcStartArea=select()
llRetVal=.t.
lcParentWkArea=select()
SELECT (lcParentWkArea)
pcParentDBF=dbf()
pnParentRec=recno()
STORE pres_ID TO lcParentID,pcParentID
pcParentExpr="pres_ID"
lcChildWkArea=riopen("Detalle_pres","pres_id")
IF lcChildWkArea<=0
  IF _triggerlevel=1
    DO riend WITH .F.
  ENDIF at the end of the highest trigger level
  RETURN .F.
ENDIF not able to open the child work area
pcChildDBF=dbf(lcChildWkArea)
SELECT (lcChildWkArea)
SEEK lcParentID
SCAN WHILE pres_ID=lcParentID AND llRetVal
  pnChildRec=recno()
  pcChildID=pres_ID
  pcChildExpr="pres_ID"
  llRetVal=ridelete()
ENDSCAN get all of the Detalle_pres records
=rireuse("Detalle_pres",lcChildWkArea)
IF NOT llRetVal
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
** "End of Referential integrity Delete trigger for" Prestamos
********************************************************************************

********************************************************************************
procedure __RI_UPDATE_Prestamos
** "Referential integrity update trigger for" Prestamos
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
IF _triggerlevel=1 or type("pccascadeparent")#"C" or (NOT pccascadeparent=="CUSTOMER")
  SELECT (lcChildWkArea)
  lcChildID=CUSTOMER_ID
  lcOldChildID=oldval("CUSTOMER_ID")
  pcChildDBF=dbf(lcChildWkArea)
  pnChildRec=recno(lcChildWkArea)
  pcChildID=lcOldChildID
  pcChildExpr="CUSTOMER_ID"
  IF lcChildID<>lcOldChildID
    lcParentWkArea=riopen("customer","customer_i")
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
    =rireuse("customer",lcParentWkArea)
    IF NOT llRetVal
      DO rierror with -1,"Insert restrict rule violated.3","",""
      IF _triggerlevel=1
        DO riend WITH llRetVal
      ENDIF at the end of the highest trigger level
      SELECT (lcStartArea)
      RETURN llRetVal
    ENDIF no parent
  ENDIF this value was changed
ENDIF not part of a cascade from "customer"
IF _triggerlevel=1 or type("pccascadeparent")#"C" or (NOT pccascadeparent=="SHIPPERS")
  SELECT (lcChildWkArea)
  lcChildID=SHIPPER_ID
  lcOldChildID=oldval("SHIPPER_ID")
  pcChildDBF=dbf(lcChildWkArea)
  pnChildRec=recno(lcChildWkArea)
  pcChildID=lcOldChildID
  pcChildExpr="SHIPPER_ID"
  IF lcChildID<>lcOldChildID
    lcParentWkArea=riopen("shippers","shipper_id")
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
    =rireuse("shippers",lcParentWkArea)
    IF NOT llRetVal
      DO rierror with -1,"Insert restrict rule violated.4","",""
      IF _triggerlevel=1
        DO riend WITH llRetVal
      ENDIF at the end of the highest trigger level
      SELECT (lcStartArea)
      RETURN llRetVal
    ENDIF no parent
  ENDIF this value was changed
ENDIF not part of a cascade from "shippers"
IF _triggerlevel=1 or type("pccascadeparent")#"C" or (NOT pccascadeparent=="EMPLOYEE")
  SELECT (lcChildWkArea)
  lcChildID=EMPLOYEE_ID
  lcOldChildID=oldval("EMPLOYEE_ID")
  pcChildDBF=dbf(lcChildWkArea)
  pnChildRec=recno(lcChildWkArea)
  pcChildID=lcOldChildID
  pcChildExpr="EMPLOYEE_ID"
  IF lcChildID<>lcOldChildID
    lcParentWkArea=riopen("employee","employee_i")
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
    =rireuse("employee",lcParentWkArea)
    IF NOT llRetVal
      DO rierror with -1,"Insert restrict rule violated.5","",""
      IF _triggerlevel=1
        DO riend WITH llRetVal
      ENDIF at the end of the highest trigger level
      SELECT (lcStartArea)
      RETURN llRetVal
    ENDIF no parent
  ENDIF this value was changed
ENDIF not part of a cascade from "employee"
lcParentWkArea=lcChildWkArea
SELECT (lcParentWkArea)
pcParentDBF=dbf()
pnParentRec=recno()
lcOldParentID=OLDVAL("pres_ID")
pcParentID=lcOldParentID
pcParentExpr="pres_ID"
lcParentID=pres_ID
IF lcParentID<>lcOldParentID
  lcChildWkArea=riopen("Detalle_pres")
  IF lcChildWkArea<=0
    IF _triggerlevel=1
      DO riend WITH .F.
    ENDIF at the end of the highest trigger level
    SELECT (lcStartArea)
    RETURN .F.
  ENDIF not able to open the child work area
  pcChildDBF=dbf(lcChildWkArea)
  SELECT (lcChildWkArea)
  SCAN FOR pres_ID=lcOldParentID
    pnChildRec=recno()
    pcChildID=pres_ID
    pcChildExpr="pres_ID"
    IF NOT llRetVal
      EXIT
    ENDIF && not llretval
    llRetVal=riupdate("pres_ID",lcParentID,"PRESTAMOS")
  ENDSCAN get all of the Detalle_pres records
  =rireuse("Detalle_pres",lcChildWkArea)
  IF NOT llRetVal
    IF _triggerlevel=1
      DO riend WITH llRetVal
    ENDIF at the end of the highest trigger level
    SELECT (lcStartArea)
    RETURN llRetVal
  ENDIF
ENDIF this parent id changed
IF _triggerlevel=1
  do riend with llRetVal
ENDIF at the end of the highest trigger level
SELECT (lcStartArea)
RETURN llRetVal
** "End of Referential integrity Update trigger for" Prestamos
********************************************************************************

********************************************************************************
** "Referential integrity insert trigger for" Prestamos
PROCEDURE __RI_INSERT_Prestamos
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
lcChildID=CUSTOMER_ID
pcChildDBF=dbf(lcChildWkArea)
pnChildRec=recno(lcChildWkArea)
pcChildID=lcChildID
pcChildExpr="CUSTOMER_ID"
lcParentWkArea=riopen("customer","customer_i")
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
=rireuse("customer",lcParentWkArea)
IF NOT llRetVal
  DO rierror with -1,"Insert restrict rule violated.1","",""
  IF _triggerlevel=1
    DO riend WITH llRetVal
  ENDIF at the end of the highest trigger level
  SELECT (lcStartArea)
  RETURN llRetVal
ENDIF
****** no es necesario abajo
*SELECT (lcChildWkArea)
*lcChildID=SHIPPER_ID
*pcChildDBF=dbf(lcChildWkArea)
*pnChildRec=recno(lcChildWkArea)
*pcChildID=lcChildID
*pcChildExpr="SHIPPER_ID"
*lcParentWkArea=riopen("shippers","shipper_id")
*IF lcParentWkArea<=0
*  IF _triggerlevel=1
*    DO riend WITH .F.
*  ENDIF at the end of the highest trigger level
*  SELECT (lcStartArea)
*  RETURN .F.
*ENDIF not able to open the child work area
*pcParentDBF=dbf(lcParentWkArea)
*llRetVal=SEEK(lcChildID,lcParentWkArea)
*pnParentRec=recno(lcParentWkArea)
*=rireuse("shippers",lcParentWkArea)
*IF NOT llRetVal
*  DO rierror with -1,"Insert restrict rule violated.","",""
*  IF _triggerlevel=1
*    DO riend WITH llRetVal
*  ENDIF at the end of the highest trigger level
*  SELECT (lcStartArea)
*  RETURN llRetVal
*ENDIF
******** no es necesario arriba
SELECT (lcChildWkArea)
lcChildID=EMPLOYEE_ID
pcChildDBF=dbf(lcChildWkArea)
pnChildRec=recno(lcChildWkArea)
pcChildID=lcChildID
pcChildExpr="EMPLOYEE_ID"
lcParentWkArea=riopen("employee","employee_i")
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
=rireuse("employee",lcParentWkArea)
IF NOT llRetVal
  DO rierror with -1,"Insert restrict rule violated.2","",""
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
** "End of Referential integrity insert trigger for" Prestamos
********************************************************************************
