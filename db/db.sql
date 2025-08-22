

DROP TABLE IF EXISTS venta_producto;
DROP TABLE IF EXISTS venta;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS proveedor;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias(
    id INT PRIMARY KEY,
    descripcion VARCHAR(45) NOT NULL,
    estado SMALLINT DEFAULT 1
);


CREATE TABLE cliente(
    id VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    celular DECIMAL(10,0) NOT NULL,
    direccion VARCHAR(80) NOT NULL,
    correo_electronico VARCHAR(70) UNIQUE
);


CREATE TABLE proveedor(
    id_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    celular DECIMAL(10,0) NOT NULL,
    direccion VARCHAR(80) NOT NULL,
    correo_electronico VARCHAR(70) NOT NULL
);


CREATE TABLE producto(
    id_producto SERIAL PRIMARY KEY,
    id_categoria INT NOT NULL,
    id_proveedor INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    codigo_barras VARCHAR(150) NOT NULL,
    precio_venta DECIMAL(16,2) NOT NULL,
    cantidad_stock INT NOT NULL DEFAULT 0,
    estado SMALLINT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id) ON DELETE CASCADE,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) ON DELETE CASCADE
);


CREATE TABLE venta(
    id_venta SERIAL PRIMARY KEY,
    id_cliente VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    medio_pago CHAR(1) NOT NULL, 
    comentario VARCHAR(300),
    estado CHAR(1) NOT NULL DEFAULT 'A', 
    FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON DELETE CASCADE
);


CREATE TABLE venta_producto(
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(16,2) NOT NULL,
    total DECIMAL(16,2) NOT NULL,
    estado SMALLINT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE CASCADE
);


CREATE INDEX idx_categorias ON categorias(estado);
CREATE INDEX idx_cliente ON cliente(nombre);
CREATE INDEX idx_proveedor ON proveedor(nombre);
CREATE INDEX idx_producto ON producto(nombre);
CREATE INDEX idx_producto_stock ON producto(cantidad_stock);
CREATE INDEX idx_venta ON venta(estado, fecha);
CREATE INDEX idx_venta_producto ON venta_producto(cantidad);

