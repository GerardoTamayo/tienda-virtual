-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_niki
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_administradores`
--

DROP TABLE IF EXISTS `tb_administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_administradores` (
  `id_administrador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_administrador` varchar(50) NOT NULL,
  `apellido_administrador` varchar(50) NOT NULL,
  `clave_administrador` varchar(25) NOT NULL,
  `correo_administrador` varchar(200) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_administrador`),
  UNIQUE KEY `correo_administrador` (`correo_administrador`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `tb_administradores_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tb_tipousuarios` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_administradores`
--

LOCK TABLES `tb_administradores` WRITE;
/*!40000 ALTER TABLE `tb_administradores` DISABLE KEYS */;
INSERT INTO `tb_administradores` VALUES (1,'Admin1','Apellido1','admin123','admin1@example.com',2),(2,'Admin2','Apellido2','admin456','admin2@example.com',2),(3,'Admin3','Apellido3','admin789','admin3@example.com',2),(4,'Admin4','Apellido4','admin101','admin4@example.com',2),(5,'Admin5','Apellido5','admin202','admin5@example.com',2),(6,'Admin6','Apellido6','admin303','admin6@example.com',2),(7,'Admin7','Apellido7','admin404','admin7@example.com',2),(8,'Admin8','Apellido8','admin505','admin8@example.com',2),(9,'Admin9','Apellido9','admin606','admin9@example.com',2),(10,'Admin10','Apellido10','admin707','admin10@example.com',2),(11,'Admin11','Apellido11','admin808','admin11@example.com',2),(12,'Admin12','Apellido12','admin909','admin12@example.com',2),(13,'Admin13','Apellido13','admin1010','admin13@example.com',2),(14,'Admin14','Apellido14','admin1111','admin14@example.com',2),(15,'Admin15','Apellido15','admin1212','admin15@example.com',2),(16,'Admin16','Apellido16','admin1313','admin16@example.com',2),(17,'Admin17','Apellido17','admin1414','admin17@example.com',2),(18,'Admin18','Apellido18','admin1515','admin18@example.com',2),(19,'Admin19','Apellido19','admin1616','admin19@example.com',2),(20,'Admin20','Apellido20','admin1717','admin20@example.com',2),(21,'Admin21','Apellido21','admin1818','admin21@example.com',2),(22,'Admin22','Apellido22','admin1919','admin22@example.com',2),(23,'Admin23','Apellido23','admin2020','admin23@example.com',2),(24,'Admin24','Apellido24','admin2121','admin24@example.com',2),(25,'Admin25','Apellido25','admin2222','admin25@example.com',2);
/*!40000 ALTER TABLE `tb_administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categorias`
--

DROP TABLE IF EXISTS `tb_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `imagen` varchar(10) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categorias`
--

LOCK TABLES `tb_categorias` WRITE;
/*!40000 ALTER TABLE `tb_categorias` DISABLE KEYS */;
INSERT INTO `tb_categorias` VALUES (1,'Fútbol',''),(2,'Baloncesto',''),(3,'Tenis',''),(4,'Natación',''),(5,'Atletismo',''),(6,'Ciclismo',''),(7,'Golf',''),(8,'Voleibol',''),(9,'Rugby',''),(10,'Boxeo',''),(11,'Surf',''),(12,'Escalada',''),(13,'Hockey',''),(14,'Skateboarding',''),(15,'Esquí',''),(16,'Snowboard',''),(17,'Triatlón',''),(18,'Patinaje',''),(19,'Aeróbic',''),(20,'Yoga',''),(21,'Pilates',''),(22,'Gimnasia',''),(23,'Artes marciales',''),(24,'Halterofilia',''),(25,'Bádminton','');
/*!40000 ALTER TABLE `tb_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `clave_cliente` varchar(50) NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `correo_cliente` varchar(50) NOT NULL,
  `telefono_cliente` varchar(50) NOT NULL,
  `estado_cliente` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `clave_cliente` (`clave_cliente`),
  UNIQUE KEY `correo_cliente` (`correo_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_clientes`
--

LOCK TABLES `tb_clientes` WRITE;
/*!40000 ALTER TABLE `tb_clientes` DISABLE KEYS */;
INSERT INTO `tb_clientes` VALUES (1,'CL123','Juan','Perez','juan@example.com','1234567890',1),(2,'CL456','Maria','Gonzalez','maria@example.com','9876543210',0),(3,'CL789','Pedro','Martinez','pedro@example.com','5551234567',1),(4,'CL987','Laura','Lopez','laura@example.com','9876541230',0),(5,'CL555','Carlos','Sanchez','carlos@example.com','5557890123',1),(6,'CL111','Ana','Garcia','ana@example.com','1237894560',1),(7,'CL222','Sofia','Rodriguez','sofia@example.com','4567890123',0),(8,'CL333','Luis','Hernandez','luis@example.com','5550123456',1),(9,'CL444','Elena','Diaz','elena@example.com','7890123456',0),(10,'CL666','Diego','Alvarez','diego@example.com','6666666666',1),(11,'CL777','Paula','Torres','paula@example.com','7777777777',0),(12,'CL888','Miguel','Ruiz','miguel@example.com','8888888888',1),(13,'CL999','Lucia','Fernandez','lucia@example.com','9999999999',0),(14,'CL1010','Javier','Gomez','javier@example.com','1010101010',1),(15,'CL1212','Eva','Moreno','eva@example.com','1212121212',0),(16,'CL1313','Alejandro','Vazquez','alejandro@example.com','1313131313',1),(17,'CL1414','Marina','Santos','marina@example.com','1414141414',0),(18,'CL1515','Isabel','Jimenez','isabel@example.com','1515151515',1),(19,'CL1616','Oscar','Martin','oscar@example.com','1616161616',0),(20,'CL1717','Sara','Jimenez','sara@example.com','1717171717',1),(21,'CL1818','Marcos','Gutierrez','marcos@example.com','1818181818',0),(22,'CL1919','Elena','Ramos','elena.ramos@example.com','1919191919',1),(23,'CL2020','Carmen','Perez','carmen@example.com','2020202020',0),(24,'CL2121','Roberto','Sanchez','roberto@example.com','2121212121',1),(25,'CL2222','Natalia','Lopez','natalia@example.com','2222222222',0),(26,'CL2323','Raul','Fernandez','raul@example.com','2323232323',1);
/*!40000 ALTER TABLE `tb_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comentarios`
--

DROP TABLE IF EXISTS `tb_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comentarios` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) NOT NULL,
  `calificacion_producto` int(11) NOT NULL,
  `fecha_comentario` datetime DEFAULT current_timestamp(),
  `estado_comentario` tinyint(1) NOT NULL,
  `id_detalle_pedidos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `id_detalle_pedidos` (`id_detalle_pedidos`),
  CONSTRAINT `tb_comentarios_ibfk_1` FOREIGN KEY (`id_detalle_pedidos`) REFERENCES `tb_detalle_pedidos` (`id_detalle_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comentarios`
--

LOCK TABLES `tb_comentarios` WRITE;
/*!40000 ALTER TABLE `tb_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalle_pedidos`
--

DROP TABLE IF EXISTS `tb_detalle_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_detalle_pedidos` (
  `id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) DEFAULT NULL,
  `precio_producto` decimal(5,2) NOT NULL,
  `id_detalle_producto` int(11) DEFAULT NULL,
  `cantidad_producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_detalle_producto` (`id_detalle_producto`),
  CONSTRAINT `tb_detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `tb_pedidos` (`id_pedido`),
  CONSTRAINT `tb_detalle_pedidos_ibfk_2` FOREIGN KEY (`id_detalle_producto`) REFERENCES `tb_detalle_productos` (`id_detalle_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalle_pedidos`
--

LOCK TABLES `tb_detalle_pedidos` WRITE;
/*!40000 ALTER TABLE `tb_detalle_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_detalle_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalle_productos`
--

DROP TABLE IF EXISTS `tb_detalle_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_detalle_productos` (
  `id_detalle_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_talla` int(11) NOT NULL,
  `stock_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_producto`),
  KEY `id_producto` (`id_producto`),
  KEY `id_talla` (`id_talla`),
  CONSTRAINT `tb_detalle_productos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tb_productos` (`id_producto`),
  CONSTRAINT `tb_detalle_productos_ibfk_2` FOREIGN KEY (`id_talla`) REFERENCES `tb_tallas` (`id_talla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalle_productos`
--

LOCK TABLES `tb_detalle_productos` WRITE;
/*!40000 ALTER TABLE `tb_detalle_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_detalle_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_marcas`
--

DROP TABLE IF EXISTS `tb_marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(25) NOT NULL,
  `telefono_marca` varchar(10) NOT NULL,
  `logo_marca` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_marcas`
--

LOCK TABLES `tb_marcas` WRITE;
/*!40000 ALTER TABLE `tb_marcas` DISABLE KEYS */;
INSERT INTO `tb_marcas` VALUES (1,'Nike','1234567890',NULL),(2,'Adidas','9876543210',NULL),(3,'Puma','5555555555',NULL),(4,'Under Armour','4444444444',NULL),(5,'Reebok','3333333333',NULL),(6,'New Balance','2222222222',NULL),(7,'Asics','1111111111',NULL),(8,'Fila','9999999999',NULL),(9,'Converse','8888888888',NULL),(10,'Vans','7777777777',NULL),(11,'Salomon','6666666666',NULL),(12,'Mizuno','3333333333',NULL),(13,'Saucony','2222222222',NULL),(14,'Brooks','1111111111',NULL),(15,'Lacoste','9999999999',NULL),(16,'Umbro','8888888888',NULL),(17,'Kappa','7777777777',NULL),(18,'Diadora','6666666666',NULL),(19,'Wilson','5555555555',NULL),(20,'Molten','4444444444',NULL),(21,'Mitre','3333333333',NULL),(22,'Uhlsport','2222222222',NULL),(23,'Hummel','1111111111',NULL),(24,'Joma','9999999999',NULL),(25,'Gucci','1452348822',NULL);
/*!40000 ALTER TABLE `tb_marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedidos`
--

DROP TABLE IF EXISTS `tb_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_venta` datetime DEFAULT current_timestamp(),
  `estado_pedido` enum('Entregado','Cancelado') DEFAULT NULL,
  `direccion_pedido` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `tb_pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedidos`
--

LOCK TABLES `tb_pedidos` WRITE;
/*!40000 ALTER TABLE `tb_pedidos` DISABLE KEYS */;
INSERT INTO `tb_pedidos` VALUES (1,1,'2024-03-06 16:26:02','Entregado','Calle Principal 123'),(2,2,'2024-03-06 16:26:02','Cancelado','Avenida Central 456'),(3,3,'2024-03-06 16:26:02','Entregado','Plaza Mayor 789'),(4,4,'2024-03-06 16:26:02','Entregado','Calle Secundaria 321'),(5,5,'2024-03-06 16:26:02','Cancelado','Avenida Principal 654'),(6,6,'2024-03-06 16:26:02','Entregado','Calle Central 987'),(7,7,'2024-03-06 16:26:02','Cancelado','Avenida Mayor 234'),(8,8,'2024-03-06 16:26:02','Entregado','Plaza Secundaria 567'),(9,9,'2024-03-06 16:26:02','Entregado','Avenida Secundaria 890'),(10,10,'2024-03-06 16:26:02','Cancelado','Calle Mayor 123'),(11,11,'2024-03-06 16:26:02','Entregado','Plaza Central 456'),(12,12,'2024-03-06 16:26:02','Entregado','Avenida Secundaria 789'),(13,13,'2024-03-06 16:26:02','Cancelado','Calle Principal 012'),(14,14,'2024-03-06 16:26:02','Entregado','Avenida Mayor 345'),(15,15,'2024-03-06 16:26:02','Entregado','Plaza Principal 678'),(16,16,'2024-03-06 16:26:02','Cancelado','Calle Central 901'),(17,17,'2024-03-06 16:26:02','Entregado','Avenida Secundaria 234'),(18,18,'2024-03-06 16:26:02','Entregado','Plaza Mayor 567'),(19,19,'2024-03-06 16:26:02','Cancelado','Calle Secundaria 890'),(20,20,'2024-03-06 16:26:02','Entregado','Avenida Principal 123'),(21,21,'2024-03-06 16:26:02','Entregado','Plaza Central 456'),(22,22,'2024-03-06 16:26:02','Cancelado','Calle Mayor 789'),(23,23,'2024-03-06 16:26:02','Entregado','Avenida Secundaria 012'),(24,24,'2024-03-06 16:26:02','Entregado','Plaza Principal 345'),(25,25,'2024-03-06 16:26:02','Cancelado','Calle Central 678');
/*!40000 ALTER TABLE `tb_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_productos`
--

DROP TABLE IF EXISTS `tb_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(25) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `precio_unitario` decimal(5,2) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `imagen` varchar(25) DEFAULT NULL,
  `id_administrador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_marca` (`id_marca`),
  KEY `id_administrador` (`id_administrador`),
  CONSTRAINT `tb_productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categorias` (`id_categoria`),
  CONSTRAINT `tb_productos_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `tb_marcas` (`id_marca`),
  CONSTRAINT `tb_productos_ibfk_3` FOREIGN KEY (`id_administrador`) REFERENCES `tb_administradores` (`id_administrador`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productos`
--

LOCK TABLES `tb_productos` WRITE;
/*!40000 ALTER TABLE `tb_productos` DISABLE KEYS */;
INSERT INTO `tb_productos` VALUES (1,'Camiseta deportiva',1,29.99,'Camiseta deportiva transpirable',1,NULL,1),(2,'Pantalón deportivo',2,39.99,'Pantalón deportivo ajustado',2,NULL,2),(3,'Chaqueta deportiva',3,49.99,'Chaqueta deportiva resistente al agua',3,NULL,3),(4,'Calcetines deportivos',4,9.99,'Calcetines deportivos de alto rendimiento',4,NULL,4),(5,'Sudadera con capucha',5,39.99,'Sudadera con capucha cómoda y ligera',5,NULL,5),(6,'Shorts deportivos',6,24.99,'Shorts deportivos transpirables',6,NULL,6),(7,'Top deportivo',7,19.99,'Top deportivo elástico y cómodo',7,NULL,7),(8,'Mallas deportivas',8,34.99,'Mallas deportivas de compresión',8,NULL,8),(9,'Zapatillas deportivas',9,59.99,'Zapatillas deportivas ligeras y amortiguadas',9,NULL,9),(10,'Mochila deportiva',10,49.99,'Mochila deportiva con compartimentos',10,NULL,10),(11,'Guantes de entrenamiento',11,14.99,'Guantes de entrenamiento antideslizantes',11,NULL,11),(12,'Pantalón corto running',12,19.99,'Pantalón corto de running transpirable',12,NULL,12),(13,'Cinturón deportivo',13,9.99,'Cinturón deportivo ajustable',13,NULL,13),(14,'Gorra deportiva',14,14.99,'Gorra deportiva ajustable',14,NULL,14),(15,'Saco de boxeo',15,69.99,'Saco de boxeo resistente de 25 kg',15,NULL,15),(16,'Pesa rusa',16,29.99,'Pesa rusa de 10 kg',16,NULL,16),(17,'Cuerda de saltar',17,9.99,'Cuerda de saltar ajustable',17,NULL,17),(18,'Bandas elásticas',18,14.99,'Bandas elásticas de resistencia',18,NULL,18),(19,'Balón medicinal',19,24.99,'Balón medicinal de 5 kg',19,NULL,19),(20,'Step aeróbico',20,34.99,'Step aeróbico ajustable',20,NULL,20),(21,'Colchoneta de yoga',21,19.99,'Colchoneta de yoga antideslizante',21,NULL,21),(22,'Cinta de correr',22,699.99,'Cinta de correr plegable con pantalla LCD',22,NULL,22),(23,'Bicicleta estática',23,299.99,'Bicicleta estática con asiento ajustable',23,NULL,23),(24,'Máquina de remo',24,499.99,'Máquina de remo con resistencia ajustable',24,NULL,24),(25,'Pesas hexagonales',25,49.99,'Pesas hexagonales de 5 kg',25,NULL,25);
/*!40000 ALTER TABLE `tb_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tallas`
--

DROP TABLE IF EXISTS `tb_tallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tallas` (
  `id_talla` int(11) NOT NULL AUTO_INCREMENT,
  `talla` varchar(10) NOT NULL,
  PRIMARY KEY (`id_talla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tallas`
--

LOCK TABLES `tb_tallas` WRITE;
/*!40000 ALTER TABLE `tb_tallas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipousuarios`
--

DROP TABLE IF EXISTS `tb_tipousuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipousuarios` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(25) NOT NULL,
  `descripcion_usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipousuarios`
--

LOCK TABLES `tb_tipousuarios` WRITE;
/*!40000 ALTER TABLE `tb_tipousuarios` DISABLE KEYS */;
INSERT INTO `tb_tipousuarios` VALUES (1,'Cliente','Usuario regular del sistema'),(2,'Administrador','Usuario con permisos administrativos'),(3,'Invitado','Usuario temporal sin acceso completo'),(4,'Premium','Usuario con privilegios adicionales'),(5,'Vendedor','Usuario autorizado para realizar ventas'),(6,'Supervisor','Usuario con capacidad de supervisión'),(7,'Analista','Usuario encargado de análisis de datos'),(8,'Soporte','Usuario dedicado al soporte técnico'),(9,'Gerente','Usuario con autoridad sobre departamentos'),(10,'Desarrollador','Usuario encargado del desarrollo de software'),(11,'Tester','Usuario responsable de pruebas de calidad'),(12,'Consultor','Usuario experto en consultoría'),(13,'Marketing','Usuario especializado en estrategias de marketing'),(14,'Finanzas','Usuario dedicado a actividades financieras'),(15,'Legal','Usuario encargado de asuntos legales'),(16,'Recursos Humanos','Usuario responsable de recursos humanos'),(17,'Logística','Usuario encargado de la gestión logística'),(18,'Compras','Usuario encargado de compras'),(19,'Inventario','Usuario responsable del control de inventario'),(20,'Gestor de Proyectos','Usuario encargado de la gestión de proyectos'),(21,'Entrenador','Usuario que proporciona capacitación'),(22,'Seguridad','Usuario encargado de la seguridad de la información'),(23,'Diseñador','Usuario especializado en diseño gráfico'),(24,'Investigador','Usuario dedicado a la investigación');
/*!40000 ALTER TABLE `tb_tipousuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-06 16:30:23
