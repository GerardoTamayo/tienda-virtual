USE db_niki;

/*TRIGGER*/
DELIMITER //

CREATE TRIGGER actualizar_stock_despues_de_pedido AFTER INSERT ON tb_detalle_pedidos
FOR EACH ROW
BEGIN
    DECLARE cantidad INT;
    
    -- Obtener la cantidad del producto del detalle del pedido
    SELECT cantidad_producto INTO cantidad FROM tb_detalle_pedidos WHERE id_detalle_pedido = NEW.id_detalle_pedido;
    
    -- Actualizar el stock del producto correspondiente
    UPDATE tb_detalle_productos 
    SET stock_producto = stock_producto - cantidad 
    WHERE id_detalle_producto = NEW.id_detalle_producto;
    
END;
//

DELIMITER ;


/*FUNCION*/
DELIMITER //

CREATE FUNCTION verificarExistencias(id_producto INT) RETURNS VARCHAR(100)
BEGIN
    DECLARE existencias INT;
    DECLARE mensaje VARCHAR(100);
    
    -- Obtener las existencias del producto
    SELECT COUNT(*) INTO existencias
    FROM tb_productos
    WHERE id_producto = id_producto_param;
    
    -- Verificar si las existencias superan el máximo permitido (25)
    IF existencias >= 25 THEN
        SET mensaje = CONCAT('Las existencias del producto ', id_producto_param, ' han alcanzado o superado el límite máximo (25).');
    ELSE
        SET mensaje = CONCAT('Las existencias del producto ', id_producto_param, ' están dentro del límite máximo.');
    END IF;
    
    RETURN mensaje;
END //

DELIMITER ;

/*PROCEDIMIENTO ALMACENADO*/
DELIMITER //

CREATE PROCEDURE realizarPedido(
    IN cliente_id INT,
    IN direccion_pedido VARCHAR(255),
    IN detalle_pedido JSON
)
BEGIN
    DECLARE total_pedido DECIMAL(10,2);
    DECLARE id_pedido_inserted INT;
    DECLARE producto_id INT;
    DECLARE cantidad INT;
    DECLARE precio_producto DECIMAL(5,2);
    
    -- Insertar el pedido en la tabla tb_pedidos
    INSERT INTO tb_pedidos (id_cliente, direccion_pedido)
    VALUES (cliente_id, direccion_pedido);
    
    -- Obtener el ID del pedido insertado
    SET id_pedido_inserted = LAST_INSERT_ID();
    
    -- Iterar sobre los detalles del pedido
    detalle_loop: LOOP
        -- Extraer los datos del detalle del pedido
        SET producto_id = JSON_EXTRACT(detalle_pedido, CONCAT('$[', @index, '].id_producto'));
        SET cantidad = JSON_EXTRACT(detalle_pedido, CONCAT('$[', @index, '].cantidad_producto'));
        SET precio_producto = JSON_EXTRACT(detalle_pedido, CONCAT('$[', @index, '].precio_producto'));
        
        -- Salir del bucle si no hay más detalles
        IF producto_id IS NULL THEN
            LEAVE detalle_loop;
        END IF;
        
        -- Insertar el detalle del pedido en la tabla tb_detalle_pedidos
        INSERT INTO tb_detalle_pedidos (id_pedido, id_detalle_producto, precio_producto, cantidad_producto)
        VALUES (id_pedido_inserted, producto_id, precio_producto, cantidad);
        
        -- Actualizar el stock del producto en la tabla tb_detalle_productos
        UPDATE tb_detalle_productos
        SET stock_producto = stock_producto - cantidad
        WHERE id_producto = producto_id;
        
        -- Incrementar el índice del detalle del pedido
        SET @index = @index + 1;
    END LOOP detalle_loop;
END //

DELIMITER ;
