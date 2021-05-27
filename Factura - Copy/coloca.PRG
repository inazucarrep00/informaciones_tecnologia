SELECT order_line_items
GO TOP 
c=0
SCAN
   IF SEEK(product_id,"Products","product_id")
      replace name_product WITH Products.product_name
   ENDIF 
   c=c+1
ENDSCAN 
