DROP DATABASE if EXISTS db_niki;
CREATE DATABASE db_niki;

USE db_niki;

CREATE TABLE tb_clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  clave_cliente VARCHAR (50) NOT NULL UNIQUE,
  nombre_cliente VARCHAR(50) NOT NULL,
  apellido_cliente VARCHAR(50) NOT NULL,
  correo_cliente VARCHAR(50) UNIQUE NOT NULL,
  telefono_cliente VARCHAR(50) NOT NULL,
  estado_cliente BOOLEAN NOT NULL
);

CREATE TABLE tb_productos (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre_producto VARCHAR(25) NOT NULL,
  id_categoria INT,
  precio_unitario DECIMAL(5,2) NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  id_marca INT,
  imagen VARCHAR(25),
  id_administrador INT
);

CREATE TABLE tb_pedidos (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  fecha_venta DATETIME DEFAULT NOW(),
  estado_pedido ENUM('Entregado','Cancelado'),
  direccion_pedido VARCHAR(255) NOT NULL
);

CREATE TABLE tb_categorias (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(25) NOT NULL,
  imagen VARCHAR(10) NOT NULL
);

CREATE TABLE tb_detalle_pedidos (
  id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT,
  precio_producto DECIMAL(5,2) NOT NULL,
  id_detalle_producto INT,
  cantidad_producto INT
);

CREATE TABLE tb_tipousuarios (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  tipo_usuario VARCHAR(25) NOT NULL,
  descripcion_usuario VARCHAR(100)
);

CREATE TABLE tb_marcas (
  id_marca INT AUTO_INCREMENT PRIMARY KEY,
  nombre_marca VARCHAR(25) NOT NULL,
  telefono_marca VARCHAR(10) NOT NULL,
  logo_marca VARCHAR(10)
);

CREATE TABLE tb_comentarios (
  id_comentario INT AUTO_INCREMENT PRIMARY KEY,
  comentario VARCHAR(255) NOT NULL,
  calificacion_producto INT NOT NULL,
  fecha_comentario DATETIME DEFAULT NOW(),
  estado_comentario BOOLEAN NOT NULL,
  id_detalle_pedidos INT
);

CREATE TABLE tb_administradores (
  id_administrador INT AUTO_INCREMENT PRIMARY KEY,
  nombre_administrador VARCHAR(50) NOT NULL,
  apellido_administrador VARCHAR(50) NOT NULL,
  clave_administrador VARCHAR(25) NOT NULL,
  correo_administrador VARCHAR(200) NOT NULL UNIQUE,
  id_tipo INT
);

CREATE TABLE tb_tallas (
  id_talla INT AUTO_INCREMENT PRIMARY KEY,
  talla VARCHAR(10) NOT NULL
);

CREATE TABLE tb_detalle_productos (
  id_detalle_producto INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  id_talla INT NOT NULL,
  stock_producto INT NOT NULL
);

ALTER TABLE tb_productos ADD FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id_categoria);

ALTER TABLE tb_pedidos ADD FOREIGN KEY (id_cliente) REFERENCES tb_clientes (id_cliente);

ALTER TABLE tb_productos ADD FOREIGN KEY (id_marca) REFERENCES tb_marcas (id_marca);

ALTER TABLE tb_detalle_pedidos ADD FOREIGN KEY (id_pedido) REFERENCES tb_pedidos (id_pedido);

ALTER TABLE tb_comentarios ADD FOREIGN KEY (id_detalle_pedidos) REFERENCES tb_detalle_pedidos (id_detalle_pedido);

ALTER TABLE tb_productos ADD FOREIGN KEY (id_administrador) REFERENCES tb_administradores (id_administrador);

ALTER TABLE tb_administradores ADD FOREIGN KEY (id_tipo) REFERENCES tb_tipousuarios (id_tipo);

ALTER TABLE tb_detalle_productos ADD FOREIGN KEY (id_producto) REFERENCES tb_productos (id_producto);

ALTER TABLE tb_detalle_productos ADD FOREIGN KEY (id_talla) REFERENCES tb_tallas (id_talla);

ALTER TABLE tb_detalle_pedidos ADD FOREIGN KEY (id_detalle_producto) REFERENCES tb_detalle_productos (id_detalle_producto);