create database TechStore

use TechStore


CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    mail VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    ciudad VARCHAR(100),
    cp VARCHAR(10)
);

CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR(50),
    metodo_pago VARCHAR(50),
    monto_total DECIMAL(10, 2),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE proveedores (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_nombre VARCHAR(100) NOT NULL,
    contacto_nombre VARCHAR(100),
    contacto_mail VARCHAR(100),
    contacto_telefono VARCHAR(20),
    contacto_direccion VARCHAR(255),
    contacto_ciudad VARCHAR(100),
    contacto_cp VARCHAR(10)
);


CREATE TABLE productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    stock INT NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(50),
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

CREATE TABLE detalles_pedido (
    detalle_pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    detalle_pedido_precio DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);


INSERT INTO clientes (nombre, apellido, mail, telefono, direccion, ciudad, cp) VALUES
('Juan', 'Gómez', 'juangomez@gmail.com', '123456789', 'Avenida Belgrano 123', 'Buenos Aires', '1000'),
('María', 'Rossi', 'mariarossi@gmail.com', '987654321', 'Calle San Martín 456', 'Rosario', '2000'),
('Pedro', 'Fernández', 'pedrofernandez@gmail.com', '234567890', 'Calle Lavalle 789', 'Córdoba', '5000'),
('Lucía', 'Bianchi', 'luciabianchi@gmail.com', '345678901', 'Calle Mitre 321', 'Mendoza', '5500'),
('Carlos', 'López', 'carloslopez@gmail.com', '456789012', 'Calle Moreno 654', 'Salta', '4400'),
('Ana', 'Pérez', 'anaperez@gmail.com', '567890123', 'Calle Sarmiento 789', 'La Plata', '1900'),
('Luis', 'Martínez', 'luismartinez@gmail.com', '678901234', 'Avenida Rivadavia 456', 'Tucumán', '4000'),
('Sofía', 'Romero', 'sofiaromero@gmail.com', '789012345', 'Calle Urquiza 123', 'Santa Fe', '3000'),
('Jorge', 'García', 'jorgegarcia@gmail.com', '890123456', 'Avenida San Martín 789', 'Neuquén', '8300'),
('Elena', 'Russo', 'elenarusso@gmail.com', '901234567', 'Calle Güemes 456', 'Chaco', '3500');

-- Insertando datos en la tabla de proveedores
INSERT INTO proveedores (proveedor_nombre, contacto_nombre, contacto_mail, contacto_telefono, contacto_direccion, contacto_ciudad, contacto_cp) VALUES
('Tech Supply', 'Carlos López', 'carloslopez@gmail.com', '321654987', 'Calle Güemes 456', 'Mendoza', '5500'),
('ElectroWorld', 'Ana Bianchi', 'anabianchi@gmail.com', '456123789', 'Avenida Rivadavia 123', 'La Plata', '1900'),
('Global Tech', 'José Hernández', 'josehernandez@gmail.com', '789654321', 'Calle Moreno 789', 'Salta', '4400');

-- Insertando datos en la tabla de productos
INSERT INTO productos (nombre_producto, stock, descripcion, precio, categoria, proveedor_id) VALUES
('Computadora Desktop', 50, 'Computadora de escritorio con 16GB RAM y 1TB SSD', 80000.00, 'Computadoras', 1),
('Laptop', 30, 'Laptop con 8GB RAM y 512GB SSD', 60000.00, 'Laptops', 2),
('Teléfono', 100, 'Teléfono inteligente con 128GB de almacenamiento', 20000.00, 'Teléfonos', 3),
('Tablet', 40, 'Tablet con 4GB RAM y 64GB de almacenamiento', 15000.00, 'Tablets', 1),
('Impresora', 25, 'Impresora multifunción con conexión Wi-Fi', 10000.00, 'Impresoras', 2),
('Monitor', 35, 'Monitor de 24 pulgadas Full HD', 12000.00, 'Monitores', 3),
('Teclado', 60, 'Teclado mecánico con retroiluminación', 5000.00, 'Periféricos', 1),
('Mouse', 70, 'Mouse óptico inalámbrico', 3000.00, 'Periféricos', 2),
('Auriculares', 80, 'Auriculares con micrófono y cancelación de ruido', 7000.00, 'Audio', 3),
('Disco Duro Externo', 45, 'Disco duro externo de 1TB', 9000.00, 'Almacenamiento', 1);

-- Insertando datos en la tabla de pedidos
INSERT INTO pedidos (fecha_pedido, estado, metodo_pago, monto_total, cliente_id) VALUES
('2024-06-01', 'Procesado', 'Tarjeta de Crédito', 100000.00, 1),
('2024-06-05', 'Enviado', 'Transferencia Bancaria', 60000.00, 2),
('2024-06-10', 'Entregado', 'Efectivo', 20000.00, 3),
('2024-06-15', 'Procesado', 'Tarjeta de Débito', 80000.00, 4),
('2024-06-20', 'Enviado', 'Tarjeta de Crédito', 70000.00, 5),
('2024-06-25', 'Entregado', 'Efectivo', 50000.00, 6),
('2024-06-30', 'Procesado', 'Transferencia Bancaria', 120000.00, 7),
('2024-07-05', 'Enviado', 'Tarjeta de Débito', 90000.00, 8),
('2024-07-10', 'Entregado', 'Efectivo', 60000.00, 9),
('2024-07-15', 'Procesado', 'Tarjeta de Crédito', 110000.00, 10);

-- Insertando datos en la tabla de detalles_pedido
INSERT INTO detalles_pedido (pedido_id, producto_id, cantidad, detalle_pedido_precio) VALUES
(1, 1, 1, 80000.00),
(2, 2, 1, 60000.00),
(3, 3, 1, 20000.00),
(4, 4, 2, 30000.00),
(5, 5, 3, 15000.00),
(6, 6, 4, 20000.00),
(7, 7, 5, 12000.00),
(8, 8, 6, 5000.00),
(9, 9, 7, 7000.00),
(10, 10, 8, 9000.00),
(1, 2, 2, 60000.00),
(2, 3, 3, 20000.00),
(3, 4, 4, 15000.00),
(4, 5, 5, 10000.00),
(5, 6, 6, 12000.00),
(6, 7, 7, 5000.00),
(7, 8, 8, 3000.00),
(8, 9, 9, 7000.00),
(9, 10, 10, 9000.00),
(10, 1, 1, 80000.00);



CREATE INDEX idx_pedidos_fecha_pedido ON pedidos(fecha_pedido);

CREATE INDEX idx_detalles_pedido_pedido_id ON detalles_pedido(pedido_id);

CREATE INDEX idx_detalles_pedido_producto_id ON detalles_pedido(producto_id);

CREATE INDEX idx_productos_categoria ON productos(categoria);

CREATE INDEX idx_clientes_apellido ON clientes(apellido);

CREATE INDEX idx_proveedores_nombre ON proveedores(proveedor_nombre);


-- Cantidad de pedidos mensuales
SELECT YEAR(fecha_pedido) AS Anio_Pedido, MONTH(fecha_pedido) AS Mes_Pedido, COUNT(*) AS Cantidad_Pedidos
FROM pedidos
GROUP BY YEAR(fecha_pedido), MONTH(fecha_pedido)
ORDER BY Anio_Pedido, Mes_Pedido;


-- Cantidad mensual pedida de cada articulo
SELECT YEAR(p.fecha_pedido) AS Anio,
       MONTH(p.fecha_pedido) AS Mes,
       pr.nombre_producto AS Articulo,
       SUM(dp.cantidad) AS Cantidad_Unidades
FROM pedidos p
INNER JOIN detalles_pedido dp ON p.pedido_id = dp.pedido_id
INNER JOIN productos pr ON dp.producto_id = pr.producto_id
GROUP BY YEAR(p.fecha_pedido), MONTH(p.fecha_pedido), pr.nombre_producto
ORDER BY Anio, Mes, Articulo;


-- Ranking de articulos
SELECT pr.nombre_producto AS Articulo,
       YEAR(p.fecha_pedido) AS Anio,
       MONTH(p.fecha_pedido) AS Mes,
       SUM(dp.cantidad) AS Cantidad_Pedida
FROM pedidos p
INNER JOIN detalles_pedido dp ON p.pedido_id = dp.pedido_id
INNER JOIN productos pr ON dp.producto_id = pr.producto_id
GROUP BY pr.nombre_producto, YEAR(p.fecha_pedido), MONTH(p.fecha_pedido)
ORDER BY Cantidad_Pedida DESC, Anio, Mes, Articulo;


-- Clientes con mas pedidos realizados
SELECT c.nombre, c.apellido AS Cliente,
       COUNT(p.pedido_id) AS Cantidad_Pedidos
FROM clientes c
INNER JOIN pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id
ORDER BY Cantidad_Pedidos DESC;


-- Ingreso mensual total por ventas
SELECT YEAR(p.fecha_pedido) AS Anio,
       MONTH(p.fecha_pedido) AS Mes,
       SUM(dp.cantidad * dp.detalle_pedido_precio) AS Ingreso_Total
FROM pedidos p
INNER JOIN detalles_pedido dp ON p.pedido_id = dp.pedido_id
GROUP BY YEAR(p.fecha_pedido), MONTH(p.fecha_pedido)
ORDER BY Anio, Mes;


-- Productos con stock bajo (menos de 10 unidades)
SELECT nombre_producto AS Producto,
       stock AS Stock_Disponible
FROM productos
WHERE stock < 10;


-- Pedidos pendientes de entrega
SELECT p.pedido_id AS Pedido,
       c.nombre AS Cliente,
       c.apellido AS Apellido,
       p.fecha_pedido AS Fecha_Pedido
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.cliente_id
WHERE p.estado = 'procesado';


-- Productos mas vendidos por categoria
SELECT pr.categoria AS Categoria,
       pr.nombre_producto AS Producto,
       SUM(dp.cantidad) AS Cantidad_Vendida
FROM detalles_pedido dp
INNER JOIN productos pr ON dp.producto_id = pr.producto_id
GROUP BY pr.categoria, pr.nombre_producto
ORDER BY Categoria, Cantidad_Vendida DESC;


-- Proveedores con mas productos suministrados
SELECT pr.proveedor_nombre AS Proveedor,
       COUNT(p.producto_id) AS Cantidad_Productos_Suministrados
FROM productos p
INNER JOIN proveedores pr ON p.proveedor_id = pr.proveedor_id
GROUP BY pr.proveedor_id
ORDER BY Cantidad_Productos_Suministrados DESC;


-- Historial de compras de un cliente especifico, ordenada desde la mas reciente a la mas antigua
SELECT p.pedido_id AS Pedido,
       p.fecha_pedido AS Fecha_Pedido,
       p.estado AS Estado_Pedido,
       p.monto_total AS Total_Pedido
FROM pedidos p
WHERE p.cliente_id = @cliente_id
ORDER BY p.fecha_pedido DESC;









