-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Maio-2021 às 03:03
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gasto_pessoais_terto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cheque`
--

CREATE TABLE `cheque` (
  `id` int(11) NOT NULL,
  `datacompensação` date NOT NULL,
  `telefone` int(11) NOT NULL,
  `numero_do_cheque` int(11) NOT NULL,
  `agencia_do_banco` int(11) NOT NULL,
  `banco` int(11) NOT NULL,
  `nominal` tinyint(1) NOT NULL,
  `cruzado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta`
--

CREATE TABLE `conta` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) COLLATE utf8_general_mysql500_ci NOT NULL,
  `descricao` varchar(250) COLLATE utf8_general_mysql500_ci NOT NULL,
  `saldo` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Extraindo dados da tabela `conta`
--

INSERT INTO `conta` (`id`, `nome`, `descricao`, `saldo`) VALUES
(4, 'Banco do brasil', 'conta poupanÃ§a', 10),
(5, 'bradesco', 'conta corrente', 50),
(6, 'salario', 'abril', 10),
(7, 'Banco do brasil', 'poupanÃ§a', 50),
(8, 'salario', 'abril', 90);

-- --------------------------------------------------------

--
-- Estrutura da tabela `despesa`
--

CREATE TABLE `despesa` (
  `id` int(11) NOT NULL,
  `valor` double NOT NULL,
  `data_recebimento` date NOT NULL,
  `emitente` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `descricao` varchar(250) COLLATE utf8_general_mysql500_ci NOT NULL,
  `pago` varchar(1) COLLATE utf8_general_mysql500_ci NOT NULL,
  `tipodespesa` int(11) NOT NULL,
  `conta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Extraindo dados da tabela `despesa`
--

INSERT INTO `despesa` (`id`, `valor`, `data_recebimento`, `emitente`, `descricao`, `pago`, `tipodespesa`, `conta`) VALUES
(2, 40, '2021-06-22', 'madeireira', '0', '0', 1, 1),
(3, 40, '2021-06-22', 'madeireira', '0', '0', 1, 1),
(4, 40, '2021-06-22', 'madeireira', '0', '0', 1, 1),
(5, 40, '2021-06-22', 'madeireira', '0', '0', 1, 1),
(6, 40, '2021-06-22', 'madeireira', 'poupanÃ§a', '', 1, 1),
(7, 40, '2021-06-22', 'madeireira', 'arroz', '', 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `receita`
--

CREATE TABLE `receita` (
  `id` int(11) NOT NULL,
  `valor` int(250) NOT NULL,
  `emitente` varchar(250) COLLATE utf8_general_mysql500_ci NOT NULL,
  `datarecebimento` date NOT NULL,
  `descricao` varchar(256) COLLATE utf8_general_mysql500_ci NOT NULL,
  `tiporeceita` varchar(256) COLLATE utf8_general_mysql500_ci NOT NULL,
  `conta` varchar(256) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Extraindo dados da tabela `receita`
--

INSERT INTO `receita` (`id`, `valor`, `emitente`, `datarecebimento`, `descricao`, `tiporeceita`, `conta`) VALUES
(1, 20, 'madeireira', '2021-05-03', 'teste', 'salario', 'banco bradesco'),
(4, 40, 'madeireira', '2020-06-22', 'poupanÃ§a', '1', '1'),
(5, 40, 'madeireira', '2020-06-22', 'poupanÃ§a', '1', '1'),
(6, 40, 'madeireira', '2020-06-22', 'poupanÃ§a', '1', '1'),
(7, 40, 'madeireira', '2020-06-22', 'poupanÃ§a', '1', '1'),
(8, 40, 'madeireira', '2020-06-22', 'poupanÃ§a', '1', '1'),
(9, 40, 'casa', '2020-06-22', 'casa', '', '8'),
(10, 40, 'madeireira', '2020-05-16', 'abril', '1', '4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipodespesa`
--

CREATE TABLE `tipodespesa` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `descricao` varchar(250) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Extraindo dados da tabela `tipodespesa`
--

INSERT INTO `tipodespesa` (`id`, `nome`, `descricao`) VALUES
(1, 'salario', '0'),
(2, 'mercado', '0'),
(3, 'salario', 'poupanÃ§a'),
(4, 'salario', 'poupanÃ§a'),
(5, 'salario', 'poupanÃ§a'),
(6, 'salario', 'abril'),
(7, 'salario', 'arroz'),
(8, 'salario', 'abril'),
(10, '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_receita`
--

CREATE TABLE `tipo_receita` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `descricao` varchar(250) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Extraindo dados da tabela `tipo_receita`
--

INSERT INTO `tipo_receita` (`id`, `nome`, `descricao`) VALUES
(1, 'banco', 'compra do celular'),
(3, 'carteira', 'compras supermercado'),
(5, 'Cartão', 'compras da TV'),
(7, 'Cartão', 'compras da TV'),
(8, 'salario', 'rua'),
(9, 'mercado', 'arroz'),
(10, 'salario', 'poupanÃ§a'),
(11, 'salario', 'poupanÃ§a'),
(12, 'Banco do brasil', 'poupanÃ§a'),
(13, 'salario', 'poupanÃ§a'),
(14, 'mercado', 'arroz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cheque`
--
ALTER TABLE `cheque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conta`
--
ALTER TABLE `conta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `despesa`
--
ALTER TABLE `despesa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receita`
--
ALTER TABLE `receita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipodespesa`
--
ALTER TABLE `tipodespesa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_receita`
--
ALTER TABLE `tipo_receita`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cheque`
--
ALTER TABLE `cheque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conta`
--
ALTER TABLE `conta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `despesa`
--
ALTER TABLE `despesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `receita`
--
ALTER TABLE `receita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tipodespesa`
--
ALTER TABLE `tipodespesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tipo_receita`
--
ALTER TABLE `tipo_receita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
