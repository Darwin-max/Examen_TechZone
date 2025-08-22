-- 1️ Listar los productos con stock menor a 5 unidades.

SELECT 
    producto.nombre,
    producto.cantidad_stock
FROM producto
WHERE cantidad_stock BETWEEN 0 AND 5;


-- 2️ Calcular ventas totales de un mes específico.

SELECT 
    DATE_TRUNC('month', fecha) AS mes,
    COUNT(DISTINCT id_venta) AS numero_ventas,
    SUM(total) AS total_ventas
FROM venta
JOIN venta_producto USING (id_venta)
GROUP BY DATE_TRUNC('month', fecha)
ORDER BY mes;

-- 3 la mente no me dio para tanto
-- 3️ Obtener el cliente con más ventas realizadas.

SELECT 
    cliente.id,
    cliente.nombre || ' ' || cliente.apellidos AS cliente,
    SUM(venta_producto.total) AS gasto_total,
    COUNT(DISTINCT venta.id_venta) AS numero_venta,
    RANK() OVER (ORDER BY SUM(venta_producto.total) DESC) AS ranking_gasto
FROM venta
JOIN cliente USING (id_cliente)
JOIN venta_producto USING (id_venta)
GROUP BY cliente.id, cliente.nombre, cliente.apellidos;

-- 4️ Listar los productos más vendidos.
SELECT 
    producto.nombre,
    SUM(venta_producto.cantidad) AS unidades_vendidas,
    SUM(venta_producto.total) AS ingreso_total
FROM venta_producto
JOIN producto USING (id_producto)
GROUP BY producto.nombre
ORDER BY unidades_vendidas DESC, ingreso_total DESC
LIMIT 10; 

-- 5️ Consultar ventas realizadas en un rango de fechas.

CREATE OR REPLACE VIEW ventaventas_por_compra AS
SELECT 
    venta.id_venta,
    venta.id_cliente,
    venta.fecha,
    SUM(venta_producto.total) AS total_compra
FROM venta
JOIN venta_producto USING (id_venta)
GROUP BY venta.id_venta, venta.id_cliente, venta.fecha;

SELECT * FROM ventaventas_por_compra;

-- 6️ Identificar clientes que no han comprado en los últimos 6 meses.

SELECT *
FROM producto p
WHERE NOT EXISTS (
    SELECT 1
    FROM venta_producto cp
    WHERE cp.id_producto = p.id_producto
);