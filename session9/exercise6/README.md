# logic procedure

- dau tien la tao procedure voi cac tham so in customer_id, product_id, quantity
  va out parameter la message. orders table can them 2 columns nua la total_amount va status, tuy nhien khong can nhap vi status co default vaf total_amout se duoc tinh toan khi insert.

- than procedure: khai bao bien \_stock, \_price de lay data tu ban products.
  kiem tra if statement neu \_stock < \_quantity nhap vao thi assign message het han.
  neu \_stock>= quantity thi insert data order vao table orders.
  update data table products vi khi tao new order thi stock se giam theo quantity.
  assign cho out parameter khi insert successfully
