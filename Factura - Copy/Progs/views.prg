
  CodProd = 
  (SELECT MAX(a.order_id) FROM orders a, order_line_items b WHERE !DELETED() AND a.order_id=b.order_id AND ;
   VAL(b.product_id)=VAL(CodProd) AND AT('C',a.order_id)=0)

RETURN  
        
        
SELECT items
GO TOP 
c=0
uno='1'
dos='2'
tres='3'

SCAN FOR !DELETED()
    c = c + 1
    SELECT Products
    APPEND BLANK 
    REPLACE Product_name     WITH items.des_item,;
            category_id      WITH IIF(AT('TINTA',UPPER(items.des_item)) OR AT('CARTUCHO',UPPER(items.des_item))<>0,SPACE(6-LEN(dos))+dos ,;
                                  IIF(AT('TONER',UPPER(items.des_item))<>0,SPACE(6-LEN(uno))+uno ,SPACE(6-LEN(tres))+tres)),;
            ult_clte         WITH items.ult_clte,;      
            supplier_id      WITH IIF(EMPTY(items.proveedor1),SPACE(6-LEN(uno))+uno,items.proveedor1),;
            unit_price       with items.precio,;
            unit_cost        with items.costo,;
            units_in_stock   with items.cant_stock,;
            quantity_in_unit with '1 und x caja',; 
            cant_min         with items.cant_mini,;
            ultima_ven       with items.ultma_vta,;
            freight          with items.impuesto,;
            cod_fabri        with items.cod_item,;
            fe_ult_ven       with items.fe_ult_vta,;
            prod_fisic       with VAL(items.prod_fisi),;
            ubicacion        with items.ubicacion,;
            valor_inv        with items.valor_inve,;
            sin_exist        with VAL(items.prod_nega),;
            expiracion       with items.expiracion,;
            avisa_fac        with IIF(VAL(items.avisa_fe)=1,2,1),;
            excenimpto       with .F.,;
            Nro_ref          with items.Nro_refe,;
            Nro_fifo         with items.Nro_fifo,;
            Nro_lifo         with items.Nro_lifo,;
            Sigte_com        With items.Sgte_com
    wait window 'Registros Procesados: '+TRANSFORM(c) NOWAIt    
    SELECT items            
ENDSCAN

RETURN  

empresas.ref_ult_ac
empresas.cargo_anu



empresas.fe_ult_cpa

empresas.lote


empresas.reg_emp
empresas.cod_categ
empresas.notas

empresas.impuesto
empresas.terminos
empresas.vendedor
empresas.tipo_pre

SELECT comefac
c=0
SCAN FOR !DELETED() 
    c = c + 1
    SELECT empresas
    LOCATE FOR cod_empre = comefac.sold_to
    SELECT docs 
    LOCATE FOR Nro_fact = comefac.Nro_fact
    SELECT pagos
    LOCATE FOR nro_pago=docs.nro_doc
    SELECT vendedor
    LOCATE FOR UPPER(codigo)=UPPER(comefac.slsperson)
    SELECT Orders
    APPEND BLANK 
    REPLACE order_id            WITH SPACE(8-LEN(TRANS(comefac.Nro_fact)))+TRANS(comefac.Nro_fact),;
            order_number        WITH order_id,;
            customer_id         WITH comefac.sold_to,;
            shipper_id          WITH SPACE(6-LEN(Orders.shipper_id))+'1',;
            cotiz_number        WITH 'F'+TRANS(comefac.Nro_fact),;
            tipo_doc            WITH 'F',;
            order_date          WITH comefac.fecha_fact,;
            ship_to_name        WITH comefac.ship_to,;
            ship_to_address     WITH ALLT(comefac.direc_spa)+' '+ALLT(comefac.direc3)+' '+ALLT(comefac.direc1),;
            ship_to_city        WITH empresas.ciudad,;
            ship_to_region      WITH '',;
            ship_to_postal_code WITH empresas.zip,;
            ship_to_country     WITH empresas.pais,;
            discount            WITH comefac.descuento,;
            freight             WITH comefac.impuesto,;
            pos_hora            WITH comefac.pos_hora,;
            paid                WITH IIF(comefac.ToTal=comefac.pago,.T.,.F.),;
            terms               WITH comefac.terms,;
            deliver_by          WITH comefac.vence_en,;
            fecha_pago          WITH pagos.fecha_pago,;
            notes               WITH ALLT(comefac.comentario)+' '+ALLT(comefac.comenta2)+' '+ALLT(comefac.comenta3),;
            employee_id         WITH SPACE(6-LEN(Orders.employee_id))+'19',;
            sec_fija            WITH LEFT(comefac.ncf,11),;
            sec_ini             WITH RIGHT(comefac.ncf,8)
            
    wait window 'Registros Procesados: '+TRANSFORM(c) NOWAIt    
    SELECT comefac            
ENDSCAN
RETURN 

comefac.direc2
comefac.ship_to

comefac.direc2a
comefac.direc3a
comefac.ship_via


comefac.miscela
comefac.impto
comefac.Nro_transa


comefac.total
comefac.pago


comefac.factor_mo

comefac.pos_maq
comefac.pos_cash
comefac.reg_tribut
comefac.su_refe

comefac.dscto_cant

comefac.clase_fa
comefac.otro_impto
comefac.va_otro_im
comefac.prefijo
comefac.retencion
comefac.val_reten
comefac.cod_asien



SELECT empresas
c=0
SCAN FOR !DELETED()
    c = c + 1
    SELECT customer
    APPEND BLANK 
    REPLACE customer_id   WITH empresas.cod_empre,;
            company_name  WITH empresas.name_empre,;
            contact_name  WITH empresas.contacto,;
            phone         WITH empresas.nro_telefo,;
            fax           WITH empresas.nro_fax,;
            address       WITH ALLT(empresas.direcc1)+' '+ALLT(empresas.direcc2)+' '+ALLT(empresas.direcc3),;
            city          WITH empresas.ciudad,;
            postal_code   WITH empresas.zip,;
            country       WITH empresas.pais,;
            max_order_amt WITH empresas.max_credi,;
            min_order_amt WITH 1,;
            discount      WITH empresas.descuento,;
            rnc           WITH empresas.nro_tribut,;
            imail         WITH empresas.e_mail,;
            region        WITH empresas.state,;
            nota          WITH ALLT(empresas.notas1)+' '+ALLT(empresas.notas2)+' '+ALLT(empresas.notas3),;
            balance       WITH empresas.balance,;
            fe_crea_empr  WITH empresas.creacion,;
            fe_ult_tran   WITH empresas.fe_ult_acc,;
            mon_ult_tran  WITH empresas.monto_ult,;
            fe_ult_pago   WITH empresas.fe_ult_pa,;
            ref_ult_ac    WITH empresas.ref_ult_ac
           
    wait window 'Registros Procesados: '+TRANSFORM(c) NOWAIt    
    SELECT empresas            
ENDSCAN
RETURN 


   SELECT SUM(a.quantity * a.unit_price*.01 * a.impto) as sumaimp;
   FROM order_line_items a, Products b WHERE VAL(a.order_id)=2447 AND ;
                              a.product_id = b.product_id GROUP BY a.order_id INTO CURSOR qimpu

RETURN  

cString = ''
nSumaPos = 0
nRes = ''

cPassw = 'aantigua'

FOR i=32 TO 126
    cString = cString + CHR(i)
NEXT 
FOR i=1 TO LEN(cPassw)
    CHA = SUBST(cPassw,i,1) 
    nSumaPos = nSumaPos + AT(CHA,cString)  
NEXT 
DO WHILE nSumaPos > 0 
   nRes = nRes + TRANSFORM(IIF((nSumaPos / 2) - INT(nSumaPos / 2)>0,1,0))
   nSumaPos = INT(nSumaPos / 2) 
ENDDO  

RETURN  

a = (nSumaPos / 2) - INT(nSumaPos / 2)

  CASE BETWEEN(nKeyCode, 32, 126)	&& OR BETWEEN(nKeyCode, 97, 122) OR ;
       								&& BETWEEN(nKeyCode, 48, 57) OR ;
       								&& BETWEEN(nKeyCode, 33, 42) OR ;
       								&& nKeyCode = 32 OR nKeyCode = 64 OR nKeyCode = 94    


cstring = 'Empresa'
DO WHILE !EMPTY(cstring)
   IF AT(" ",cstring)=0
      a = ALLT(cstring)
   ELSE
      a = LEFT(cstring,AT(" ",cstring)-1)
   ENDIF 
   cstring = ALLTRIM(STRTRAN(cstring,a,' '))
   wait WINDOW a
ENDDO  
 
RETURN  
wait window SUBSTR(cstring,1,AT(" ",cstring,1)-1)
wait window SUBSTR(cstring,AT(" ",cstring,1)+1,AT(" ",cstring,2)-1-AT(" ",cstring,1)+1)
wait window SUBSTR(cstring,AT(" ",cstring,2)+1)

RETURN  

AT(" ",cstring,1)+1
cSTring = "14"
FOR i = 1 TO LEN(cSTring) 
f = LEFT(cSTring,1)
cSTring = ALLTRIM(STRTRAN(cSTring, f, '')) 
WAIT WINDOW f
NEXT 
 
*DAY(GOMONTH(DATE(),1)-DAY(DATE()))


*WAIT WINDOW RIGHT(c,AT("-",c)-1)
 
return

SET DATE DMY
c = "120 dias"
f = DATE()
d = VAL(LEFT(c,AT(" ",c)-1))
f = f + d

WAIT WINDOW DTOC(f) 
*DAY(GOMONTH(DATE(),1)-DAY(DATE()))


*WAIT WINDOW RIGHT(c,AT("-",c)-1)
 
return
*SUM(Orditems.unit_price*Orditems.quantity)-Orders.discount*0.01*SUM(Orditems.unit_price*Orditems.quantity)+Orders.freight AS ord_total
*SUM(Orditems.unit_price*Orditems.quantity-(0.01*Orders.discount*Orditems.unit_price*Orditems.quantity))+Orders.freight AS ordertotal

*SUM(Orditems.unit_price*Orditems.quantity)-Orders.discount*0.01*SUM(Orditems.unit_price*Orditems.quantity)+(Orders.freight*0.01*SUM(Orditems.unit_price*Orditems.quantity)) AS ord_total
*SUM(Orditems.unit_price*Orditems.quantity-(0.01*Orders.discount*Orditems.unit_price*Orditems.quantity)+(0.01*Orders.freight*Orditems.unit_price*Orditems.quantity)) AS ordertotal




*IIF(thisform.txtAvailCredit=0,"Efectivo"+CHR(13)+" "+"Cheque","15 dias,30 dias,45 dias,60 dias,90 dias,120 dias")
*Efectivo,Cheque,15 dias,30 dias,45 dias,60 dias,90 dias,120 dias