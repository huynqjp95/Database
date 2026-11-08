-- trigger before INSERT
delimiter //
create trigger before_insert_orderitems before insert on order_items
FOR EACH ROW
BEGIN
    DECLARE v_stock int;
    SELECT stock_quantity INTO v_stock from inventory where product_id = new.product_id;
    IF  v_stock < new.quantity THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
    'Not enough the quantity in the stock';
    END IF;
END //
delimiter ;

-- trigger after insert 
delimiter //
CREATE TRIGGER after_insert_orders AFTER INSERT ON order_items
FOR EACH ROW
BEGIN 
    UPDATE orders SET total_amount = total_amount + new.quantity * new.price 
    where order_id = new.order_id;
END//
delimiter ;

-- trigger before update 
delimiter //
CREATE TRIGGER before_update_orderitems BEFORE UPDATE ON order_items 
FOR EACH ROW
BEGIN
    DECLARE v_stock int;
    SELECT stock_quantity into v_stock FROM inventory WHERE product_id = new.product_id;
    IF new.quantity - old.quantity > v_stock THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough the quantity in the stock';
    END IF;
END //
delimiter ;

-- trigger after update
delimiter //
CREATE TRIGGER after_update_orderitems AFTER UPDATE ON order_items
for each ROW
BEGIN
    UPDATE orders 
    set total_amount = total_amount + (new.quantity*new.price)- (old.quantity*old.price)
    WHERE order_id = new.order_id;
END //
delimiter ;
