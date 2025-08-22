INSERT INTO categorias (id, descripcion, estado) VALUES
(1, 'Laptops', 1),
(2, 'Smartphones', 1),
(3, 'Tablets', 1),
(4, 'Accesorios', 1),
(5, 'Componentes PC', 1),
(6, 'Gaming', 1),
(7, 'Audio', 1),
(8, 'Cámaras', 1),
(9, 'Impresoras', 1),
(10, 'Software', 1);



INSERT INTO cliente (id, nombre, apellidos, celular, direccion, correo_electronico) VALUES
('CC1001', 'Juan', 'Pérez Gómez', 3001234567, 'Cra 10 #12-34', 'juan.perez@mail.com'),
('CC1002', 'María', 'López Ríos', 3012345678, 'Cl 20 #5-67', 'maria.lopez@mail.com'),
('CC1003', 'Carlos', 'Martínez Ruiz', 3023456789, 'Av 15 #45-21', 'carlos.martinez@mail.com'),
('CC1004', 'Ana', 'García Torres', 3034567890, 'Cra 7 #89-12', 'ana.garcia@mail.com'),
('CC1005', 'Pedro', 'Ramírez Díaz', 3045678901, 'Cl 50 #12-56', 'pedro.ramirez@mail.com'),
('CC1006', 'Laura', 'Suárez Peña', 3056789012, 'Cra 15 #33-44', 'laura.suarez@mail.com'),
('CC1007', 'Andrés', 'Castro Mejía', 3067890123, 'Cl 8 #21-11', 'andres.castro@mail.com'),
('CC1008', 'Valentina', 'Morales Cárdenas', 3078901234, 'Av 30 #10-20', 'valentina.morales@mail.com'),
('CC1009', 'Santiago', 'Ortega Parra', 3089012345, 'Cra 22 #5-99', 'santiago.ortega@mail.com'),
('CC1010', 'Daniela', 'Rincón Vargas', 3090123456, 'Cl 12 #8-66', 'daniela.rincon@mail.com');


INSERT INTO proveedor (nombre, apellidos, celular, direccion, correo_electronico) VALUES
('Apple', 'Inc Colombia', 3001234567, 'Cra 10 #12-34', 'apple.colombia@apple.com'),
('Samsung', 'Electronics Colombia', 3012345678, 'Cl 20 #5-67', 'samsung.col@samsumg.com'),
('HP', 'Colombia S.A.', 3023456789, 'Av 15 #45-21', 'hp.colombia@hp.com'),
('Dell', 'Technologies Colombia', 3034567890, 'Cra 7 #89-12', 'dell.col@dell.com'),
('Lenovo', 'Colombia Ltda', 3045678901, 'Cl 50 #12-56', 'lenovo.col@lenovo.com'),
('ASUS', 'Computer Colombia', 3056789012, 'Cra 15 #33-44', 'asus.col@asus.com'),
('Logitech', 'Colombia S.A.', 3067890123, 'Cl 8 #21-11', 'logitech.col@logitech.com'),
('Canon', 'Colombia Ltda', 3078901234, 'Av 30 #10-20', 'canon.col@canon.com'),
('Microsoft', 'Colombia S.A.', 3089012345, 'Cra 22 #5-99', 'microsoft.col@microsoft.com'),
('Intel', 'Colombia Ltda', 3090123456, 'Cl 12 #8-66', 'intel.col@intel.com');

INSERT INTO producto (id_categoria, id_proveedor, nombre, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
(1, 1, 'MacBook Air M2 13"', '7701234567890', 4500000, 15, 1),
(1, 2, 'Samsung Galaxy Book2 15"', '7700987654321', 2800000, 25, 1),
(1, 3, 'HP Pavilion 15"', '7701122334455', 2200000, 30, 1),
(2, 2, 'Samsung Galaxy S23', '7705566778899', 2800000, 40, 1),
(2, 1, 'iPhone 14 Pro', '7706677889900', 4200000, 35, 1),
(2, 4, 'Dell XPS 13"', '7707788990011', 3800000, 20, 1),
(3, 1, 'iPad Air 10.9"', '7708899001122', 2800000, 25, 1),
(3, 2, 'Samsung Galaxy Tab S8', '7709900112233', 2200000, 30, 1),
(4, 6, 'Mouse Logitech MX Master 3', '7701111222333', 180000, 50, 1),
(4, 6, 'Teclado Logitech K780', '7702222333444', 250000, 45, 1),
(5, 10, 'Procesador Intel i7-12700K', '7703333444555', 1800000, 12, 1),
(5, 6, 'Tarjeta Gráfica RTX 4070', '7704444555666', 3200000, 8, 1),
(6, 6, 'Mouse Gaming Logitech G502', '7705555666777', 280000, 60, 1),
(7, 6, 'Audífonos Logitech G733', '7706666777888', 450000, 35, 1),
(8, 8, 'Cámara Canon EOS R50', '7707777888999', 2800000, 18, 1),
(9, 3, 'Impresora HP LaserJet Pro', '7708888999000', 1200000, 22, 1);


INSERT INTO venta (id_cliente, fecha, medio_pago, comentario, estado) VALUES
('CC1001', '2025-01-15', 'E', 'Compra en efectivo', 'A'),
('CC1002', '2025-01-16', 'T', 'Compra con tarjeta', 'A'),
('CC1003', '2025-01-17', 'E', 'Compra de rutina', 'A'),
('CC1004', '2025-01-18', 'T', 'Compra mensual', 'A'),
('CC1005', '2025-01-19', 'E', 'Compra grande', 'A'),
('CC1006', '2025-01-20', 'T', 'Compra semanal', 'A'),
('CC1007', '2025-01-21', 'E', 'Compra ocasional', 'A'),
('CC1008', '2025-01-22', 'T', 'Compra variada', 'A'),
('CC1009', '2025-01-23', 'E', 'Compra de prueba', 'A'),
('CC1010', '2025-01-24', 'T', 'Compra de emergencia', 'A');


INSERT INTO venta_producto (id_venta, id_producto, cantidad, precio_unitario, total, estado) VALUES
(1, 1, 1, 4500000, 4500000, 1),
(1, 9, 1, 180000, 180000, 1),
(2, 2, 1, 2800000, 2800000, 1),
(3, 4, 1, 2800000, 2800000, 1),
(4, 5, 1, 4200000, 4200000, 1),
(5, 6, 1, 3800000, 3800000, 1),
(6, 7, 1, 2800000, 2800000, 1),
(7, 8, 1, 2200000, 2200000, 1),
(8, 10, 1, 250000, 250000, 1),
(9, 11, 1, 1800000, 1800000, 1),
(10, 12, 1, 3200000, 3200000, 1);