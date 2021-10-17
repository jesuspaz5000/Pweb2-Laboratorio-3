-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2021 a las 04:35:09
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pw2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agency`
--

CREATE TABLE `agency` (
  `Agency_code` int(8) NOT NULL COMMENT 'Agency code',
  `Company_code` int(8) NOT NULL COMMENT 'Company code',
  `Name` varchar(30) DEFAULT NULL COMMENT 'Name',
  `Address_Code` int(8) DEFAULT NULL COMMENT 'Address Code',
  `Staff_amount` int(11) DEFAULT NULL COMMENT 'Staff amount',
  `Agency_registration_status` tinyint(1) NOT NULL COMMENT 'Agency registration status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE `company` (
  `Company_id` int(8) NOT NULL COMMENT 'Codigo de la empresa',
  `Company_Name` varchar(30) DEFAULT NULL COMMENT 'Nombre de la empresa',
  `Company_Adress_Code` int(8) DEFAULT NULL COMMENT 'Numero de direccion de la empresa',
  `Company_Transport_Number` int(8) DEFAULT NULL COMMENT 'Cantidad de transportes de la empresa',
  `Company_Mail` varchar(30) DEFAULT NULL COMMENT 'Correo de la empresa',
  `Company_Web_Site` varchar(30) DEFAULT NULL COMMENT 'Pagina web de la empresa',
  `Company_Registration_Status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado de registro de la empresa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`Company_id`, `Company_Name`, `Company_Adress_Code`, `Company_Transport_Number`, `Company_Mail`, `Company_Web_Site`, `Company_Registration_Status`) VALUES
(4, 'CompanyT', 1, 50, 'CompanyT@gmail.com', 'CompanyT.com', 1),
(5, 'Cambio de nombre', 1, 30, 'Cambiodenombre@gmail.com', 'Cambiodenombre.com', 0),
(7, 'Empresa 4', 1, 50, 'garcia@gmail.com', 'garcia.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `driver`
--

CREATE TABLE `driver` (
  `Code_Driver` int(8) NOT NULL COMMENT 'Codigo del conductor',
  `Company_Code` int(8) NOT NULL COMMENT 'Codigo de la empresa',
  `Driver_DNI` int(8) NOT NULL COMMENT 'Dni del conductor',
  `Surnames` varchar(30) DEFAULT NULL COMMENT 'Apellidos del conductor',
  `Names` varchar(30) DEFAULT NULL COMMENT 'Nombres del conductor',
  `Age` int(3) DEFAULT NULL COMMENT 'Años del conductor',
  `Sex` tinyint(1) DEFAULT NULL COMMENT 'Sexo del conductor',
  `Telephone` varchar(13) DEFAULT NULL COMMENT 'Correo del conductor',
  `Address` varchar(30) DEFAULT NULL COMMENT 'Direccion del conductor',
  `Email` varchar(30) DEFAULT NULL COMMENT 'Email del conductor',
  `Driver_registration_status` tinyint(1) DEFAULT 1 COMMENT 'Estado de registro de conductor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `location`
--

CREATE TABLE `location` (
  `Direction_Code` int(8) NOT NULL COMMENT 'Codigo de la direccion',
  `Direction_Country` varchar(30) NOT NULL COMMENT 'Codigo del pais',
  `Direction_Departament` varchar(30) NOT NULL COMMENT 'Codigo del departamento',
  `Direction_Province` varchar(30) NOT NULL COMMENT 'Codigo de la provincia',
  `Direction_District` varchar(30) NOT NULL COMMENT 'Codigo del distrito',
  `Direction_Number` int(8) NOT NULL COMMENT 'Numero de la direccion',
  `Direction_Registration_Status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado de registro de la direccion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `location`
--

INSERT INTO `location` (`Direction_Code`, `Direction_Country`, `Direction_Departament`, `Direction_Province`, `Direction_District`, `Direction_Number`, `Direction_Registration_Status`) VALUES
(1, 'peru', 'a', 'a', 'a', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `passenger`
--

CREATE TABLE `passenger` (
  `Passenger_DNI` int(8) NOT NULL COMMENT 'DNI of Passenger',
  `Passenger_Surnames` varchar(30) DEFAULT NULL COMMENT 'Surnames',
  `Passenger_Names` varchar(30) NOT NULL COMMENT 'Name',
  `Passenger_Agent` int(11) NOT NULL COMMENT 'Age',
  `Passenger_Sex` tinyint(1) DEFAULT NULL COMMENT 'Sex',
  `Passenger_Registration_Status` tinyint(1) NOT NULL COMMENT 'Passenger registration status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registration`
--

CREATE TABLE `registration` (
  `Registration_code` int(8) NOT NULL COMMENT 'Codigo del registro',
  `Driver_code` int(8) NOT NULL COMMENT 'Codigo del conductor',
  `Ticket_code` int(8) NOT NULL COMMENT 'Dni de la boleta',
  `Registration_status` tinyint(1) DEFAULT 1 COMMENT 'Estado de registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registration_status`
--

CREATE TABLE `registration_status` (
  `Registration_status_code` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Codigo del estado de registro',
  `Registration_state_name` varchar(30) DEFAULT NULL COMMENT 'Codigo del nombre del estado de registro',
  `Registration_status_status` tinyint(1) DEFAULT 1 COMMENT 'Estado del estado de registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `route`
--

CREATE TABLE `route` (
  `Rout_Code` int(8) NOT NULL COMMENT 'Codigo de la ruta',
  `Rout_Code_Direction_Origin` int(8) DEFAULT NULL COMMENT 'Codigo de la direccion de origen',
  `Rout_Code_Direction_Destiny` int(8) DEFAULT NULL COMMENT 'Codigo de la direccion de destino',
  `Rout_Distance` int(8) DEFAULT NULL COMMENT 'Distancia de la ruta',
  `Rout_Estimated_Time` time(6) DEFAULT NULL COMMENT 'Tiempo estimado de la ruta',
  `Rout_Places_of_Passage` varchar(60) DEFAULT NULL COMMENT 'Lugares de paso de la ruta',
  `Rout_Registration_Status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado de registro de la ruta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_manager`
--

CREATE TABLE `sales_manager` (
  `Agent_Code` int(8) NOT NULL COMMENT 'Codigo del agente de ventas',
  `Agency_Code` int(8) NOT NULL COMMENT 'Codigo de la agencia',
  `Agent_NID` int(8) DEFAULT NULL COMMENT 'Numero de dni del agente de ventas',
  `Agent_Surnames` varchar(30) DEFAULT NULL COMMENT 'Apellidos del gerente de ventas',
  `Agent_Names` varchar(30) DEFAULT NULL COMMENT 'Nombres del gerente de ventas',
  `Agent_Telephone` int(9) DEFAULT NULL COMMENT 'Numero de telefono del agente de ventas',
  `Agent_Email` varchar(30) DEFAULT NULL COMMENT 'Correo del agente de ventas',
  `Agent_Address` varchar(30) DEFAULT NULL COMMENT 'Direccion del agente de ventas',
  `Manager_Registration_Status` tinyint(1) DEFAULT 1 COMMENT 'Estado de registro de gerente de ventas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seating`
--

CREATE TABLE `seating` (
  `Seating_Code` int(8) NOT NULL COMMENT 'Código del asiento',
  `Seating_Code_Transport` int(8) NOT NULL COMMENT 'Código del transporte al que pertenece',
  `Seating_Local` varchar(30) NOT NULL COMMENT 'Ubicación del asiento',
  `Seating_Registration_Status` tinyint(1) NOT NULL COMMENT 'Estado del registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `Ticket_Code` int(8) NOT NULL COMMENT 'Ticket Code',
  `Ticket_Passenger_DNI` int(8) NOT NULL COMMENT 'Passenger Code',
  `Ticket_Travel_Code` int(8) NOT NULL COMMENT 'Travel Code',
  `Ticket_Sales_Manager_Code` int(8) NOT NULL COMMENT 'Sales manager code',
  `Ticket_Seating_Code` int(8) NOT NULL COMMENT 'Seat code',
  `Ticket_Application_Date` date NOT NULL COMMENT 'Application date',
  `Ticket_Date_Issue` date NOT NULL COMMENT 'Date of issue',
  `Ticket_Price` int(11) NOT NULL COMMENT 'Price',
  `Ticket_Registration_Status` tinyint(1) NOT NULL COMMENT 'Ticket registration status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transport`
--

CREATE TABLE `transport` (
  `Transport_Code` int(8) NOT NULL COMMENT 'Código del transporte',
  `Transport_Code_Company` int(8) NOT NULL COMMENT 'Código de la empresa a la que pertenece el transporte',
  `Transport_Type` varchar(30) DEFAULT NULL COMMENT 'Tipo de transporte que es',
  `Transport_Capacity` int(3) DEFAULT NULL COMMENT 'Capacidad de pasajeros que puede llevar',
  `Registration_Status` tinyint(1) NOT NULL COMMENT 'Estado de registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `travel_schedules`
--

CREATE TABLE `travel_schedules` (
  `TravelSchedules_Code` int(8) NOT NULL COMMENT 'Código del de viaje',
  `Travel_Schedules_Date` date DEFAULT NULL COMMENT 'Año, mes y día del viaje',
  `Travel_Schedules_Hour` time DEFAULT NULL COMMENT 'Hora del viaje',
  `Travel_Schedules_Transport_Code` int(8) NOT NULL COMMENT 'Código del transporte que hará el viaje',
  `Travel_Schedules_Code_Route` int(8) NOT NULL COMMENT 'Código de la ruta que tomara para el viaje',
  `Travel_Schedules_Registration_Status` tinyint(1) NOT NULL COMMENT 'Estado del registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`Agency_code`),
  ADD KEY `Address_Code` (`Address_Code`),
  ADD KEY `Company_code` (`Company_code`),
  ADD KEY `Agency_registration_status` (`Agency_registration_status`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`Company_id`),
  ADD KEY `Company_Adress_Code` (`Company_Adress_Code`);

--
-- Indices de la tabla `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`Code_Driver`),
  ADD KEY `Company_Code` (`Company_Code`);

--
-- Indices de la tabla `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Direction_Code`);

--
-- Indices de la tabla `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`Passenger_DNI`);

--
-- Indices de la tabla `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`Registration_code`),
  ADD KEY `Driver_code` (`Driver_code`),
  ADD KEY `Ticket_code` (`Ticket_code`);

--
-- Indices de la tabla `registration_status`
--
ALTER TABLE `registration_status`
  ADD PRIMARY KEY (`Registration_status_code`);

--
-- Indices de la tabla `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`Rout_Code`),
  ADD KEY `Rout_Code_Direction_Origin` (`Rout_Code_Direction_Origin`),
  ADD KEY `Rout_Code_Direction_Destiny` (`Rout_Code_Direction_Destiny`);

--
-- Indices de la tabla `sales_manager`
--
ALTER TABLE `sales_manager`
  ADD PRIMARY KEY (`Agent_Code`),
  ADD KEY `Agency_Code` (`Agency_Code`);

--
-- Indices de la tabla `seating`
--
ALTER TABLE `seating`
  ADD PRIMARY KEY (`Seating_Code`),
  ADD KEY `Seating_Code_Transport` (`Seating_Code_Transport`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Ticket_Code`),
  ADD KEY `Ticket_Passenger_DNI` (`Ticket_Passenger_DNI`),
  ADD KEY `Ticket_Travel_Code` (`Ticket_Travel_Code`),
  ADD KEY `Ticket_Sales_Manager_Code` (`Ticket_Sales_Manager_Code`),
  ADD KEY `Ticket_Seating_Code` (`Ticket_Seating_Code`);

--
-- Indices de la tabla `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`Transport_Code`),
  ADD KEY `Transport_Code_Company` (`Transport_Code_Company`);

--
-- Indices de la tabla `travel_schedules`
--
ALTER TABLE `travel_schedules`
  ADD PRIMARY KEY (`TravelSchedules_Code`),
  ADD KEY `Travel_Schedules_Transport_Code` (`Travel_Schedules_Transport_Code`),
  ADD KEY `Travel_Schedules_Code_Route` (`Travel_Schedules_Code_Route`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agency`
--
ALTER TABLE `agency`
  MODIFY `Agency_code` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Agency code';

--
-- AUTO_INCREMENT de la tabla `company`
--
ALTER TABLE `company`
  MODIFY `Company_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la empresa', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `driver`
--
ALTER TABLE `driver`
  MODIFY `Code_Driver` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del conductor';

--
-- AUTO_INCREMENT de la tabla `location`
--
ALTER TABLE `location`
  MODIFY `Direction_Code` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la direccion', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `passenger`
--
ALTER TABLE `passenger`
  MODIFY `Passenger_DNI` int(8) NOT NULL AUTO_INCREMENT COMMENT 'DNI of Passenger';

--
-- AUTO_INCREMENT de la tabla `registration`
--
ALTER TABLE `registration`
  MODIFY `Registration_code` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del registro';

--
-- AUTO_INCREMENT de la tabla `route`
--
ALTER TABLE `route`
  MODIFY `Rout_Code` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la ruta';

--
-- AUTO_INCREMENT de la tabla `sales_manager`
--
ALTER TABLE `sales_manager`
  MODIFY `Agent_Code` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del agente de ventas';

--
-- AUTO_INCREMENT de la tabla `seating`
--
ALTER TABLE `seating`
  MODIFY `Seating_Code` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Código del asiento';

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `Ticket_Code` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Ticket Code';

--
-- AUTO_INCREMENT de la tabla `transport`
--
ALTER TABLE `transport`
  MODIFY `Transport_Code` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Código del transporte';

--
-- AUTO_INCREMENT de la tabla `travel_schedules`
--
ALTER TABLE `travel_schedules`
  MODIFY `TravelSchedules_Code` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Código del de viaje';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_2` FOREIGN KEY (`Address_Code`) REFERENCES `location` (`Direction_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agency_ibfk_3` FOREIGN KEY (`Company_code`) REFERENCES `company` (`Company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agency_ibfk_4` FOREIGN KEY (`Agency_registration_status`) REFERENCES `registration_status` (`Registration_status_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`Company_Adress_Code`) REFERENCES `location` (`Direction_Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`Company_Code`) REFERENCES `company` (`Company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`Ticket_code`) REFERENCES `ticket` (`Ticket_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`Driver_code`) REFERENCES `driver` (`Code_Driver`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`Rout_Code_Direction_Destiny`) REFERENCES `location` (`Direction_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `route_ibfk_2` FOREIGN KEY (`Rout_Code_Direction_Origin`) REFERENCES `location` (`Direction_Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sales_manager`
--
ALTER TABLE `sales_manager`
  ADD CONSTRAINT `sales_manager_ibfk_1` FOREIGN KEY (`Agency_Code`) REFERENCES `agency` (`Agency_code`);

--
-- Filtros para la tabla `seating`
--
ALTER TABLE `seating`
  ADD CONSTRAINT `seating_ibfk_1` FOREIGN KEY (`Seating_Code_Transport`) REFERENCES `transport` (`Transport_Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Ticket_Passenger_DNI`) REFERENCES `passenger` (`Passenger_DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Ticket_Seating_Code`) REFERENCES `seating` (`Seating_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`Ticket_Travel_Code`) REFERENCES `travel_schedules` (`TravelSchedules_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`Ticket_Sales_Manager_Code`) REFERENCES `sales_manager` (`Agent_Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `transport_ibfk_1` FOREIGN KEY (`Transport_Code_Company`) REFERENCES `company` (`Company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `travel_schedules`
--
ALTER TABLE `travel_schedules`
  ADD CONSTRAINT `travel_schedules_ibfk_1` FOREIGN KEY (`Travel_Schedules_Transport_Code`) REFERENCES `transport` (`Transport_Code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
