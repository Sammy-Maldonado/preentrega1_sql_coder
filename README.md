# Preentrega: Proyecto de Base de Datos SQL

## Alumno
- Sammy Maldonado

## Tecnologías utilizadas
- MySQL Workbench

## Descripción del proyecto
Este proyecto tiene como objetivo la creación de una base de datos para un sistema de gestión de productos, proveedores, clientes y órdenes de compra. La base de datos incluye las siguientes tablas:
- **Categoria**: Almacena las categorías de productos.
- **Productos**: Contiene información sobre los productos, como precio, color y stock.
- **Productos_Categorias**: Relaciona productos con categorías (relación muchos a muchos).
- **Proveedores**: Información sobre los proveedores de los productos.
- **Productos_Proveedores**: Relaciona productos con proveedores (relación muchos a muchos).
- **Clientes**: Información de los clientes.
- **Ordenes_Compra**: Detalles sobre las órdenes de compra realizadas por los clientes.
- **Ordenes_Productos**: Relaciona las órdenes con los productos adquiridos (relación muchos a muchos).

## Diagramas
El diagrama de entidad-relación (ER) para la base de datos está disponible en el siguiente enlace:
- [Diagrama ER](https://github.com/Sammy-Maldonado/preentrega1_sql_coder)

## Tablas

### Categoria
- **id_categoria**: INT, Clave primaria, AUTO_INCREMENT
- **nombre**: VARCHAR(255), No Nulo

### Productos
- **id_producto**: INT, Clave primaria, AUTO_INCREMENT
- **precio**: DECIMAL(10, 2), No Nulo
- **color**: VARCHAR(50)
- **stock**: INT

### Productos_Categorias
- **id_producto**: INT, Clave primaria, Clave foránea (Productos)
- **id_categoria**: INT, Clave primaria, Clave foránea (Categoria)

### Proveedores
- **id_proveedor**: INT, Clave primaria, AUTO_INCREMENT
- **nombre_representante**: VARCHAR(255)
- **nombre_corporativo**: VARCHAR(255)
- **telefono1**: VARCHAR(20)
- **telefono2**: VARCHAR(20)
- **secretaria**: VARCHAR(255)
- **correo**: VARCHAR(255)

### Productos_Proveedores
- **id_producto**: INT, Clave primaria, Clave foránea (Productos)
- **id_proveedor**: INT, Clave primaria, Clave foránea (Proveedores)

### Clientes
- **id_cliente**: INT, Clave primaria, AUTO_INCREMENT
- **nombre_cliente**: VARCHAR(255)
- **apellido_cliente**: VARCHAR(255)
- **direccion_cliente**: VARCHAR(255)

### Ordenes_Compra
- **id_orden**: INT, Clave primaria, AUTO_INCREMENT
- **id_cliente**: INT, Clave foránea (Clientes)
- **fecha**: DATE
- **total**: DECIMAL(10, 2)

### Ordenes_Productos
- **id_orden**: INT, Clave primaria, Clave foránea (Ordenes_Compra)
- **id_producto**: INT, Clave primaria, Clave foránea (Productos)
- **cantidad**: INT
- **precio_unitario**: DECIMAL(10, 2)

## Scripts SQL
El archivo SQL para la creación de la base de datos y las tablas se encuentra disponible en el siguiente enlace:
- [Script SQL](https://github.com/Sammy-Maldonado/preentrega1_sql_coder)