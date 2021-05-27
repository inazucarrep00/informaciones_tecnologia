SET DATE DMY 
SET CENTURY ON 
grpturno=2
txtFechaDia=CTOD("25/06/2014")

SELECT Maqpto.descri_cpu, Maqpto.name_abre, Maqpto.clave_oper,;
  cierrepto.nro_cierre, cierrepto.monto_ini, cierrepto.cash,;
  cierrepto.cheques, cierrepto.monto_repo, cierrepto.tot_al_cie,;
  cierrepto.resultado, Docs.descri_doc, Docs.monto, Docs.sw_cash,;
  cierrepto.apertura, cierrepto.hora_abre, cierrepto.cierre,;
  cierrepto.hora_cie, Docs.fecha_e, Docs.nro_fact, 2 AS grupo;
 FROM  tastrade!maqpto INNER JOIN cierrepto;
    INNER JOIN tastrade!docs ;
   ON  cierrepto.cierre = Docs.fecha_e ;
   ON  Maqpto.descri_cpu = cierrepto.descri_cpu;
 WHERE cierrepto.descri_cpu = Docs.maq_pto AND Docs.turno=grpturno;
   AND docs.turno = Maqpto.turno;
   AND (Docs.tipo_doc = "P" ;
   AND BETWEEN(txtFechaDia,cierrepto.Apertura,cierrepto.Cierre));
 ORDER BY Docs.sw_cash, Docs.nro_fact;
 INTO CURSOR reportecaja
