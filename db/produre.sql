-- 1️ Un procedimiento almacenado para registrar una venta.
CREATE OR REPLACE PROCEDURE create_venta(
    ctv_id_cliente VARCHAR(20),
    ctv_fecha DATE,
    ctv_medio_pago CHAR(1),
    ctv_comentario VARCHAR(300),
    ctv_estado CHAR(1),
    ctv_cantidad INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    new_venta_id INTEGER;
BEGIN
    
    INSERT INTO venta (id_cliente, fecha, medio_pago, comentario, estado, cantidad)
    VALUES (ctv_id_cliente, ctv_fecha, ctv_medio_pago, ctv_comentario, ctv_estado, ctv_cantidad)
    RETURNING id_venta INTO new_venta_id;

    RAISE NOTICE 'Venta creada con ID: %', new_venta_id;
END;
$$;

-- 2️ Procedimiento para crear un cliente.
CREATE OR REPLACE PROCEDURE create_cliente(
    ctc_id VARCHAR(20),
    ctc_nombre VARCHAR(40),
    ctc_apellidos VARCHAR(100),
    ctc_celular DECIMAL(10,0),
    ctc_direccion VARCHAR(80),
    ctc_correo_electronico VARCHAR(70)
)
LANGUAGE plpgsql
AS $$
BEGIN
    
    INSERT INTO cliente (id, nombre, apellidos, celular, direccion, correo_electronico)
    VALUES (ctc_id, ctc_nombre, ctc_apellidos, ctc_celular, ctc_direccion, ctc_correo_electronico);

    RAISE NOTICE 'Cliente creado con ID: %', ctc_id;
END;
$$;

-- 3️ Procedimiento para verificar stock antes de procesar una venta.
CREATE OR REPLACE PROCEDURE verificar_stock(
    p_id_producto INT,
    p_cantidad_solicitada INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    stock_disponible INT;
BEGIN
    
    SELECT cantidad_stock INTO stock_disponible
    FROM producto
    WHERE id_producto = p_id_producto;
    
    
    IF stock_disponible >= p_cantidad_solicitada THEN
        RAISE NOTICE 'Stock suficiente. Disponible: %, Solicitado: %', stock_disponible, p_cantidad_solicitada;
    ELSE
        RAISE EXCEPTION 'Stock insuficiente. Disponible: %, Solicitado: %', stock_disponible, p_cantidad_solicitada;
    END IF;
END;
$$;

-- 4️ Procedimiento para actualizar stock después de una venta.
CREATE OR REPLACE PROCEDURE actualizar_stock(
    p_id_producto INT,
    p_cantidad_vendida INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    
    UPDATE producto 
    SET cantidad_stock = cantidad_stock - p_cantidad_vendida
    WHERE id_producto = p_id_producto;
    
    RAISE NOTICE 'Stock actualizado para producto %: se vendieron % unidades', p_id_producto, p_cantidad_vendida;
END;
$$;