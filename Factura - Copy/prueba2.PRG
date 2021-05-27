
	SELECT IIF(ISNULL(MIN(order_number)),'',order_number) as order_number ;
	FROM orders ;
	WHERE TYPE(order_number)<>'U' AND !comanprocesada AND VAL(order_number)#0 GROUP BY order_number INTO CURSOR qMinOrden 


RETURN 
SELECT b.product_id, b.codprod, a.category_name;
FROM category a;
INNER JOIN products b;
ON a.category_id = b.category_id ;
INTO array qq
?qq[5]
RETURN 
		SELECT b.company_name, b.customer_id, b.company_name as company_na, 2 as grupo ;
 		 FROM orders a;
 		 INNER JOIN customer b;
  		ON a.customer_id = b.customer_id ;
  		WHERE a.tipo_doc='F' AND;
  		a.montorecibido =0 INTO CURSOR tmp     
RETURN 
SELECT Maqpto.descri_cpu, Maqpto.name_abre, Maqpto.clave_oper,;
  tmpcierre.nro_cierre, tmpcierre.monto_ini, tmpcierre.cash,;
  tmpcierre.cheques, tmpcierre.monto_repo, tmpcierre.tot_al_cie,;
  tmpcierre.resultado, Docs.descri_doc, Docs.monto, Docs.sw_cash,;
  tmpcierre.apertura, tmpcierre.hora_abre, tmpcierre.cierre,Maqpto.turno,;
  tmpcierre.hora_cie, Docs.fecha_e, Docs.nro_fact, 2 AS grupo;
 FROM tastrade!maqpto INNER JOIN tmpcierre;
    INNER JOIN tastrade!docs ;
   ON  tmpcierre.cierre = Docs.fecha_e ;
   ON  Maqpto.descri_cpu = tmpcierre.descri_cpu;
 WHERE tmpcierre.descri_cpu = Docs.maq_pto AND maqpto.turno=IIF(BETWEEN(VAL(LEFT(TIME(),2)),2,15),1,2);
   AND (Docs.tipo_doc = "P" ;
   ORDER BY Docs.sw_cash, Docs.nro_fact INTO CURSOR reportecaja
   
 
 
RETURN  
		SELECT b.company_name, b.customer_id, b.company_name as company_na, 2 as grupo ;
 		 FROM orders a;
 		 INNER JOIN customer b;
  		ON a.customer_id = b.customer_id ;
  		WHERE a.tipo_doc='F' AND;
  		a.montorecibido =0 INTO CURSOR tmp     
RETURN 
*SELECT MAX(a.order_number), a.order_number, a.customer_id, d.company_name ;
FROM orders a;
INNER JOIN customer b;
ON a.customer_id = b.customer_id ;
WHERE TYPE(a.order_number)<>'U' AND a.montorecibido=0 ;
GROUP BY a.customer_id, a.order_number, b.company_name ORDER BY a.customer_id ASC INTO CURSOR qq5

SELECT MAX(order_number) as order_number ;
FROM orders ;
WHERE TYPE(order_number)<>'U' AND montorecibido=0;
GROUP BY order_number ORDER BY order_number DESC INTO CURSOR qq7
 
nFactura = order_number

SELECT MAX(a.order_number) as order_number, a.customer_id, a.ship_to_name, c.product_id, c.name_product ;
FROM orders a;
INNER JOIN order_line_items c;
ON a.order_id = c.order_id;
WHERE TYPE(a.order_number)<>'U' AND a.montorecibido=0 AND a.order_number=nFactura;
GROUP BY a.customer_id, order_number, a.ship_to_name, c.product_id, c.name_product ORDER BY a.order_number ASC INTO CURSOR qq5



*SELECT MAX(a.order_number) as order_number, a.customer_id, b.company_name ;
FROM orders a;
INNER JOIN customer b;
INNER JOIN order_line_items c;
ON a.customer_id = b.customer_id ;
ON a.order_id = c.order_id;
WHERE TYPE(a.order_number)<>'U' AND a.montorecibido=0 ;
GROUP BY a.customer_id, order_number, b.company_name ORDER BY a.customer_id ASC INTO CURSOR qq5



RETURN 


 
RETURN 
SELECT distinct(company_name) as company, customer_id  FROM customer WHERE tipocliente = 'ME' INTO CURSOR qq1
GO top
SCAN
   Select MAX(order_number) as order_number FROM orders WHERE TYPE(order_number)<>'U' AND customer_id = qq1.customer_id
ENDSCAN 


SELECT a.montofact, a.montorecibido, a.order_number, a.customer_id ;
FROM orders a;
INNER JOIN customer b;
ON a.customer_id = b.customer_id ;
WHERE TYPE(a.order_number)<>'U' AND b.tipocliente = 'ME' ORDER BY a.customer_id ASC INTO CURSOR qq5

RETURN 

SELECT company_name, customer_id;
FROM customer WHERE tipocliente = 'ME' INTO CURSOR qq1

  
 Select order_number, customer_id, montorecibido, montofact FROM orders WHERE TYPE(order_number)<>'U' AND montorecibido=0 ;
 ORDER BY customer_id ASC INTO CURSOR qq3
 
SELECT MAX(a.order_number), a.montorecibido, a.order_number, a.customer_id, b.company_name ;
FROM orders a;
INNER JOIN customer b;
ON a.customer_id = b.customer_id ;
WHERE TYPE(a.order_number)<>'U' AND b.tipocliente = 'ME' ;
GROUP BY a.customer_id, a.montorecibido, a.order_number, a.customer_id, b.company_name ORDER BY a.customer_id ASC INTO CURSOR qq5







Select MAX(b.order_number) as order_number, b.customer_id, COUNT(b.customer_id) FROM orders b WHERE TYPE(b.order_number)<>'U' GROUP BY b.customer_id ;
ORDER BY b.customer_id ASC INTO CURSOR qq2




RETURN 
SELECT a.montofact, a.montorecibido, a.order_number, a.customer_id, b.company_name ;
FROM orders a;
INNER JOIN customer b;
ON a.customer_id = b.customer_id ;
WHERE TYPE(a.order_number)<>'U' AND b.tipocliente = 'ME' AND order_number = ;
(SELECT MAX(order_number) FROM orders WHERE TYPE(order_number)<>'U' GROUP BY customer_id ORDER BY a.customer_id ASC INTO CURSOR qq4





 

*SELECT a.customer_id, a.company_name, b.order_number FROM qq1 a WHERE a.customer_id in (SELECT b.customer_id FROM qq2 b)  

*SELECT customer, order_number

RETURN 
*Select MAX(b.order_number) FROM orders b WHERE TYPE(b.order_number)<>'U' GROUP BY b.order_number

SELECT a.company_name, b.montorecibido, b.order_number FROM customer a, orders b WHERE ;
a.customer_id = b.customer_id AND a.tipocliente = 'ME' AND b.order_number = (Select MAX(b.order_number) FROM orders b WHERE TYPE(b.order_number)<>'U')  GROUP BY a.tipocliente


 

RETURN 

SELECT a.company_name, b.montorecibido, b.order_number, a.customer_id ;
FROM customer a;
INNER JOIN orders b;
ON a.customer_id = b.customer_id ;
WHERE b.order_number = ;
(Select MAX(b.order_number) as maxOrden FROM orders b ;
WHERE TYPE(b.order_number)<>'U') INTO CURSOR qq0









RETURN

cust = '000143'

     Select MAX(order_number) as maxOrden FROM orders WHERE TYPE(order_number)<>'U' AND  customer_id = cust
RETURN 
SELECT order_number, montofact, montorecibido FROM orders ;
WHERE order_number = (select MAX(order_number) FROM orders;
                      WHERE TYPE(order_number)<>'U' AND customer_id = cust)


RETURN 

     Select MAX(order_number) as maxOrden FROM orders WHERE TYPE(order_number)<>'U' AND  customer_id = cust INTO CURSOR qMaxVenta


cFactura = '  4416'
SELECT Orders.order_number, Orders.order_date, Orders.ship_to_name,;
  Orders.ship_to_address, Orders.ship_to_postal_code, Orders.discount,;
  Orders.freight, Order_line_items.unit_price, Order_line_items.quantity,;
  Customer.company_name, Customer.address, Customer.postal_code,;
  Products.product_name, Orders.deliver_by, Customer.customer_id,;
  Orders.tipo_doc, Orders.cotiz_number,;
  ALLTRIM(Orders.sec_fija)+ALLTRIM(Orders.sec_ini) AS ncf,;
  Order_line_items.impto, Products.excenimpto, Customer.phone,;
  Customer.fax, Customer.imail, Order_line_items.product_id,;
  Products.cod_fabri, Orders.notes, Orders.cod_pais, Orders.prov_id,;
  Orders.ship_to_region, Shippers.company_name AS vendedor,;
  Orders.id_terms, Orders.montofact, Orders.montorecibido, Orders.ven_id,;
  Order_line_items.itemelim, Orders.sec_fija, Orders.sec_ini,;
  Orders.vendedor AS vendedor2, Orders.cajero, Orders.notadesc,;
  Order_line_items.name_product, Orders.fac_elim,;
  Order_line_items.descto,;
  Order_line_items.descto*Order_line_items.unit_price*Order_line_items.quantity*0.01 AS descuento;
 FROM ;
     tastrade!order_line_items,;
    tastrade!customer,;
    tastrade!shippers,;
    tastrade!products,;
    tastrade!employee ;
    INNER JOIN tastrade!Orders ;
   ON  Employee.employee_id = Orders.employee_id;
 WHERE ( ( (  Orders.order_id = Order_line_items.order_id;
   AND  Orders.customer_id = Customer.customer_id );
   AND  Orders.shipper_id = Shippers.shipper_id );
   AND  Order_line_items.product_id = Products.product_id );
   AND  ( (  Orders.order_id = ( cFactura );
   AND  DELETED() = ( .F. ) );
   AND  Order_line_items.itemelim = ( .F. ) );
 ORDER BY Orders.order_date DESC, Orders.order_number