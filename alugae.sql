-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/06/2025 às 03:32
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `alugae`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carro`
--

CREATE TABLE `carro` (
  `id` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `ano` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `status` enum('DISPONIVEL','INDISPONIVEL') NOT NULL DEFAULT 'DISPONIVEL',
  `precoDiaria` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carro`
--

INSERT INTO `carro` (`id`, `modelo`, `marca`, `ano`, `placa`, `status`, `precoDiaria`) VALUES
(2, 'Onix ', 'Chevrolet', 2024, 'DEF-5678', 'INDISPONIVEL', 130.00),
(3, 'Corolla', 'Toyota', 2021, 'GHI-1234', 'INDISPONIVEL', 180.00),
(4, 'HB20', 'Hyundai', 2019, 'JKL-5678', 'INDISPONIVEL', 130.00),
(5, 'Ka', 'Ford', 2018, 'MNO-9012', 'INDISPONIVEL', 100.00),
(6, 'Cruze', 'Chevrolet', 2020, 'PQR-3456', 'DISPONIVEL', 160.00),
(7, 'Argo', 'Fiat', 2022, 'STU-7890', 'DISPONIVEL', 110.00),
(8, 'Renegade', 'Jeep', 2021, 'VWX-2345', 'DISPONIVEL', 190.00),
(9, 'Gol', 'Volkswagen', 2017, 'YZA-6789', 'DISPONIVEL', 95.00),
(10, 'Compass', 'Jeep', 2023, 'BCD-1122', 'DISPONIVEL', 210.00),
(11, 'Fit', 'Honda', 2019, 'EFG-3344', 'DISPONIVEL', 140.00),
(13, 'L200 Triton', 'Mitsubishi', 2025, 'ACDE-098', 'DISPONIVEL', 370.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cpf` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`, `endereco`, `telefone`, `cpf`) VALUES
(1, 'João da Silva', 'joao@email.com', 'Rua A, 123', '11999999999', '123.456.789-00'),
(2, 'Maria Oliveira', 'maria@email.com', 'Av. B, 456', '11888888888', '987.654.321-00'),
(6, 'teste maria', 'teste', 'teste', 'teste', 'teste'),
(9, 'joao', 'josejoje@oiefnisnf', 'Rua da gota', '11239809812', '12345678900');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL DEFAULT 'Alugae Locadora',
  `email` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `senha` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `empresa`
--

INSERT INTO `empresa` (`id`, `nome`, `email`, `endereco`, `cnpj`, `senha`) VALUES
(1, 'Alugae Locadora', 'contato@alugae.com.br', 'Rua das Locações, 123', '12.345.678/0001-90', 'e7d80ffeefa212b7c5c55700e4f7193e');

-- --------------------------------------------------------

--
-- Estrutura para tabela `locacao`
--

CREATE TABLE `locacao` (
  `id` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idCarro` int(11) NOT NULL,
  `dataInicio` datetime NOT NULL,
  `dataFim` datetime NOT NULL,
  `valorTotal` decimal(10,2) NOT NULL,
  `status` enum('ATIVA','FINALIZADA','CANCELADA') NOT NULL DEFAULT 'ATIVA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `locacao`
--

INSERT INTO `locacao` (`id`, `idCliente`, `idCarro`, `dataInicio`, `dataFim`, `valorTotal`, `status`) VALUES
(2, 2, 2, '2025-05-10 00:00:00', '2025-05-12 00:00:00', 240.00, 'FINALIZADA'),
(3, 1, 4, '2025-05-27 00:00:00', '2025-05-30 00:00:00', 500.00, 'ATIVA'),
(10, 1, 3, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 450.00, 'ATIVA'),
(11, 9, 5, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 450.00, 'ATIVA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL,
  `IdLocacao` int(11) DEFAULT NULL,
  `valorTotal` decimal(10,2) NOT NULL,
  `TipoPagamento` enum('CARTAO','BOLETO','PIX') NOT NULL DEFAULT 'BOLETO',
  `statusPagamento` enum('PENDENTE','PAGO','CANCELADO') NOT NULL DEFAULT 'PENDENTE',
  `data_pagamento` datetime DEFAULT NULL COMMENT 'Data e hora do pagamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `IdLocacao`, `valorTotal`, `TipoPagamento`, `statusPagamento`, `data_pagamento`) VALUES
(3, 3, 1243.00, 'CARTAO', 'PAGO', '2025-06-01 00:00:00'),
(4, 10, 450.00, 'CARTAO', 'PAGO', '2025-06-16 00:00:00'),
(6, 11, 450.00, 'PIX', 'PENDENTE', '2025-06-02 00:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices de tabela `locacao`
--
ALTER TABLE `locacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idCarro` (`idCarro`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carro`
--
ALTER TABLE `carro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `locacao`
--
ALTER TABLE `locacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `locacao`
--
ALTER TABLE `locacao`
  ADD CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `locacao_ibfk_2` FOREIGN KEY (`idCarro`) REFERENCES `carro` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
