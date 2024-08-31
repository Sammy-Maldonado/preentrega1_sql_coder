-- Creando la base de datos
CREATE DATABASE preentrega1_sql_coder;

-- Usar la base de datos recién creada
USE preentrega1_sql_coder;

-- Tabla: Categoria
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Tabla: Productos
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    precio DECIMAL(10, 2) NOT NULL,
    color VARCHAR(50),
    stock INT
);

-- Tabla: Productos_Categorias (muchos a muchos)
CREATE TABLE Productos_Categorias (
    id_producto INT,
    id_categoria INT,
    PRIMARY KEY (id_producto, id_categoria)
);

-- Tabla: Proveedores
CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_representante VARCHAR(255),
    nombre_corporativo VARCHAR(255),
    telefono1 VARCHAR(20),
    telefono2 VARCHAR(20),
    secretaria VARCHAR(255),
    correo VARCHAR(255)
);

-- Tabla: Productos_Proveedores (muchos a muchos)
CREATE TABLE Productos_Proveedores (
    id_producto INT,
    id_proveedor INT,
    PRIMARY KEY (id_producto, id_proveedor)
);

-- Tabla: Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(255),
    apellido_cliente VARCHAR(255),
    direccion_cliente VARCHAR(255)
);

-- Tabla: Ordenes de Compra
CREATE TABLE Ordenes_Compra (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    total DECIMAL(10, 2)
);

-- Tabla: Ordenes_Productos (muchos a muchos)
CREATE TABLE Ordenes_Productos (
    id_orden INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    PRIMARY KEY (id_orden, id_producto)
);

-- Se añaden las relaciones con ALTER TABLE
-- Relación: Productos_Categorias
ALTER TABLE Productos_Categorias
ADD CONSTRAINT FK_Productos_Categorias_Productos
FOREIGN KEY (id_producto) REFERENCES Productos(id_productos);

ALTER TABLE Productos_Categorias
ADD CONSTRAINT FK_Productos_Categorias_Categoria
FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria);

-- Relación: Productos_Proveedores
ALTER TABLE Productos_Proveedores
ADD CONSTRAINT FK_Productos_Proveedores_Productos
FOREIGN KEY (id_producto) REFERENCES Productos(id_productos);

ALTER TABLE Productos_Proveedores
ADD CONSTRAINT FK_Productos_Proveedores_Proveedores
FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedores);

-- Relación: Ordenes_Compra
ALTER TABLE Ordenes_Compra
ADD CONSTRAINT FK_Ordenes_Compra_Clientes
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente);

-- Relación: Ordenes_Productos
ALTER TABLE Ordenes_Productos
ADD CONSTRAINT FK_Ordenes_Productos_Ordenes
FOREIGN KEY (id_orden) REFERENCES Ordenes_Compra(id_orden);

ALTER TABLE Ordenes_Productos
ADD CONSTRAINT FK_Ordenes_Productos_Productos
FOREIGN KEY (id_producto) REFERENCES Productos(id_productos);

-- Insertando datos en la tabla Categoria
INSERT INTO Categoria (nombre) VALUES
('Electrónica'),
('Ropa'),
('Hogar'),
('Deportes'),
('Juguetes'),
('Libros'),
('Automotriz'),
('Alimentos'),
('Salud'),
('Tecnología');

-- Insertando datos en la tabla Productos
INSERT INTO Productos (precio, color, stock) VALUES
(299.99, 'Negro', 50),
(49.99, 'Rojo', 150),
(15.99, 'Blanco', 200),
(89.99, 'Azul', 75),
(120.00, 'Verde', 100),
(199.99, 'Gris', 40),
(9.99, 'Amarillo', 300),
(25.99, 'Marrón', 250),
(599.99, 'Plateado', 20),
(39.99, 'Naranja', 180);

-- Insertando datos en la tabla Proveedores
INSERT INTO Proveedores (nombre_representante, nombre_corporativo, telefono1, telefono2, secretaria, correo) VALUES
('Juan Pérez', 'Electro S.A.', '123-4567', '234-5678', 'Marta Gómez', 'juan@electro.com'),
('Carlos Ruiz', 'RopaMax', '345-6789', '456-7890', 'Ana Torres', 'carlos@ropamax.com'),
('María López', 'HogarSeguro', '567-8901', '678-9012', 'Luis Romero', 'maria@hogarseguro.com'),
('Pedro Sánchez', 'Deportes y Más', '789-0123', '890-1234', 'Laura Medina', 'pedro@deportesymas.com'),
('Lucía García', 'Juguetes S.A.', '901-2345', '012-3456', 'Diego Flores', 'lucia@juguetessa.com'),
('Jorge Fernández', 'Libros Ltda.', '234-5678', '345-6789', 'Sara Díaz', 'jorge@librosltda.com'),
('Mónica Herrera', 'AutoParts', '456-7890', '567-8901', 'Antonio Rojas', 'monica@autoparts.com'),
('Andrés Gutiérrez', 'Comidas Inc.', '678-9012', '789-0123', 'Beatriz Silva', 'andres@comidasinc.com'),
('Rosa Márquez', 'SaludPro', '890-1234', '901-2345', 'José Navarro', 'rosa@saludpro.com'),
('Fernando Rivas', 'TechStore', '012-3456', '123-4567', 'Patricia Vargas', 'fernando@techstore.com');

-- Insertando datos en la tabla Clientes
INSERT INTO Clientes (nombre_cliente, apellido_cliente, direccion_cliente) VALUES
('Luis', 'González', 'Calle 123, Ciudad A'),
('María', 'Martínez', 'Avenida 456, Ciudad B'),
('Pedro', 'Rodríguez', 'Pasaje 789, Ciudad C'),
('Ana', 'Gómez', 'Calle 101, Ciudad D'),
('Jorge', 'Hernández', 'Avenida 202, Ciudad E'),
('Carmen', 'Díaz', 'Pasaje 303, Ciudad F'),
('Carlos', 'Fernández', 'Calle 404, Ciudad G'),
('Lucía', 'Morales', 'Avenida 505, Ciudad H'),
('Fernando', 'Rojas', 'Pasaje 606, Ciudad I'),
('Laura', 'Pérez', 'Calle 707, Ciudad J');

-- Insertando datos en la tabla Ordenes_Compra
INSERT INTO Ordenes_Compra (id_cliente, fecha, total) VALUES
(1, '2024-08-01', 299.99),
(2, '2024-08-02', 49.99),
(3, '2024-08-03', 15.99),
(4, '2024-08-04', 89.99),
(5, '2024-08-05', 120.00),
(6, '2024-08-06', 199.99),
(7, '2024-08-07', 9.99),
(8, '2024-08-08', 25.99),
(9, '2024-08-09', 599.99),
(10, '2024-08-10', 39.99);

-- Insertando datos en la tabla Productos_Categorias
INSERT INTO Productos_Categorias (id_producto, id_categoria) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insertando datos en la tabla Productos_Proveedores
INSERT INTO Productos_Proveedores (id_producto, id_proveedor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insertando datos en la tabla Ordenes_Productos
INSERT INTO Ordenes_Productos (id_orden, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 299.99),
(2, 2, 1, 49.99),
(3, 3, 1, 15.99),
(4, 4, 1, 89.99),
(5, 5, 1, 120.00),
(6, 6, 1, 199.99),
(7, 7, 1, 9.99),
(8, 8, 1, 25.99),
(9, 9, 1, 599.99),
(10, 10, 1, 39.99);