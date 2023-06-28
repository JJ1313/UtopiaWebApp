-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2023 at 03:13 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utopia`
--

-- --------------------------------------------------------

--
-- Table structure for table `autores`
--

CREATE TABLE `autores` (
  `id` int(11) NOT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `idCreador` int(11) DEFAULT NULL,
  `cantModulos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `idCreador`, `cantModulos`) VALUES
(1, 'programacion basica con Python', 2, 5),
(2, 'geometria', 4, 6),
(3, 'teoria del color', 4, 3),
(4, 'Como comer', 2, NULL),
(5, 'Calculo', 2, NULL),
(10, 'Fisica', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `editoriales`
--

CREATE TABLE `editoriales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `idAutor` int(11) NOT NULL,
  `idEditorial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modulos`
--

CREATE TABLE `modulos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `parrafo` text NOT NULL,
  `capituloLibro` int(11) DEFAULT NULL,
  `idCurso` int(11) NOT NULL,
  `idLibro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'aprendiz'),
(2, 'maestro');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `idRol` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) DEFAULT 0,
  `pass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `idRol`, `estado`, `pass`) VALUES
(1, 'Many', 'many@perros.cl', 1, 0, '123'),
(2, 'Alma', 'alma@perros.cl', 2, 0, '123'),
(3, 'Luna', 'luna@perros.cl', 1, 0, '123'),
(4, 'Chica', 'chica@perros.cl', 2, 0, '123'),
(25, 'Maca', 'maca@humano.cl', 1, 0, '123'),
(26, 'Lizzy', 'lizzy@gatos.cl', 1, 0, '123'),
(27, 'Jez', 'jez@caracol.cl', 1, 0, '123'),
(28, 'Mark', 'mark@caracol.cl', 1, 0, '123');

-- --------------------------------------------------------

--
-- Table structure for table `usuario_curso`
--

CREATE TABLE `usuario_curso` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `nivel` int(11) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario_curso`
--

INSERT INTO `usuario_curso` (`id`, `idUsuario`, `idCurso`, `nivel`, `fechaInicio`) VALUES
(1, 1, 1, 1, NULL),
(2, 1, 2, 1, NULL),
(3, 3, 2, 1, NULL),
(4, 3, 3, 1, NULL),
(9, 2, 1, 0, NULL),
(10, 4, 1, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idCreador` (`idCreador`);

--
-- Indexes for table `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idAutor_libro` (`idAutor`),
  ADD KEY `fk_idEditorial_libro` (`idEditorial`);

--
-- Indexes for table `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idCurso_modulo` (`idCurso`),
  ADD KEY `fk_idLibro_modulo` (`idLibro`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`,`nombre`),
  ADD KEY `fk_idRol` (`idRol`);

--
-- Indexes for table `usuario_curso`
--
ALTER TABLE `usuario_curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idUsuario_usuarioCurso` (`idUsuario`),
  ADD KEY `fk_idCurso_usuarioCurso` (`idCurso`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `usuario_curso`
--
ALTER TABLE `usuario_curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_idCreador` FOREIGN KEY (`idCreador`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_idAutor_libro` FOREIGN KEY (`idAutor`) REFERENCES `autores` (`id`),
  ADD CONSTRAINT `fk_idEditorial_libro` FOREIGN KEY (`idEditorial`) REFERENCES `editoriales` (`id`);

--
-- Constraints for table `modulos`
--
ALTER TABLE `modulos`
  ADD CONSTRAINT `fk_idCurso_modulo` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `fk_idLibro_modulo` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`id`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_idRol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`);

--
-- Constraints for table `usuario_curso`
--
ALTER TABLE `usuario_curso`
  ADD CONSTRAINT `fk_idCurso_usuarioCurso` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `fk_idUsuario_usuarioCurso` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
