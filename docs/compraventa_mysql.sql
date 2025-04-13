
DROP TABLE IF EXISTS `td_compra_detalle`;

CREATE TABLE `td_compra_detalle` (
  `DETC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPR_ID` int(11) DEFAULT NULL,
  `PROD_ID` int(11) DEFAULT NULL,
  `PROD_PCOMPRA` decimal(18,2) DEFAULT NULL,
  `DETC_CANT` int(11) DEFAULT NULL,
  `DETC_TOTAL` decimal(18,2) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`DETC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `td_compra_detalle` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `td_menu`;

CREATE TABLE `td_menu` (
  `MEND_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MEN_ID` int(11) DEFAULT NULL,
  `ROL_ID` int(11) DEFAULT NULL,
  `MEND_PERMI` varchar(2) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`MEND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
LOCK TABLES `td_menu` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `td_venta_detalle`;
CREATE TABLE `td_venta_detalle` (
  `DETV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `VENT_ID` int(11) DEFAULT NULL,
  `PROD_ID` int(11) DEFAULT NULL,
  `PROD_PVENTA` decimal(18,2) DEFAULT NULL,
  `DETV_CANT` int(11) DEFAULT NULL,
  `DETV_TOTAL` decimal(18,2) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`DETV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `td_venta_detalle` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_categoria`;
CREATE TABLE `tm_categoria` (
  `CAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUC_ID` int(11) DEFAULT NULL,
  `CAT_NOM` varchar(150) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_categoria` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_cliente`;
CREATE TABLE `tm_cliente` (
  `CLI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_ID` int(11) DEFAULT NULL,
  `CLI_NOM` varchar(150) DEFAULT NULL,
  `CLI_RUC` varchar(50) DEFAULT NULL,
  `CLI_TELF` varchar(50) DEFAULT NULL,
  `CLI_DIRECC` varchar(150) DEFAULT NULL,
  `CLI_CORREO` varchar(150) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`CLI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_cliente` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_compania`;
CREATE TABLE `tm_compania` (
  `COM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COM_NOM` varchar(150) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_compania` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_compra`;

CREATE TABLE `tm_compra` (
  `COMPR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUC_ID` int(11) DEFAULT NULL,
  `PAG_ID` int(11) DEFAULT NULL,
  `PROV_ID` int(11) DEFAULT NULL,
  `PROV_RUC` varchar(150) DEFAULT NULL,
  `PROV_DIRECC` varchar(150) DEFAULT NULL,
  `PROV_CORREO` varchar(150) DEFAULT NULL,
  `COMPR_SUBTOTAL` decimal(18,2) DEFAULT 0.00,
  `COMPR_IGV` decimal(18,2) DEFAULT 0.00,
  `COMPR_TOTAL` decimal(18,2) DEFAULT 0.00,
  `COMPR_COMENT` varchar(250) DEFAULT NULL,
  `USU_ID` int(11) DEFAULT NULL,
  `MON_ID` int(11) DEFAULT NULL,
  `DOC_ID` int(11) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`COMPR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_compra` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_documento`;

CREATE TABLE `tm_documento` (
  `DOC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOC_NOM` varchar(50) DEFAULT NULL,
  `DOC_TIPO` varchar(150) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`DOC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_documento` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_empresa`;
CREATE TABLE `tm_empresa` (
  `EMP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COM_ID` int(11) DEFAULT NULL,
  `EMP_NOM` varchar(150) DEFAULT NULL,
  `EMP_RUC` varchar(50) DEFAULT NULL,
  `EMP_CORREO` varchar(150) DEFAULT NULL,
  `EMP_TELF` varchar(50) DEFAULT NULL,
  `EMP_DIRECC` varchar(150) DEFAULT NULL,
  `EMP_PAG` varchar(150) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMP_ID`),
  KEY `FK_TM_EMPRESA_TM_COMPANIA` (`COM_ID`),
  CONSTRAINT `FK_TM_EMPRESA_TM_COMPANIA` FOREIGN KEY (`COM_ID`) REFERENCES `tm_compania` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_empresa` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_menu`;
CREATE TABLE `tm_menu` (
  `MEN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MEN_NOM` varchar(150) DEFAULT NULL,
  `MEN_RUTA` varchar(250) DEFAULT NULL,
  `MEN_IDENTI` varchar(150) DEFAULT NULL,
  `MEN_GRUPO` varchar(150) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`MEN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_menu` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_moneda`;
CREATE TABLE `tm_moneda` (
  `MON_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUC_ID` int(11) DEFAULT NULL,
  `MON_NOM` varchar(50) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`MON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_moneda` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_pago`;
CREATE TABLE `tm_pago` (
  `PAG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAG_NOM` varchar(150) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`PAG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_pago` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tm_producto`;
CREATE TABLE `tm_producto` (
  `PROD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUC_ID` int(11) DEFAULT NULL,
  `CAT_ID` int(11) DEFAULT NULL,
  `FAM_ID` int(11) DEFAULT NULL,
  `PROD_NOM` varchar(150) DEFAULT NULL,
  `PROD_DESCRIP` longtext DEFAULT NULL,
  `UND_ID` int(11) DEFAULT NULL,
  `MON_ID` int(11) DEFAULT NULL,
  `PROD_PCOMPRA` decimal(18,2) DEFAULT NULL,
  `PROD_PVENTA` decimal(18,2) DEFAULT NULL,
  `PROD_STOCK` int(11) DEFAULT NULL,
  `PROD_FECHAVEN` date DEFAULT NULL,
  `PROD_IMG` longtext DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_producto` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_familia`;
CREATE TABLE tm_familia (
   `FAM_ID` INT AUTO_INCREMENT PRIMARY KEY,
    `CAT_ID` INT, -- Relación con categoría
   `FAM_NOM` VARCHAR(100),
    PRIMARY KEY (`FAM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_familia` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tm_proveedor`;
CREATE TABLE `tm_proveedor` (
  `PROV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_ID` int(11) DEFAULT NULL,
  `PROV_NOM` varchar(150) DEFAULT NULL,
  `PROV_RUC` varchar(15) DEFAULT NULL,
  `PROV_TELF` varchar(50) DEFAULT NULL,
  `PROV_DIRECC` varchar(150) DEFAULT NULL,
  `PROV_CORREO` varchar(150) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_proveedor` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_rol`;
CREATE TABLE `tm_rol` (
  `ROL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUC_ID` int(11) DEFAULT NULL,
  `ROL_NOM` varchar(150) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`ROL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_rol` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_sucursal`;
CREATE TABLE `tm_sucursal` (
  `SUC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_ID` int(11) DEFAULT NULL,
  `SUC_NOM` varchar(50) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`SUC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_sucursal` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_unidad`;
CREATE TABLE `tm_unidad` (
  `UND_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUC_ID` int(11) DEFAULT NULL,
  `UND_NOM` varchar(150) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`UND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tm_unidad` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tm_usuario`;
CREATE TABLE `tm_usuario` (
  `USU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUC_ID` int(11) DEFAULT NULL,
  `USU_CORREO` varchar(150) DEFAULT NULL,
  `USU_NOM` varchar(150) DEFAULT NULL,
  `USU_APE` varchar(150) NOT NULL,
  `USU_DNI` varchar(50) DEFAULT NULL,
  `USU_TELF` varchar(50) DEFAULT NULL,
  `USU_PASS` varchar(50) DEFAULT NULL,
  `ROL_ID` int(11) DEFAULT NULL,
  `USU_IMG` longtext DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`USU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_usuario`
--

LOCK TABLES `tm_usuario` WRITE;
/*!40000 ALTER TABLE `tm_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_venta`
--

DROP TABLE IF EXISTS `tm_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_venta` (
  `VENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUC_ID` int(11) DEFAULT NULL,
  `PAG_ID` int(11) DEFAULT NULL,
  `CLI_ID` int(11) DEFAULT NULL,
  `CLI_RUC` varchar(20) DEFAULT NULL,
  `CLI_DIRECC` varchar(250) DEFAULT NULL,
  `CLI_CORREO` varchar(150) DEFAULT NULL,
  `VENT_SUBTOTAL` decimal(18,2) DEFAULT NULL,
  `VENT_IGV` decimal(18,2) DEFAULT NULL,
  `VENT_TOTAL` decimal(18,2) DEFAULT NULL,
  `VENT_COMENT` varchar(250) DEFAULT NULL,
  `USU_ID` int(11) DEFAULT NULL,
  `MON_ID` int(11) DEFAULT NULL,
  `DOC_ID` int(11) DEFAULT NULL,
  `FECH_CREA` datetime(3) DEFAULT NULL,
  `EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`VENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_venta`
--

LOCK TABLES `tm_venta` WRITE;
/*!40000 ALTER TABLE `tm_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'compraventa'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_CATEGORIA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_CATEGORIA_01`(
p_CAT_ID INT)
BEGIN
	UPDATE TM_CATEGORIA
	SET
		EST= 0
	WHERE
		CAT_ID = p_CAT_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_CLIENTE_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_CLIENTE_01`(
p_CLI_ID INT)
BEGIN
	UPDATE TM_CLIENTE
	SET
		EST= 0
	WHERE
		CLI_ID = p_CLI_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_COMPANIA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_COMPANIA_01`(
p_COM_ID INT)
BEGIN
	UPDATE TM_COMPANIA
	SET
		EST= 0
	WHERE
		COM_ID = p_COM_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_COMPRA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_COMPRA_01`(
p_DETC_ID INT)
BEGIN
	UPDATE TD_COMPRA_DETALLE
	SET
		EST=0
	WHERE
		DETC_ID = p_DETC_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_EMPRESA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_EMPRESA_01`(
p_EMP_ID INT)
BEGIN
	UPDATE TM_EMPRESA
	SET
		EST= 0
	WHERE
		EMP_ID = p_EMP_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_MONEDA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_MONEDA_01`(
p_MON_ID INT)
BEGIN
	UPDATE TM_MONEDA
	SET
		EST= 0
	WHERE
		MON_ID = p_MON_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_PRODUCTO_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_PRODUCTO_01`(
p_PROD_ID INT)
BEGIN
	UPDATE TM_PRODUCTO
	SET
		EST= 0
	WHERE
		PROD_ID = p_PROD_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_PROVEEDOR_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_PROVEEDOR_01`(
p_PROV_ID INT)
BEGIN
	UPDATE TM_PROVEEDOR
	SET
		EST= 0
	WHERE
		PROV_ID = p_PROV_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_ROL_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_ROL_01`(
p_ROL_ID INT)
BEGIN
	UPDATE TM_ROL
	SET
		EST= 0
	WHERE
		ROL_ID = p_ROL_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_SUCURSAL_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_SUCURSAL_01`(
p_SUC_ID INT)
BEGIN
	UPDATE TM_SUCURSAL
	SET
		EST= 0
	WHERE
		SUC_ID = p_SUC_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_UNIDAD_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_UNIDAD_01`(
p_UND_ID INT)
BEGIN
	UPDATE TM_UNIDAD
	SET
		EST= 0
	WHERE
		UND_ID = p_UND_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_USUARIO_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_USUARIO_01`(
p_USU_ID INT)
BEGIN
	UPDATE TM_USUARIO
	SET
		EST= 0
	WHERE
		USU_ID = p_USU_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_VENTA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_VENTA_01`(
p_DETV_ID INT)
BEGIN
	UPDATE TD_VENTA_DETALLE
	SET
		EST=0
	WHERE
		DETV_ID = p_DETV_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_CATEGORIA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_CATEGORIA_01`(
p_SUC_ID INT,
p_CAT_NOM VARCHAR(150))
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT INTO TM_CATEGORIA
	(SUC_ID,CAT_NOM,FECH_CREA,EST)
	VALUES
	(p_SUC_ID,p_CAT_NOM,NOW(3),1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_CLIENTE_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_CLIENTE_01`(  
p_EMP_ID INT,  
p_CLI_NOM VARCHAR(150),  
p_CLI_RUC VARCHAR(15),  
p_CLI_TELF VARCHAR(150),  
p_CLI_DIRECC VARCHAR(150),  
p_CLI_CORREO VARCHAR(100))
BEGIN  
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 INSERT INTO TM_CLIENTE  
 (CLI_NOM,EMP_ID,CLI_RUC,CLI_TELF,CLI_DIRECC,CLI_CORREO,FECH_CREA,EST)  
 VALUES  
 (p_CLI_NOM,p_EMP_ID,p_CLI_RUC,p_CLI_TELF,p_CLI_DIRECC,p_CLI_CORREO,NOW(3),1);  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_COMPANIA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_COMPANIA_01`(
p_COM_NOM VARCHAR(150))
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT INTO TM_COMPANIA
	(COM_NOM,FECH_CREA,EST)
	VALUES
	(p_COM_NOM,NOW(3),1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_COMPRA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_COMPRA_01`(
p_SUC_ID INT,
p_USU_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT INTO TM_COMPRA 
	(SUC_ID,USU_ID,EST)
	VALUES
	(p_SUC_ID,p_USU_ID,2);

	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT COMPR_ID FROM TM_COMPRA WHERE COMPR_ID=LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_COMPRA_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_COMPRA_02`(
p_COMPR_ID INT,
p_PROD_ID INT,
p_PROD_PCOMPRA NUMERIC(18,2),
p_DETC_CANT INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT TD_COMPRA_DETALLE
	(COMPR_ID,PROD_ID,PROD_PCOMPRA,DETC_CANT,DETC_TOTAL,FECH_CREA,EST)
	VALUES
	(p_COMPR_ID,p_PROD_ID,p_PROD_PCOMPRA,p_DETC_CANT,p_PROD_PCOMPRA * p_DETC_CANT,NOW(3),1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_EMPRESA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_EMPRESA_01`(
p_COM_ID INT,
p_EMP_NOM VARCHAR(150),
p_EMP_RUC VARCHAR(150))
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT INTO TM_EMPRESA
	(COM_ID,EMP_NOM,EMP_RUC,FECH_CREA,EST)
	VALUES
	(p_COM_ID,p_EMP_NOM,p_EMP_RUC,NOW(3),1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_MENU_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_MENU_02`(
p_ROL_ID INT)
BEGIN
	IF (SELECT COUNT(*) FROM TD_MENU WHERE ROL_ID=p_ROL_ID)=0
	THEN
		-- SQLINES LICENSE FOR EVALUATION USE ONLY
		INSERT INTO TD_MENU
		(MEN_ID,ROL_ID,MEND_PERMI,FECH_CREA,EST)
		(SELECT MEN_ID,p_ROL_ID,'No',NOW(3),1 FROM TM_MENU WHERE EST=1);
	ELSE
		-- SQLINES LICENSE FOR EVALUATION USE ONLY
		INSERT INTO TD_MENU
		(MEN_ID,ROL_ID,MEND_PERMI,FECH_CREA,EST)
		(SELECT MEN_ID,p_ROL_ID,'No',NOW(3),1 FROM TM_MENU WHERE EST=1 AND MEN_ID NOT IN (SELECT MEN_ID FROM TD_MENU WHERE ROL_ID=p_ROL_ID));
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_MONEDA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_MONEDA_01`(
p_SUC_ID INT,
p_MON_NOM VARCHAR(150))
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT INTO TM_MONEDA
	(SUC_ID,MON_NOM,FECH_CREA,EST)
	VALUES
	(p_SUC_ID,p_MON_NOM,NOW(3),1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_PRODUCTO_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_PRODUCTO_01`(
p_SUC_ID INT,
p_CAT_ID INT,
p_PROD_NOM VARCHAR(150),
p_PROD_DESCRIP VARCHAR(150),
p_UND_ID INT,
p_MON_ID INT,
p_PROD_PCOMPRA NUMERIC(18,2),
p_PROD_PVENTA NUMERIC(18,2),
p_PROD_STOCK INT,
p_PROD_FECHAVEN DATE,
p_PROD_IMG LONGTEXT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT INTO TM_PRODUCTO
	(SUC_ID,CAT_ID,PROD_NOM,PROD_DESCRIP,UND_ID,MON_ID,PROD_PCOMPRA,PROD_PVENTA,PROD_STOCK,PROD_FECHAVEN,PROD_IMG,FECH_CREA,EST)
	VALUES
	(p_SUC_ID,p_CAT_ID,p_PROD_NOM,p_PROD_DESCRIP,p_UND_ID,p_MON_ID,p_PROD_PCOMPRA,p_PROD_PVENTA,p_PROD_STOCK,p_PROD_FECHAVEN,p_PROD_IMG,NOW(3),1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_PROVEEDOR_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_PROVEEDOR_01`(    
p_EMP_ID INT,    
p_PROV_NOM VARCHAR(150),    
p_PROV_RUC VARCHAR(15),    
p_PROV_TELF VARCHAR(150),    
p_PROV_DIRECC VARCHAR(150),    
p_PROV_CORREO VARCHAR(150))
BEGIN    
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 INSERT INTO TM_PROVEEDOR    
 (EMP_ID,PROV_NOM,PROV_RUC,PROV_TELF,PROV_DIRECC,PROV_CORREO,FECH_CREA,EST)    
 VALUES    
 (p_EMP_ID,p_PROV_NOM,p_PROV_RUC,p_PROV_TELF,p_PROV_DIRECC,p_PROV_CORREO,NOW(3),1);    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_ROL_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_ROL_01`(
p_SUC_ID INT,
p_ROL_NOM VARCHAR(150))
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT INTO TM_ROL
	(SUC_ID,ROL_NOM,FECH_CREA,EST)
	VALUES
	(p_SUC_ID,p_ROL_NOM,NOW(3),1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_SUCURSAL_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_SUCURSAL_01`(
p_EMP_ID INT,
p_SUC_NOM VARCHAR(150))
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT INTO TM_SUCURSAL
	(EMP_ID,SUC_NOM,FECH_CREA,EST)
	VALUES
	(p_EMP_ID,p_SUC_NOM,NOW(3),1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_UNIDAD_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_UNIDAD_01`(
p_SUC_ID INT,
p_UND_NOM VARCHAR(150))
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT INTO TM_UNIDAD
	(SUC_ID,UND_NOM,FECH_CREA,EST)
	VALUES
	(p_SUC_ID,p_UND_NOM,NOW(3),1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_USUARIO_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_USUARIO_01`(  
p_SUC_ID INT,  
p_USU_CORREO VARCHAR(150),  
p_USU_NOM VARCHAR(150),  
p_USU_APE VARCHAR(150),  
p_USU_DNI VARCHAR(150),  
p_USU_TELF VARCHAR(150),  
p_USU_PASS VARCHAR(150),  
p_ROL_ID INT,
p_USU_IMG LONGTEXT)
BEGIN  
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 INSERT INTO TM_USUARIO  
 (SUC_ID,USU_CORREO,USU_NOM,USU_APE,USU_DNI,USU_TELF,USU_PASS,ROL_ID,USU_IMG,FECH_CREA,EST)  
 VALUES  
 (p_SUC_ID,p_USU_CORREO,p_USU_NOM,p_USU_APE,p_USU_DNI,p_USU_TELF,p_USU_PASS,p_ROL_ID,p_USU_IMG,NOW(3),1);  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_VENTA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_VENTA_01`(
p_SUC_ID INT,
p_USU_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT INTO TM_VENTA 
	(SUC_ID,USU_ID,EST)
	VALUES
	(p_SUC_ID,p_USU_ID,2);

	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT VENT_ID FROM TM_VENTA WHERE VENT_ID=LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_VENTA_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_VENTA_02`(
p_VENT_ID INT,
p_PROD_ID INT,
p_PROD_PVENTA NUMERIC(18,2),
p_DETV_CANT INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	INSERT TD_VENTA_DETALLE
	(VENT_ID,PROD_ID,PROD_PVENTA,DETV_CANT,DETV_TOTAL,FECH_CREA,EST)
	VALUES
	(p_VENT_ID,p_PROD_ID,p_PROD_PVENTA,p_DETV_CANT,p_PROD_PVENTA * p_DETV_CANT,NOW(3),1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_CATEGORIA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_CATEGORIA_01`(  
p_SUC_ID INT)
BEGIN  
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 SELECT 
	 CAT_ID,
	 SUC_ID,
	 CAT_NOM,
	 DATE_FORMAT(FECH_CREA,'%d/%m/%Y') AS FECH_CREA,
	 EST 
 FROM 
	TM_CATEGORIA  
 WHERE  
	 SUC_ID = p_SUC_ID  
	 AND EST=1;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_CATEGORIA_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_CATEGORIA_02`(
p_CAT_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_CATEGORIA
	WHERE
	CAT_ID = p_CAT_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_CATEGORIA_03` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_CATEGORIA_03`(
p_SUC_ID INT)
BEGIN

	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT        
		TM_CATEGORIA.CAT_ID, 
		TM_CATEGORIA.CAT_NOM, 
		SUM(TM_PRODUCTO.PROD_STOCK) AS STOCK
	FROM            
		TM_CATEGORIA INNER JOIN
		TM_PRODUCTO ON TM_CATEGORIA.CAT_ID = TM_PRODUCTO.CAT_ID
	WHERE        
		TM_CATEGORIA.SUC_ID = 1
		AND TM_PRODUCTO.EST=1
		AND TM_CATEGORIA.EST=1
	GROUP BY
		TM_CATEGORIA.CAT_ID, 
		TM_CATEGORIA.CAT_NOM
	ORDER BY
		STOCK DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_CLIENTE_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_CLIENTE_01`(
p_EMP_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_CLIENTE
	WHERE
	EMP_ID = p_EMP_ID
	AND EST=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_CLIENTE_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_CLIENTE_02`(
p_CLI_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_CLIENTE
	WHERE
	CLI_ID = p_CLI_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_COMPANIA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_COMPANIA_01`()
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_COMPANIA
	WHERE
	EST=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_COMPANIA_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_COMPANIA_02`(
p_COM_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_COMPANIA
	WHERE
	COM_ID = p_COM_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_COMPRAS_04` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_COMPRAS_04`(  
p_SUC_ID INT)
BEGIN  
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 SELECT          
 TD_COMPRA_DETALLE.PROD_ID,   
 SUM(TD_COMPRA_DETALLE.DETC_CANT) AS CANT,   
 TM_PRODUCTO.PROD_NOM,   
 TM_PRODUCTO.PROD_PCOMPRA,   
 TM_CATEGORIA.CAT_NOM,   
 TM_UNIDAD.UND_NOM,   
 TM_PRODUCTO.PROD_STOCK,   
 TM_PRODUCTO.PROD_IMG,  
 TM_MONEDA.MON_NOM,  
 SUM(TM_COMPRA.COMPR_TOTAL) AS TOTAL  
 FROM              
 TD_COMPRA_DETALLE INNER JOIN  
 TM_PRODUCTO ON TD_COMPRA_DETALLE.PROD_ID = TM_PRODUCTO.PROD_ID INNER JOIN  
 TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID INNER JOIN  
 TM_UNIDAD ON TM_PRODUCTO.UND_ID = TM_UNIDAD.UND_ID INNER JOIN  
 TM_COMPRA ON TD_COMPRA_DETALLE.COMPR_ID = TM_COMPRA.COMPR_ID INNER JOIN  
 TM_MONEDA ON TM_COMPRA.MON_ID = TM_MONEDA.MON_ID  
 WHERE  
 TM_COMPRA.EST = 1  
 AND TM_PRODUCTO.EST=1  
 AND TM_COMPRA.SUC_ID = p_SUC_ID  
 GROUP BY   
 TD_COMPRA_DETALLE.PROD_ID,   
 TM_PRODUCTO.PROD_NOM,   
 TM_PRODUCTO.PROD_PCOMPRA,   
 TM_CATEGORIA.CAT_NOM,   
 TM_UNIDAD.UND_NOM,   
 TM_PRODUCTO.PROD_STOCK,   
 TM_PRODUCTO.PROD_IMG,  
 TM_MONEDA.MON_NOM  
 ORDER BY CANT DESC
 LIMIT 5;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_COMPRAVENTA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_COMPRAVENTA_01`(
p_SUC_ID INT)
BEGIN
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT * FROM 
	(
		SELECT              
		TM_COMPRA.COMPR_ID,       
		TM_COMPRA.SUC_ID,       
		TM_COMPRA.PAG_ID,       
		TM_COMPRA.PROV_ID,       
		TM_COMPRA.PROV_RUC,       
		TM_COMPRA.PROV_DIRECC,       
		TM_COMPRA.PROV_CORREO,       
		TM_COMPRA.COMPR_SUBTOTAL,       
		TM_COMPRA.COMPR_IGV,       
		TM_COMPRA.COMPR_TOTAL,       
		TM_COMPRA.COMPR_COMENT,       
		TM_COMPRA.USU_ID,       
		TM_COMPRA.MON_ID,       
		DATE_FORMAT (TM_COMPRA.FECH_CREA,'%d/%m/%Y') AS FECH_CREA,       
		TM_COMPRA.EST,       
		TM_SUCURSAL.SUC_NOM,       
		TM_EMPRESA.EMP_NOM,       
		TM_EMPRESA.EMP_RUC,       
		TM_EMPRESA.EMP_CORREO,       
		TM_EMPRESA.EMP_TELF,       
		TM_EMPRESA.EMP_DIRECC,       
		TM_EMPRESA.EMP_PAG,       
		TM_COMPANIA.COM_NOM,       
		TM_USUARIO.USU_CORREO,       
		TM_USUARIO.USU_NOM,       
		TM_USUARIO.USU_APE,       
		TM_USUARIO.USU_DNI,       
		TM_USUARIO.USU_TELF,     
		TM_USUARIO.USU_IMG,    
		TM_ROL.ROL_NOM,       
		TM_PAGO.PAG_NOM,       
		TM_MONEDA.MON_NOM,      
		TM_PROVEEDOR.PROV_NOM,  
		TM_DOCUMENTO.DOC_NOM,
		'Compra' as REGISTRO
		FROM                  
		TM_COMPRA INNER JOIN      
		TM_SUCURSAL ON TM_COMPRA.SUC_ID = TM_SUCURSAL.SUC_ID INNER JOIN      
		TM_EMPRESA ON TM_SUCURSAL.EMP_ID = TM_EMPRESA.EMP_ID INNER JOIN      
		TM_COMPANIA ON TM_EMPRESA.COM_ID = TM_COMPANIA.COM_ID INNER JOIN      
		TM_USUARIO ON TM_COMPRA.USU_ID = TM_USUARIO.USU_ID INNER JOIN      
		TM_ROL ON TM_USUARIO.ROL_ID = TM_ROL.ROL_ID INNER JOIN      
		TM_PAGO ON TM_COMPRA.PAG_ID = TM_PAGO.PAG_ID INNER JOIN      
		TM_MONEDA ON TM_COMPRA.MON_ID = TM_MONEDA.MON_ID INNER JOIN      
		TM_PROVEEDOR ON TM_COMPRA.PROV_ID = TM_PROVEEDOR.PROV_ID INNER JOIN  
		TM_DOCUMENTO ON TM_COMPRA.DOC_ID = TM_DOCUMENTO.DOC_ID  
		WHERE      
		TM_COMPRA.EST=1      
		AND TM_COMPRA.SUC_ID = p_SUC_ID

		UNION ALL
      
		SELECT                
		TM_VENTA.VENT_ID,         
		TM_VENTA.SUC_ID,         
		TM_VENTA.PAG_ID,         
		TM_VENTA.CLI_ID,         
		TM_VENTA.CLI_RUC,         
		TM_VENTA.CLI_DIRECC,         
		TM_VENTA.CLI_CORREO,         
		TM_VENTA.VENT_SUBTOTAL,         
		TM_VENTA.VENT_IGV,         
		TM_VENTA.VENT_TOTAL,         
		TM_VENTA.VENT_COMENT,         
		TM_VENTA.USU_ID,         
		TM_VENTA.MON_ID,         
		DATE_FORMAT(TM_VENTA.FECH_CREA,'%d/%m/%Y') AS FECH_CREA,        
		TM_VENTA.EST,         
		TM_SUCURSAL.SUC_NOM,         
		TM_EMPRESA.EMP_NOM,         
		TM_EMPRESA.EMP_RUC,         
		TM_EMPRESA.EMP_CORREO,         
		TM_EMPRESA.EMP_TELF,         
		TM_EMPRESA.EMP_DIRECC,         
		TM_EMPRESA.EMP_PAG,         
		TM_COMPANIA.COM_NOM,         
		TM_USUARIO.USU_CORREO,         
		TM_USUARIO.USU_NOM,         
		TM_USUARIO.USU_APE,         
		TM_USUARIO.USU_DNI,         
		TM_USUARIO.USU_TELF,         
		TM_USUARIO.USU_IMG,     
		TM_ROL.ROL_NOM,         
		TM_PAGO.PAG_NOM,         
		TM_MONEDA.MON_NOM,        
		TM_CLIENTE.CLI_NOM,  
		TM_DOCUMENTO.DOC_NOM,
		'Venta' AS REGISTRO
		FROM                    
		TM_VENTA INNER JOIN        
		TM_SUCURSAL ON TM_VENTA.SUC_ID = TM_SUCURSAL.SUC_ID INNER JOIN        
		TM_EMPRESA ON TM_SUCURSAL.EMP_ID = TM_EMPRESA.EMP_ID INNER JOIN        
		TM_COMPANIA ON TM_EMPRESA.COM_ID = TM_COMPANIA.COM_ID INNER JOIN        
		TM_USUARIO ON TM_VENTA.USU_ID = TM_USUARIO.USU_ID INNER JOIN        
		TM_ROL ON TM_USUARIO.ROL_ID = TM_ROL.ROL_ID INNER JOIN        
		TM_PAGO ON TM_VENTA.PAG_ID = TM_PAGO.PAG_ID INNER JOIN        
		TM_MONEDA ON TM_VENTA.MON_ID = TM_MONEDA.MON_ID INNER JOIN        
		TM_CLIENTE ON TM_VENTA.CLI_ID = TM_CLIENTE.CLI_ID INNER JOIN  
		TM_DOCUMENTO ON TM_VENTA.DOC_ID = TM_DOCUMENTO.DOC_ID  
		WHERE        
		TM_VENTA.EST=1        
		AND TM_VENTA.SUC_ID = p_SUC_ID  
	) TABLA
ORDER BY FECH_CREA DESC
LIMIT 20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_COMPRA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_COMPRA_01`(  
p_COMPR_ID INT)
BEGIN  
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 SELECT          
 TD_COMPRA_DETALLE.DETC_ID,   
 TM_CATEGORIA.CAT_NOM,   
 TM_PRODUCTO.PROD_NOM,
 TM_PRODUCTO.PROD_IMG,
 TM_UNIDAD.UND_NOM,   
 TD_COMPRA_DETALLE.PROD_PCOMPRA,  
 TD_COMPRA_DETALLE.DETC_CANT,   
 TD_COMPRA_DETALLE.DETC_TOTAL,   
 TD_COMPRA_DETALLE.COMPR_ID,   
 TD_COMPRA_DETALLE.PROD_ID  
 FROM              
 TD_COMPRA_DETALLE INNER JOIN  
 TM_PRODUCTO ON TD_COMPRA_DETALLE.PROD_ID = TM_PRODUCTO.PROD_ID INNER JOIN  
 TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID INNER JOIN  
 TM_UNIDAD ON TM_PRODUCTO.UND_ID = TM_UNIDAD.UND_ID  
 WHERE  
 TD_COMPRA_DETALLE.COMPR_ID = p_COMPR_ID  
 AND TD_COMPRA_DETALLE.EST=1;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_COMPRA_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_COMPRA_02`(
p_COMPR_ID INT)
BEGIN
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT        
TM_COMPRA.COMPR_ID, 
TM_COMPRA.SUC_ID, 
TM_COMPRA.PAG_ID, 
TM_COMPRA.PROV_ID, 
TM_COMPRA.PROV_RUC, 
TM_COMPRA.PROV_DIRECC, 
TM_COMPRA.PROV_CORREO, 
TM_COMPRA.COMPR_SUBTOTAL, 
TM_COMPRA.COMPR_IGV, 
TM_COMPRA.COMPR_TOTAL, 
TM_COMPRA.COMPR_COMENT, 
TM_COMPRA.USU_ID, 
TM_COMPRA.MON_ID, 
TM_COMPRA.FECH_CREA, 
TM_COMPRA.EST, 
TM_SUCURSAL.SUC_NOM, 
TM_EMPRESA.EMP_NOM, 
TM_EMPRESA.EMP_RUC, 
TM_EMPRESA.EMP_CORREO, 
TM_EMPRESA.EMP_TELF, 
TM_EMPRESA.EMP_DIRECC, 
TM_EMPRESA.EMP_PAG, 
TM_COMPANIA.COM_NOM, 
TM_USUARIO.USU_CORREO, 
TM_USUARIO.USU_NOM, 
TM_USUARIO.USU_APE, 
TM_USUARIO.USU_DNI, 
TM_USUARIO.USU_TELF, 
TM_ROL.ROL_NOM, 
TM_PAGO.PAG_NOM, 
TM_MONEDA.MON_NOM,
TM_PROVEEDOR.PROV_NOM
FROM            
TM_COMPRA INNER JOIN
TM_SUCURSAL ON TM_COMPRA.SUC_ID = TM_SUCURSAL.SUC_ID INNER JOIN
TM_EMPRESA ON TM_SUCURSAL.EMP_ID = TM_EMPRESA.EMP_ID INNER JOIN
TM_COMPANIA ON TM_EMPRESA.COM_ID = TM_COMPANIA.COM_ID INNER JOIN
TM_USUARIO ON TM_COMPRA.USU_ID = TM_USUARIO.USU_ID INNER JOIN
TM_ROL ON TM_USUARIO.ROL_ID = TM_ROL.ROL_ID INNER JOIN
TM_PAGO ON TM_COMPRA.PAG_ID = TM_PAGO.PAG_ID INNER JOIN
TM_MONEDA ON TM_COMPRA.MON_ID = TM_MONEDA.MON_ID INNER JOIN
TM_PROVEEDOR ON TM_COMPRA.PROV_ID = TM_PROVEEDOR.PROV_ID
WHERE  
TM_COMPRA.COMPR_ID = p_COMPR_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_COMPRA_03` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_COMPRA_03`(    
p_SUC_ID INT)
BEGIN    
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 SELECT            
 TM_COMPRA.COMPR_ID,     
 TM_COMPRA.SUC_ID,     
 TM_COMPRA.PAG_ID,     
 TM_COMPRA.PROV_ID,     
 TM_COMPRA.PROV_RUC,     
 TM_COMPRA.PROV_DIRECC,     
 TM_COMPRA.PROV_CORREO,     
 TM_COMPRA.COMPR_SUBTOTAL,     
 TM_COMPRA.COMPR_IGV,     
 TM_COMPRA.COMPR_TOTAL,     
 TM_COMPRA.COMPR_COMENT,     
 TM_COMPRA.USU_ID,     
 TM_COMPRA.MON_ID,     
 TM_COMPRA.FECH_CREA,     
 TM_COMPRA.EST,     
 TM_SUCURSAL.SUC_NOM,     
 TM_EMPRESA.EMP_NOM,     
 TM_EMPRESA.EMP_RUC,     
 TM_EMPRESA.EMP_CORREO,     
 TM_EMPRESA.EMP_TELF,     
 TM_EMPRESA.EMP_DIRECC,     
 TM_EMPRESA.EMP_PAG,     
 TM_COMPANIA.COM_NOM,     
 TM_USUARIO.USU_CORREO,     
 TM_USUARIO.USU_NOM,     
 TM_USUARIO.USU_APE,     
 TM_USUARIO.USU_DNI,     
 TM_USUARIO.USU_TELF,   
 TM_USUARIO.USU_IMG,  
 TM_ROL.ROL_NOM,     
 TM_PAGO.PAG_NOM,     
 TM_MONEDA.MON_NOM,    
 TM_PROVEEDOR.PROV_NOM,
 TM_DOCUMENTO.DOC_NOM
 FROM                
 TM_COMPRA INNER JOIN    
 TM_SUCURSAL ON TM_COMPRA.SUC_ID = TM_SUCURSAL.SUC_ID INNER JOIN    
 TM_EMPRESA ON TM_SUCURSAL.EMP_ID = TM_EMPRESA.EMP_ID INNER JOIN    
 TM_COMPANIA ON TM_EMPRESA.COM_ID = TM_COMPANIA.COM_ID INNER JOIN    
 TM_USUARIO ON TM_COMPRA.USU_ID = TM_USUARIO.USU_ID INNER JOIN    
 TM_ROL ON TM_USUARIO.ROL_ID = TM_ROL.ROL_ID INNER JOIN    
 TM_PAGO ON TM_COMPRA.PAG_ID = TM_PAGO.PAG_ID INNER JOIN    
 TM_MONEDA ON TM_COMPRA.MON_ID = TM_MONEDA.MON_ID INNER JOIN    
 TM_PROVEEDOR ON TM_COMPRA.PROV_ID = TM_PROVEEDOR.PROV_ID INNER JOIN
 TM_DOCUMENTO ON TM_COMPRA.DOC_ID = TM_DOCUMENTO.DOC_ID
 WHERE    
 TM_COMPRA.EST=1    
 AND TM_COMPRA.SUC_ID = p_SUC_ID;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_COMPRA_04` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_COMPRA_04`(
p_SUC_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT        
	TM_CATEGORIA.CAT_NOM, 
	SUM(TD_COMPRA_DETALLE.DETC_CANT) AS CANT
	FROM            
	TM_COMPRA INNER JOIN
	TD_COMPRA_DETALLE ON TM_COMPRA.COMPR_ID = TD_COMPRA_DETALLE.COMPR_ID INNER JOIN
	TM_PRODUCTO ON TD_COMPRA_DETALLE.PROD_ID = TM_PRODUCTO.PROD_ID INNER JOIN
	TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID
	WHERE        
	TM_COMPRA.EST = 1
	AND TM_COMPRA.SUC_ID = p_SUC_ID
	GROUP BY CAT_NOM
	ORDER BY CANT DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_COMPRA_05` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_COMPRA_05`(        
p_SUC_ID INT)
BEGIN        
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 SELECT              
 TM_COMPRA.COMPR_ID,         
 TM_COMPRA.SUC_ID,         
 TM_COMPRA.PAG_ID,         
 TM_COMPRA.PROV_ID,         
 TM_COMPRA.PROV_RUC,         
 TM_COMPRA.PROV_DIRECC,         
 TM_COMPRA.PROV_CORREO,         
 TM_COMPRA.COMPR_SUBTOTAL,         
 TM_COMPRA.COMPR_IGV,         
 TM_COMPRA.COMPR_TOTAL,         
 TM_COMPRA.COMPR_COMENT,         
 TM_COMPRA.USU_ID,         
 TM_COMPRA.MON_ID,         
 TM_COMPRA.FECH_CREA,         
 TM_COMPRA.EST,         
 TM_SUCURSAL.SUC_NOM,         
 TM_EMPRESA.EMP_NOM,         
 TM_EMPRESA.EMP_RUC,         
 TM_EMPRESA.EMP_CORREO,         
 TM_EMPRESA.EMP_TELF,         
 TM_EMPRESA.EMP_DIRECC,         
 TM_EMPRESA.EMP_PAG,         
 TM_COMPANIA.COM_NOM,         
 TM_USUARIO.USU_CORREO,         
 TM_USUARIO.USU_NOM,         
 TM_USUARIO.USU_APE,         
 TM_USUARIO.USU_DNI,         
 TM_USUARIO.USU_TELF,       
 TM_USUARIO.USU_IMG,      
 TM_ROL.ROL_NOM,         
 TM_PAGO.PAG_NOM,         
 TM_MONEDA.MON_NOM,        
 TM_PROVEEDOR.PROV_NOM,    
 TM_DOCUMENTO.DOC_NOM    
 FROM                    
 TM_COMPRA INNER JOIN        
 TM_SUCURSAL ON TM_COMPRA.SUC_ID = TM_SUCURSAL.SUC_ID INNER JOIN        
 TM_EMPRESA ON TM_SUCURSAL.EMP_ID = TM_EMPRESA.EMP_ID INNER JOIN        
 TM_COMPANIA ON TM_EMPRESA.COM_ID = TM_COMPANIA.COM_ID INNER JOIN        
 TM_USUARIO ON TM_COMPRA.USU_ID = TM_USUARIO.USU_ID INNER JOIN        
 TM_ROL ON TM_USUARIO.ROL_ID = TM_ROL.ROL_ID INNER JOIN        
 TM_PAGO ON TM_COMPRA.PAG_ID = TM_PAGO.PAG_ID INNER JOIN        
 TM_MONEDA ON TM_COMPRA.MON_ID = TM_MONEDA.MON_ID INNER JOIN        
 TM_PROVEEDOR ON TM_COMPRA.PROV_ID = TM_PROVEEDOR.PROV_ID INNER JOIN    
 TM_DOCUMENTO ON TM_COMPRA.DOC_ID = TM_DOCUMENTO.DOC_ID    
 WHERE        
 TM_COMPRA.EST=1        
 AND TM_COMPRA.SUC_ID = p_SUC_ID      
 ORDER BY COMPR_ID DESC
 LIMIT 6;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_COMPRA_06` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_COMPRA_06`(
p_SUC_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT 
	DATE_FORMAT(FECH_CREA,'%d/%m/%Y') AS FECH_CREA,
	SUM(COMPR_TOTAL) AS COMPR_TOTAL
	FROM TM_COMPRA 
	WHERE 
	EST=1
	AND SUC_ID = p_SUC_ID
	GROUP BY 
	DATE_FORMAT(FECH_CREA,'%d/%m/%Y');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_DOCUMENTO_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_DOCUMENTO_01`(
p_DOC_TIPO VARCHAR(150))
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_DOCUMENTO
	WHERE 
	EST=1
	AND DOC_TIPO = p_DOC_TIPO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_EMPRESA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_EMPRESA_01`(
p_COM_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_EMPRESA
	WHERE
	COM_ID = p_COM_ID
	AND EST=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_EMPRESA_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_EMPRESA_02`(
p_EMP_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_EMPRESA
	WHERE
	EMP_ID = p_EMP_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_MENU_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_MENU_01`(
p_ROL_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT        
	TD_MENU.MEND_ID, 
	TD_MENU.MEN_ID, 
	TD_MENU.ROL_ID, 
	TD_MENU.MEND_PERMI, 
	TD_MENU.FECH_CREA, 
	TD_MENU.EST, 
	TM_MENU.MEN_NOM, 
	TM_MENU.MEN_RUTA, 
	TM_MENU.MEN_IDENTI,
	TM_MENU.MEN_GRUPO
	FROM            
	TD_MENU INNER JOIN
	TM_MENU ON TD_MENU.MEN_ID = TM_MENU.MEN_ID
	WHERE 
	TD_MENU.ROL_ID = p_ROL_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_MENU_03` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_MENU_03`(
p_USU_ID INT,
p_MEN_IDENTI VARCHAR(100))
BEGIN  
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT        
	TD_MENU.MEND_ID, 
	TD_MENU.MEN_ID, 
	TD_MENU.ROL_ID, 
	TD_MENU.MEND_PERMI, 
	TD_MENU.FECH_CREA, 
	TD_MENU.EST, 
	TM_MENU.MEN_NOM, 
	TM_MENU.MEN_RUTA, 
	TM_MENU.MEN_IDENTI, 
	TM_MENU.MEN_GRUPO, 
	TM_USUARIO.USU_ID, 
	TM_ROL.ROL_NOM
	FROM            
	TD_MENU INNER JOIN
	TM_MENU ON TD_MENU.MEN_ID = TM_MENU.MEN_ID INNER JOIN
	TM_ROL ON TD_MENU.ROL_ID = TM_ROL.ROL_ID INNER JOIN
	TM_USUARIO ON TM_ROL.ROL_ID = TM_USUARIO.ROL_ID
 WHERE   
	TM_USUARIO.USU_ID=1  
	AND MEND_PERMI ='Si'
	AND TM_MENU.MEN_IDENTI = 'mntsucursal';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_MONEDA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_MONEDA_01`(  
p_SUC_ID INT)
BEGIN  
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 SELECT 
 MON_ID,
 SUC_ID,
 MON_NOM,
 DATE_FORMAT(FECH_CREA,'%d/%m/%Y') AS FECH_CREA,
 EST
 FROM TM_MONEDA  
 WHERE  
 SUC_ID = p_SUC_ID  
 AND EST=1;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_MONEDA_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_MONEDA_02`(
p_MON_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_MONEDA
	WHERE
	MON_ID = p_MON_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_PAGO_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_PAGO_01`()
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_PAGO WHERE EST=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_PRODUCTO_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_PRODUCTO_01`(  
p_SUC_ID INT)
BEGIN  
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT        
TM_PRODUCTO.PROD_ID, 
TM_PRODUCTO.SUC_ID, 
TM_PRODUCTO.CAT_ID, 
TM_PRODUCTO.PROD_NOM, 
TM_PRODUCTO.PROD_DESCRIP, 
TM_PRODUCTO.UND_ID, 
TM_PRODUCTO.MON_ID, 
TM_PRODUCTO.PROD_PCOMPRA, 
TM_PRODUCTO.PROD_PVENTA, 
TM_PRODUCTO.PROD_STOCK, 
TM_PRODUCTO.PROD_FECHAVEN, 
TM_PRODUCTO.PROD_IMG, 
TM_PRODUCTO.FECH_CREA, 
TM_PRODUCTO.EST, 
TM_CATEGORIA.CAT_NOM, 
TM_MONEDA.MON_NOM, 
TM_UNIDAD.UND_NOM
FROM            
TM_PRODUCTO INNER JOIN
TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID INNER JOIN
TM_MONEDA ON TM_PRODUCTO.MON_ID = TM_MONEDA.MON_ID INNER JOIN
TM_UNIDAD ON TM_PRODUCTO.UND_ID = TM_UNIDAD.UND_ID
 WHERE  
 TM_PRODUCTO.SUC_ID = p_SUC_ID  
 AND TM_PRODUCTO.EST=1;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_PRODUCTO_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_PRODUCTO_02`(  
p_PROD_ID INT)
BEGIN  
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 SELECT          
TM_PRODUCTO.PROD_ID,   
TM_PRODUCTO.SUC_ID,   
TM_PRODUCTO.CAT_ID,   
TM_PRODUCTO.PROD_NOM,   
TM_PRODUCTO.PROD_DESCRIP,   
TM_PRODUCTO.UND_ID,   
TM_PRODUCTO.MON_ID,   
TM_PRODUCTO.PROD_PCOMPRA,   
TM_PRODUCTO.PROD_PVENTA,   
TM_PRODUCTO.PROD_STOCK,   
TM_PRODUCTO.PROD_FECHAVEN,   
TM_PRODUCTO.PROD_IMG,   
TM_PRODUCTO.FECH_CREA,   
TM_PRODUCTO.EST,   
TM_CATEGORIA.CAT_NOM,   
TM_MONEDA.MON_NOM,   
TM_UNIDAD.UND_NOM  
FROM              
TM_PRODUCTO INNER JOIN  
TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID INNER JOIN  
TM_MONEDA ON TM_PRODUCTO.MON_ID = TM_MONEDA.MON_ID INNER JOIN  
TM_UNIDAD ON TM_PRODUCTO.UND_ID = TM_UNIDAD.UND_ID  
 WHERE  
 TM_PRODUCTO.PROD_ID = p_PROD_ID;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_PRODUCTO_03` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_PRODUCTO_03`(    
p_CAT_ID INT)
BEGIN    
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT          
TM_PRODUCTO.PROD_ID,   
TM_PRODUCTO.SUC_ID,   
TM_PRODUCTO.CAT_ID,   
TM_PRODUCTO.PROD_NOM,   
TM_PRODUCTO.PROD_DESCRIP,   
TM_PRODUCTO.UND_ID,   
TM_PRODUCTO.MON_ID,   
TM_PRODUCTO.PROD_PCOMPRA,   
TM_PRODUCTO.PROD_PVENTA,   
TM_PRODUCTO.PROD_STOCK,   
TM_PRODUCTO.PROD_FECHAVEN,   
TM_PRODUCTO.PROD_IMG,   
TM_PRODUCTO.FECH_CREA,   
TM_PRODUCTO.EST,   
TM_CATEGORIA.CAT_NOM,   
TM_MONEDA.MON_NOM,   
TM_UNIDAD.UND_NOM  
FROM              
TM_PRODUCTO INNER JOIN  
TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID INNER JOIN  
TM_MONEDA ON TM_PRODUCTO.MON_ID = TM_MONEDA.MON_ID INNER JOIN  
TM_UNIDAD ON TM_PRODUCTO.UND_ID = TM_UNIDAD.UND_ID  
 WHERE    
 TM_PRODUCTO.CAT_ID = p_CAT_ID    
 AND TM_PRODUCTO.EST=1;     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_PRODUCTO_05` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_PRODUCTO_05`(
p_PROD_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM 
	(
		SELECT        
		TM_COMPRA.COMPR_ID, 
		DATE_FORMAT(TM_COMPRA.FECH_CREA,'%d/%m/%Y') AS FECH_CREA,
		TD_COMPRA_DETALLE.DETC_CANT, 
		TD_COMPRA_DETALLE.PROD_ID, 
		TM_DOCUMENTO.DOC_NOM,
		'Compra' as REGISTRO
		FROM            
		TM_COMPRA INNER JOIN
		TD_COMPRA_DETALLE ON TM_COMPRA.COMPR_ID = TD_COMPRA_DETALLE.COMPR_ID INNER JOIN
		TM_DOCUMENTO ON TM_COMPRA.DOC_ID = TM_DOCUMENTO.DOC_ID
		WHERE        
		TM_COMPRA.EST = 1 
		AND TD_COMPRA_DETALLE.PROD_ID = p_PROD_ID

		UNION ALL

		SELECT        
		TM_VENTA.VENT_ID, 
		DATE_FORMAT(TM_VENTA.FECH_CREA,'%d/%m/%Y') AS FECH_CREA,
		TD_VENTA_DETALLE.DETV_CANT, 
		TD_VENTA_DETALLE.PROD_ID, 
		TM_DOCUMENTO.DOC_NOM,
		'Venta' as REGISTRO
		FROM            
		TM_VENTA INNER JOIN
		TD_VENTA_DETALLE ON TM_VENTA.VENT_ID = TD_VENTA_DETALLE.VENT_ID INNER JOIN
		TM_DOCUMENTO ON TM_VENTA.DOC_ID = TM_DOCUMENTO.DOC_ID
		WHERE        
		TM_VENTA.EST = 1 
		AND TD_VENTA_DETALLE.PROD_ID = p_PROD_ID
	) TABLA 
	ORDER BY 
	FECH_CREA DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_PROVEEDOR_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_PROVEEDOR_01`(
p_EMP_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_PROVEEDOR
	WHERE
	EMP_ID = p_EMP_ID
	AND EST=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_PROVEEDOR_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_PROVEEDOR_02`(
p_PROV_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_PROVEEDOR
	WHERE
	PROV_ID = p_PROV_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_ROL_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_ROL_01`(
p_SUC_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_ROL
	WHERE
	SUC_ID = p_SUC_ID
	AND EST=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_ROL_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_ROL_02`(
p_ROL_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_ROL
	WHERE
	ROL_ID = p_ROL_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_SUCURSAL_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_SUCURSAL_01`(
p_EMP_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_SUCURSAL
	WHERE
	EMP_ID = p_EMP_ID
	AND EST=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_SUCURSAL_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_SUCURSAL_02`(
p_SUC_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_SUCURSAL
	WHERE
	SUC_ID = p_SUC_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_UNIDAD_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_UNIDAD_01`(
p_SUC_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_UNIDAD
	WHERE
	SUC_ID = p_SUC_ID
	AND EST=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_UNIDAD_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_UNIDAD_02`(
p_UND_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_UNIDAD
	WHERE
	UND_ID = p_UND_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_USUARIO_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_USUARIO_01`(    
p_SUC_ID INT)
BEGIN    
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT          
TM_USUARIO.USU_ID,   
TM_USUARIO.SUC_ID,   
TM_USUARIO.USU_CORREO,   
TM_USUARIO.USU_NOM,   
TM_USUARIO.USU_APE,   
TM_USUARIO.USU_DNI,   
TM_USUARIO.USU_TELF,   
TM_USUARIO.USU_PASS,  
TM_USUARIO.USU_IMG, 
TM_USUARIO.ROL_ID,   
TM_USUARIO.FECH_CREA,  
TM_ROL.ROL_NOM,   
TM_USUARIO.EST  
FROM              
TM_USUARIO INNER JOIN  
TM_ROL ON TM_USUARIO.ROL_ID = TM_ROL.ROL_ID  
WHERE    
TM_USUARIO.SUC_ID = p_SUC_ID    
AND TM_USUARIO.EST=1;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_USUARIO_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_USUARIO_02`(
p_USU_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_USUARIO
	WHERE
	USU_ID = p_USU_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_USUARIO_03` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_USUARIO_03`(
p_USU_CORREO VARCHAR(150),
p_USU_PASS VARCHAR(50))
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT * FROM TM_USUARIO
	WHERE
	USU_CORREO = p_USU_CORREO
	AND USU_PASS = p_USU_PASS
	AND EST=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_USUARIO_04` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_USUARIO_04`(    
p_SUC_ID INT,    
p_USU_CORREO VARCHAR(50),    
p_USU_PASS VARCHAR(30))
BEGIN    
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 SELECT            
 TM_USUARIO.USU_ID,     
 TM_USUARIO.SUC_ID,     
 TM_USUARIO.USU_CORREO,     
 TM_USUARIO.USU_NOM,     
 TM_USUARIO.USU_APE,     
 TM_USUARIO.USU_DNI,     
 TM_USUARIO.USU_TELF,     
 TM_USUARIO.USU_PASS,     
 TM_USUARIO.ROL_ID,    
 TM_USUARIO.USU_IMG, 
 TM_SUCURSAL.EMP_ID,     
 TM_SUCURSAL.SUC_NOM,    
 TM_EMPRESA.EMP_ID,    
 TM_EMPRESA.EMP_NOM,     
 TM_EMPRESA.EMP_RUC,     
 TM_EMPRESA.COM_ID,     
 TM_COMPANIA.COM_NOM    
 FROM      
 TM_USUARIO INNER JOIN    
 TM_SUCURSAL ON TM_USUARIO.SUC_ID = TM_SUCURSAL.SUC_ID INNER JOIN    
 TM_EMPRESA ON TM_SUCURSAL.EMP_ID = TM_EMPRESA.EMP_ID INNER JOIN    
 TM_COMPANIA ON TM_EMPRESA.COM_ID = TM_COMPANIA.COM_ID    
 WHERE    
 TM_USUARIO.SUC_ID = p_SUC_ID     
 AND TM_USUARIO.USU_CORREO = p_USU_CORREO    
 AND TM_USUARIO.USU_PASS = p_USU_PASS    
 AND TM_USUARIO.EST = 1;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_VENTA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_VENTA_01`(   
p_VENT_ID INT)
BEGIN  
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 SELECT          
 TD_VENTA_DETALLE.DETV_ID,   
 TM_CATEGORIA.CAT_NOM,   
 TM_PRODUCTO.PROD_NOM,
 TM_PRODUCTO.PROD_IMG,
 TM_UNIDAD.UND_NOM,   
 TD_VENTA_DETALLE.PROD_PVENTA,  
 TD_VENTA_DETALLE.DETV_CANT,   
 TD_VENTA_DETALLE.DETV_TOTAL,   
 TD_VENTA_DETALLE.VENT_ID,   
 TD_VENTA_DETALLE.PROD_ID  
 FROM              
 TD_VENTA_DETALLE INNER JOIN  
 TM_PRODUCTO ON TD_VENTA_DETALLE.PROD_ID = TM_PRODUCTO.PROD_ID INNER JOIN  
 TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID INNER JOIN  
 TM_UNIDAD ON TM_PRODUCTO.UND_ID = TM_UNIDAD.UND_ID  
 WHERE  
 TD_VENTA_DETALLE.VENT_ID = p_VENT_ID  
 AND TD_VENTA_DETALLE.EST=1;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_VENTA_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_VENTA_02`(
p_VENT_ID INT)
BEGIN
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT        
TM_VENTA.VENT_ID, 
TM_VENTA.SUC_ID, 
TM_VENTA.PAG_ID, 
TM_VENTA.CLI_ID, 
TM_VENTA.CLI_RUC, 
TM_VENTA.CLI_DIRECC, 
TM_VENTA.CLI_CORREO, 
TM_VENTA.VENT_SUBTOTAL, 
TM_VENTA.VENT_IGV, 
TM_VENTA.VENT_TOTAL, 
TM_VENTA.VENT_COMENT, 
TM_VENTA.USU_ID, 
TM_VENTA.MON_ID, 
TM_VENTA.FECH_CREA, 
TM_VENTA.EST, 
TM_SUCURSAL.SUC_NOM, 
TM_EMPRESA.EMP_NOM, 
TM_EMPRESA.EMP_RUC, 
TM_EMPRESA.EMP_CORREO, 
TM_EMPRESA.EMP_TELF, 
TM_EMPRESA.EMP_DIRECC, 
TM_EMPRESA.EMP_PAG, 
TM_COMPANIA.COM_NOM, 
TM_USUARIO.USU_CORREO, 
TM_USUARIO.USU_NOM, 
TM_USUARIO.USU_APE, 
TM_USUARIO.USU_DNI, 
TM_USUARIO.USU_TELF, 
TM_ROL.ROL_NOM, 
TM_PAGO.PAG_NOM, 
TM_MONEDA.MON_NOM,
TM_CLIENTE.CLI_NOM
FROM            
TM_VENTA INNER JOIN
TM_SUCURSAL ON TM_VENTA.SUC_ID = TM_SUCURSAL.SUC_ID INNER JOIN
TM_EMPRESA ON TM_SUCURSAL.EMP_ID = TM_EMPRESA.EMP_ID INNER JOIN
TM_COMPANIA ON TM_EMPRESA.COM_ID = TM_COMPANIA.COM_ID INNER JOIN
TM_USUARIO ON TM_VENTA.USU_ID = TM_USUARIO.USU_ID INNER JOIN
TM_ROL ON TM_USUARIO.ROL_ID = TM_ROL.ROL_ID INNER JOIN
TM_PAGO ON TM_VENTA.PAG_ID = TM_PAGO.PAG_ID INNER JOIN
TM_MONEDA ON TM_VENTA.MON_ID = TM_MONEDA.MON_ID INNER JOIN
TM_CLIENTE ON TM_VENTA.CLI_ID = TM_CLIENTE.CLI_ID
WHERE  
TM_VENTA.VENT_ID = p_VENT_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_VENTA_03` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_VENTA_03`(      
p_SUC_ID INT)
BEGIN      
 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 SELECT              
 TM_VENTA.VENT_ID,       
 TM_VENTA.SUC_ID,       
 TM_VENTA.PAG_ID,       
 TM_VENTA.CLI_ID,       
 TM_VENTA.CLI_RUC,       
 TM_VENTA.CLI_DIRECC,       
 TM_VENTA.CLI_CORREO,       
 TM_VENTA.VENT_SUBTOTAL,       
 TM_VENTA.VENT_IGV,       
 TM_VENTA.VENT_TOTAL,       
 TM_VENTA.VENT_COMENT,       
 TM_VENTA.USU_ID,       
 TM_VENTA.MON_ID,       
 TM_VENTA.FECH_CREA,       
 TM_VENTA.EST,       
 TM_SUCURSAL.SUC_NOM,       
 TM_EMPRESA.EMP_NOM,       
 TM_EMPRESA.EMP_RUC,       
 TM_EMPRESA.EMP_CORREO,       
 TM_EMPRESA.EMP_TELF,       
 TM_EMPRESA.EMP_DIRECC,       
 TM_EMPRESA.EMP_PAG,       
 TM_COMPANIA.COM_NOM,       
 TM_USUARIO.USU_CORREO,       
 TM_USUARIO.USU_NOM,       
 TM_USUARIO.USU_APE,       
 TM_USUARIO.USU_DNI,       
 TM_USUARIO.USU_TELF,       
 TM_USUARIO.USU_IMG,   
 TM_ROL.ROL_NOM,       
 TM_PAGO.PAG_NOM,       
 TM_MONEDA.MON_NOM,      
 TM_CLIENTE.CLI_NOM,
 TM_DOCUMENTO.DOC_NOM
 FROM                  
 TM_VENTA INNER JOIN      
 TM_SUCURSAL ON TM_VENTA.SUC_ID = TM_SUCURSAL.SUC_ID INNER JOIN      
 TM_EMPRESA ON TM_SUCURSAL.EMP_ID = TM_EMPRESA.EMP_ID INNER JOIN      
 TM_COMPANIA ON TM_EMPRESA.COM_ID = TM_COMPANIA.COM_ID INNER JOIN      
 TM_USUARIO ON TM_VENTA.USU_ID = TM_USUARIO.USU_ID INNER JOIN      
 TM_ROL ON TM_USUARIO.ROL_ID = TM_ROL.ROL_ID INNER JOIN      
 TM_PAGO ON TM_VENTA.PAG_ID = TM_PAGO.PAG_ID INNER JOIN      
 TM_MONEDA ON TM_VENTA.MON_ID = TM_MONEDA.MON_ID INNER JOIN      
 TM_CLIENTE ON TM_VENTA.CLI_ID = TM_CLIENTE.CLI_ID INNER JOIN
 TM_DOCUMENTO ON TM_VENTA.DOC_ID = TM_DOCUMENTO.DOC_ID
 WHERE      
 TM_VENTA.EST=1      
 AND TM_VENTA.SUC_ID = p_SUC_ID;      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_VENTA_04` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_VENTA_04`(
p_SUC_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT        
 TD_VENTA_DETALLE.PROD_ID, 
	SUM(TD_VENTA_DETALLE.DETV_CANT) AS CANT, 
	TM_PRODUCTO.PROD_NOM, 
	TM_PRODUCTO.PROD_PVENTA, 
	TM_CATEGORIA.CAT_NOM, 
	TM_UNIDAD.UND_NOM, 
	TM_PRODUCTO.PROD_STOCK, 
	TM_PRODUCTO.PROD_IMG,
	TM_MONEDA.MON_NOM,
	SUM(TM_VENTA.VENT_TOTAL) AS TOTAL
	FROM            
	TD_VENTA_DETALLE INNER JOIN
	TM_PRODUCTO ON TD_VENTA_DETALLE.PROD_ID = TM_PRODUCTO.PROD_ID INNER JOIN
	TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID INNER JOIN
	TM_UNIDAD ON TM_PRODUCTO.UND_ID = TM_UNIDAD.UND_ID INNER JOIN
	TM_VENTA ON TD_VENTA_DETALLE.VENT_ID = TM_VENTA.VENT_ID INNER JOIN
	TM_MONEDA ON TM_VENTA.MON_ID = TM_MONEDA.MON_ID
	WHERE
	TM_VENTA.EST = 1
	AND TM_PRODUCTO.EST=1
	AND TM_VENTA.SUC_ID = p_SUC_ID
	GROUP BY 
	TD_VENTA_DETALLE.PROD_ID, 
	TM_PRODUCTO.PROD_NOM, 
	TM_PRODUCTO.PROD_PVENTA, 
	TM_CATEGORIA.CAT_NOM, 
	TM_UNIDAD.UND_NOM, 
	TM_PRODUCTO.PROD_STOCK, 
	TM_PRODUCTO.PROD_IMG,
	TM_MONEDA.MON_NOM
	ORDER BY CANT DESC
	LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_L_VENTA_06` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_L_VENTA_06`(
p_SUC_ID INT)
BEGIN
	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT 
	DATE_FORMAT(FECH_CREA,'%d/%m/%Y') AS FECH_CREA,
	SUM(VENT_TOTAL) AS VENT_TOTAL
	FROM TM_VENTA 
	WHERE 
	EST=1
	AND SUC_ID = p_SUC_ID
	GROUP BY 
	DATE_FORMAT(FECH_CREA,'%d/%m/%Y');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_CATEGORIA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_CATEGORIA_01`(
p_CAT_ID INT,
p_SUC_ID INT,
p_CAT_NOM VARCHAR(150))
BEGIN
	UPDATE TM_CATEGORIA
	SET
		SUC_ID = p_SUC_ID,
		CAT_NOM = p_CAT_NOM
	WHERE
		CAT_ID = p_CAT_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_CLIENTE_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_CLIENTE_01`(  
p_CLI_ID INT,  
p_CLI_NOM VARCHAR(150),  
p_EMP_ID INT,  
p_CLI_RUC VARCHAR(150),  
p_CLI_TELF VARCHAR(150),  
p_CLI_DIRECC VARCHAR(150),  
p_CLI_CORREO VARCHAR(100))
BEGIN  
 UPDATE TM_CLIENTE  
 SET  
  CLI_NOM = p_CLI_NOM,  
  EMP_ID = p_EMP_ID,  
  CLI_RUC = p_CLI_RUC,  
  CLI_TELF = p_CLI_TELF,  
  CLI_DIRECC = p_CLI_DIRECC,  
  CLI_CORREO = p_CLI_CORREO  
 WHERE  
  CLI_ID = p_CLI_ID;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_COMPANIA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_COMPANIA_01`(
p_COM_ID INT,
p_COM_NOM VARCHAR(150))
BEGIN
	UPDATE TM_COMPANIA
	SET
		COM_NOM = p_COM_NOM
	WHERE
		COM_ID = p_COM_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_COMPRA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_COMPRA_01`(
p_COMPR_ID INT)
BEGIN
	UPDATE TM_COMPRA
	SET
		COMPR_SUBTOTAL = (SELECT SUM(DETC_TOTAL) AS COMPR_SUBTOTAL FROM TD_COMPRA_DETALLE WHERE COMPR_ID=p_COMPR_ID AND EST=1),
		COMPR_IGV = (SELECT SUM(DETC_TOTAL) AS COMPR_SUBTOTAL FROM TD_COMPRA_DETALLE WHERE COMPR_ID=p_COMPR_ID AND EST=1) * 0.18,
		COMPR_TOTAL = (SELECT SUM(DETC_TOTAL) AS COMPR_SUBTOTAL FROM TD_COMPRA_DETALLE WHERE COMPR_ID=p_COMPR_ID AND EST=1) +((SELECT SUM(DETC_TOTAL) AS COMPR_SUBTOTAL FROM TD_COMPRA_DETALLE WHERE COMPR_ID=p_COMPR_ID AND EST=1) * 0.18)
	WHERE
		COMPR_ID = p_COMPR_ID;

	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT 
		COMPR_SUBTOTAL,
		COMPR_IGV,
		COMPR_TOTAL 
	FROM 
		TM_COMPRA
	WHERE
		COMPR_ID = p_COMPR_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_COMPRA_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_COMPRA_02`(
p_COMPR_ID INT)
BEGIN
DECLARE NOT_FOUND INT DEFAULT 0;
	DECLARE v_ID_REGISTRO INT;
	DECLARE v_PROD_ID INT;
	DECLARE v_CANT INT;

	DECLARE CUR CURSOR FOR SELECT DETC_ID FROM TD_COMPRA_DETALLE WHERE COMPR_ID=p_COMPR_ID;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET NOT_FOUND = 1;
	OPEN CUR;
	FETCH NEXT FROM CUR INTO v_ID_REGISTRO;
	WHILE NOT_FOUND=0
		DO
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			SELECT PROD_ID INTO v_PROD_ID FROM TD_COMPRA_DETALLE WHERE DETC_ID = v_ID_REGISTRO;
			
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			SELECT DETC_CANT INTO v_CANT FROM TD_COMPRA_DETALLE WHERE DETC_ID = v_ID_REGISTRO;

			UPDATE TM_PRODUCTO
			SET
				PROD_STOCK = PROD_STOCK + v_CANT
			WHERE
				PROD_ID = v_PROD_ID;

			FETCH NEXT FROM CUR INTO v_ID_REGISTRO;
		END WHILE;
	CLOSE CUR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_COMPRA_03` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_COMPRA_03`(  
p_COMPR_ID INT,  
p_PAG_ID INT,  
p_PROV_ID INT,  
p_PROV_RUC VARCHAR(20),  
p_PROV_DIRECC VARCHAR(150),  
p_PROV_CORREO VARCHAR(150),  
p_COMPR_COMENT VARCHAR(250),  
p_MON_ID INT,
p_DOC_ID INT)
BEGIN
 DECLARE v_ID_REGISTRO INT;  
 DECLARE v_PROD_ID INT;  
 DECLARE v_CANT INT;
DECLARE NOT_FOUND INT DEFAULT 0;  

DECLARE CUR CURSOR FOR SELECT DETC_ID FROM TD_COMPRA_DETALLE WHERE COMPR_ID=p_COMPR_ID;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET NOT_FOUND = 1;  

 UPDATE TM_COMPRA  
 SET  
  PAG_ID = p_PAG_ID,  
  PROV_ID = p_PROV_ID,  
  PROV_RUC = p_PROV_RUC,  
  PROV_DIRECC = p_PROV_DIRECC,  
  PROV_CORREO = p_PROV_CORREO,  
  COMPR_COMENT = p_COMPR_COMENT,  
  MON_ID = p_MON_ID,  
  DOC_ID = p_DOC_ID,
  FECH_CREA = NOW(3),  
  EST = 1  
 WHERE  
  COMPR_ID = p_COMPR_ID;  
   
 
 OPEN CUR;  
 FETCH NEXT FROM CUR INTO v_ID_REGISTRO;  
 WHILE NOT_FOUND=0  
  DO  
   -- SQLINES LICENSE FOR EVALUATION USE ONLY
   SELECT PROD_ID INTO v_PROD_ID FROM TD_COMPRA_DETALLE WHERE DETC_ID = v_ID_REGISTRO;  
     
   -- SQLINES LICENSE FOR EVALUATION USE ONLY
   SELECT DETC_CANT INTO v_CANT FROM TD_COMPRA_DETALLE WHERE DETC_ID = v_ID_REGISTRO;  
  
   UPDATE TM_PRODUCTO  
   SET  
    PROD_STOCK = PROD_STOCK + v_CANT  
   WHERE  
    PROD_ID = v_PROD_ID;  
  
   FETCH NEXT FROM CUR INTO v_ID_REGISTRO;  
  END WHILE;  
 CLOSE CUR;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_EMPRESA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_EMPRESA_01`(
p_EMP_ID INT,
p_COM_ID INT,
p_EMP_NOM VARCHAR(150),
p_EMP_RUC VARCHAR(150))
BEGIN
	UPDATE TM_EMPRESA
	SET
		COM_ID = p_COM_ID,
		EMP_NOM = p_EMP_NOM,
		EMP_RUC = p_EMP_RUC
	WHERE
		EMP_ID = p_EMP_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_MENU_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_MENU_01`(
p_MEND_ID INT)
BEGIN
	UPDATE TD_MENU
	SET
		MEND_PERMI = 'Si'
	WHERE
		MEND_ID = p_MEND_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_MENU_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_MENU_02`(
p_MEND_ID INT)
BEGIN
	UPDATE TD_MENU
	SET
		MEND_PERMI = 'No'
	WHERE
		MEND_ID = p_MEND_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_MONEDA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_MONEDA_01`(
p_MON_ID INT,
p_SUC_ID INT,
p_MON_NOM VARCHAR(150))
BEGIN
	UPDATE TM_MONEDA
	SET
		SUC_ID = p_SUC_ID,
		MON_NOM = p_MON_NOM
	WHERE
		MON_ID = p_MON_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_PRODUCTO_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_PRODUCTO_01`(
p_PROD_ID INT,
p_SUC_ID INT,
p_CAT_ID INT,
p_PROD_NOM VARCHAR(150),
p_PROD_DESCRIP VARCHAR(150),
p_UND_ID INT,
p_MON_ID INT,
p_PROD_PCOMPRA NUMERIC(18,2),
p_PROD_PVENTA NUMERIC(18,2),
p_PROD_STOCK INT,
p_PROD_FECHAVEN DATE,
p_PROD_IMG LONGTEXT)
BEGIN
	UPDATE TM_PRODUCTO
	SET
		SUC_ID = p_SUC_ID,
		CAT_ID = p_CAT_ID,
		PROD_NOM = p_PROD_NOM,
		PROD_DESCRIP = p_PROD_DESCRIP,
		UND_ID = p_UND_ID,
		MON_ID = p_MON_ID,
		PROD_PCOMPRA = p_PROD_PCOMPRA,
		PROD_PVENTA = p_PROD_PVENTA,
		PROD_STOCK = p_PROD_STOCK,
		PROD_FECHAVEN = p_PROD_FECHAVEN,
		PROD_IMG = p_PROD_IMG
	WHERE
		PROD_ID = p_PROD_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_PROVEEDOR_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_PROVEEDOR_01`(
p_PROV_ID INT,
p_EMP_ID INT,
p_PROV_NOM VARCHAR(150),
p_PROV_RUC VARCHAR(50),
p_PROV_TELF VARCHAR(150),
p_PROV_DIRECC VARCHAR(150),
p_PROV_CORREO VARCHAR(100))
BEGIN
	UPDATE TM_PROVEEDOR
	SET
		EMP_ID = p_EMP_ID,
		PROV_NOM = p_PROV_NOM,
		PROV_RUC = p_PROV_RUC,
		PROV_TELF = p_PROV_TELF,
		PROV_DIRECC = p_PROV_DIRECC,
		PROV_CORREO = p_PROV_CORREO
	WHERE
		PROV_ID = p_PROV_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_ROL_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_ROL_01`(
p_ROL_ID INT,
p_SUC_ID INT,
p_ROL_NOM VARCHAR(150))
BEGIN
	UPDATE TM_ROL
	SET
		SUC_ID = p_SUC_ID,
		ROL_NOM = p_ROL_NOM
	WHERE
		ROL_ID = p_ROL_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_SUCURSAL_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_SUCURSAL_01`(
p_SUC_ID INT,
p_EMP_ID INT,
p_SUC_NOM VARCHAR(150))
BEGIN
	UPDATE TM_SUCURSAL
	SET
		EMP_ID = p_EMP_ID,
		SUC_NOM = p_SUC_NOM
	WHERE
		SUC_ID = p_SUC_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_UNIDAD_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_UNIDAD_01`(
p_UND_ID INT,
p_SUC_ID INT,
p_UND_NOM VARCHAR(150))
BEGIN
	UPDATE TM_UNIDAD
	SET
		SUC_ID = p_SUC_ID,
		UND_NOM = p_UND_NOM
	WHERE
		UND_ID = p_UND_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_USUARIO_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_USUARIO_01`(  
p_USU_ID INT,  
p_SUC_ID INT,  
p_USU_CORREO VARCHAR(150),  
p_USU_NOM VARCHAR(150),  
p_USU_APE VARCHAR(150),  
p_USU_DNI VARCHAR(150),  
p_USU_TELF VARCHAR(150),  
p_USU_PASS VARCHAR(150),  
p_ROL_ID INT,
p_USU_IMG LONGTEXT)
BEGIN  
 UPDATE TM_USUARIO  
 SET  
  SUC_ID = p_SUC_ID,  
  USU_CORREO = p_USU_CORREO,  
  USU_NOM = p_USU_NOM,  
  USU_APE = p_USU_APE,  
  USU_DNI = p_USU_DNI,  
  USU_TELF = p_USU_TELF,  
  USU_PASS = p_USU_PASS,  
  ROL_ID = p_ROL_ID,
  USU_IMG = p_USU_IMG
 WHERE  
  USU_ID = p_USU_ID;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_USUARIO_02` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_USUARIO_02`(
p_USU_ID INT,
p_USU_PASS VARCHAR(50))
BEGIN
	UPDATE TM_USUARIO
	SET
		USU_PASS = p_USU_PASS
	WHERE
		USU_ID = p_USU_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_VENTA_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_VENTA_01`(
p_VENT_ID INT)
BEGIN
	UPDATE TM_VENTA
	SET
		VENT_SUBTOTAL = (SELECT SUM(DETV_TOTAL) AS VENT_SUBTOTAL FROM TD_VENTA_DETALLE WHERE VENT_ID=p_VENT_ID AND EST=1),
		VENT_IGV = (SELECT SUM(DETV_TOTAL) AS VENT_SUBTOTAL FROM TD_VENTA_DETALLE WHERE VENT_ID=p_VENT_ID AND EST=1) * 0.18,
		VENT_TOTAL = (SELECT SUM(DETV_TOTAL) AS VENT_SUBTOTAL FROM TD_VENTA_DETALLE WHERE VENT_ID=p_VENT_ID AND EST=1) +((SELECT SUM(DETV_TOTAL) AS VENT_SUBTOTAL FROM TD_VENTA_DETALLE WHERE VENT_ID=p_VENT_ID AND EST=1) * 0.18)
	WHERE
		VENT_ID = p_VENT_ID;

	-- SQLINES LICENSE FOR EVALUATION USE ONLY
	SELECT 
		VENT_SUBTOTAL,
		VENT_IGV,
		VENT_TOTAL 
	FROM 
		TM_VENTA
	WHERE
		VENT_ID = p_VENT_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_VENTA_03` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_VENTA_03`(  
p_VENT_ID INT,    
p_PAG_ID INT,    
p_CLI_ID INT,    
p_CLI_RUC VARCHAR(20),    
p_CLI_DIRECC VARCHAR(150),    
p_CLI_CORREO VARCHAR(150),    
p_VENT_COMENT VARCHAR(250),    
p_MON_ID INT,
p_DOC_ID INT)
BEGIN
 DECLARE v_ID_REGISTRO INT;    
 DECLARE v_PROD_ID INT;    
 DECLARE v_CANT INT;    
DECLARE NOT_FOUND INT DEFAULT 0;  

 DECLARE CUR CURSOR FOR SELECT DETV_ID FROM TD_VENTA_DETALLE WHERE VENT_ID=p_VENT_ID;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET NOT_FOUND = 1;    
  
 UPDATE TM_VENTA    
 SET    
  PAG_ID = p_PAG_ID,    
  CLI_ID = p_CLI_ID,    
  CLI_RUC = p_CLI_RUC,    
  CLI_DIRECC = p_CLI_DIRECC,    
  CLI_CORREO = p_CLI_CORREO,    
  VENT_COMENT = p_VENT_COMENT,    
  MON_ID = p_MON_ID,
  DOC_ID = p_DOC_ID,
  FECH_CREA = NOW(3),    
  EST = 1    
 WHERE    
  VENT_ID = p_VENT_ID;    
     
 OPEN CUR;    
 FETCH NEXT FROM CUR INTO v_ID_REGISTRO;    
 WHILE NOT_FOUND=0    
  DO    
   -- SQLINES LICENSE FOR EVALUATION USE ONLY
   SELECT PROD_ID INTO v_PROD_ID FROM TD_VENTA_DETALLE WHERE DETV_ID = v_ID_REGISTRO;    
       
   -- SQLINES LICENSE FOR EVALUATION USE ONLY
   SELECT DETV_CANT INTO v_CANT FROM TD_VENTA_DETALLE WHERE DETV_ID = v_ID_REGISTRO;    
    
   UPDATE TM_PRODUCTO    
   SET    
    PROD_STOCK = PROD_STOCK - v_CANT    
   WHERE    
    PROD_ID = v_PROD_ID;    
    
   FETCH NEXT FROM CUR INTO v_ID_REGISTRO;    
  END WHILE;    
 CLOSE CUR;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-11 12:11:09
