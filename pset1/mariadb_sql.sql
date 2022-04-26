-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.6.7-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para uvv
CREATE DATABASE IF NOT EXISTS `uvv` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `uvv`;

-- Copiando estrutura para tabela uvv.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `numero_departamento` int(11) NOT NULL,
  `nome_departamento` varchar(15) NOT NULL,
  `cpf_gerente` char(11) NOT NULL,
  `data_inicio_gerente` date DEFAULT NULL,
  PRIMARY KEY (`numero_departamento`),
  UNIQUE KEY `departamento_idx` (`nome_departamento`),
  KEY `funcionario_departamento_fk` (`cpf_gerente`),
  CONSTRAINT `funcionario_departamento_fk` FOREIGN KEY (`cpf_gerente`) REFERENCES `funcionario` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela com informações do departamento';

-- Copiando dados para a tabela uvv.departamento: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` (`numero_departamento`, `nome_departamento`, `cpf_gerente`, `data_inicio_gerente`) VALUES
	(1, 'Matriz', '88866555576', '1981-06-19'),
	(4, 'Administração', '98765432168', '1995-01-01'),
	(5, 'Pesquisa', '33344555587', '1988-05-22');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;

-- Copiando estrutura para tabela uvv.dependente
CREATE TABLE IF NOT EXISTS `dependente` (
  `cpf_funcionario` char(11) NOT NULL,
  `nome_dependente` varchar(15) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `parentesco` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cpf_funcionario`,`nome_dependente`),
  CONSTRAINT `funcionario_dependente_fk` FOREIGN KEY (`cpf_funcionario`) REFERENCES `funcionario` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabela especificando o dependente do funcionário.';

-- Copiando dados para a tabela uvv.dependente: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` (`cpf_funcionario`, `nome_dependente`, `sexo`, `data_nascimento`, `parentesco`) VALUES
	('12345678966', 'Alicia', 'F', '1988-12-30', 'filha'),
	('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa'),
	('12345678966', 'Michael', 'M', '1988-01-04', 'filho'),
	('33344555587', 'Alicia', 'F', '1986-04-05', 'filha'),
	('33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa'),
	('33344555587', 'Tiago', 'M', '1983-10-25', 'filho'),
	('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido');
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;

-- Copiando estrutura para tabela uvv.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `cpf` char(11) NOT NULL,
  `primeiro_nome` varchar(15) NOT NULL,
  `nome_meio` char(1) DEFAULT NULL,
  `ultimo_nome` varchar(15) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `cpf_supervisor` char(11) DEFAULT NULL,
  `numero_departamento` int(11) NOT NULL,
  PRIMARY KEY (`cpf`),
  KEY `funcionario_funcionario_fk` (`cpf_supervisor`),
  CONSTRAINT `funcionario_funcionario_fk` FOREIGN KEY (`cpf_supervisor`) REFERENCES `funcionario` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela com informações do funcionario.';

-- Copiando dados para a tabela uvv.funcionario: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`cpf`, `primeiro_nome`, `nome_meio`, `ultimo_nome`, `data_nascimento`, `endereco`, `sexo`, `salario`, `cpf_supervisor`, `numero_departamento`) VALUES
	('12345678966', 'joão', 'B', 'Silva', '1965-01-09', 'R. das Flores,751.São Paulo,SP', 'M', 30.00, '33344555587', 5),
	('33344555587', 'Fernando', 'T', 'Wong', '1955-12-08', 'R. da Lapa,34,São Paulo,SP', 'M', 40.00, '88866555576', 5),
	('45345345376', 'Joice', 'A', 'Leite', '1972-07-31', 'Av. Lucas Obes,74,São Paulo,SP', 'F', 25.00, '33344555587', 5),
	('66688444476', 'Ronaldo', 'K', 'Lima', '1962-09-15', 'Rua Rebouças,65,Piracicaba, SP', 'M', 38.00, '33344555587', 5),
	('88866555576', 'Jorge', 'E', 'Brito', '1937-11-10', 'R.do Horto,35,São Paulo,SP', 'M', 55.00, NULL, 1),
	('98765432168', 'Jennifer', 'S', 'Souza', '1941-06-20', 'Av.Art.deLima,54,SantoAndré,SP', 'F', 43.00, '88866555576', 4),
	('98798798733', 'André', 'V', 'Pereira', '1969-03-29', 'RuaTimbira,35,São Paulo,SP', 'M', 25.00, '98765432168', 4),
	('99988777767', 'Alice', 'J', 'Zelaya', '1968-01-19', 'R. Souza Lima,35,Curitiba,PR', 'F', 25.00, '98765432168', 4);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Copiando estrutura para tabela uvv.localizacoes_departamento
CREATE TABLE IF NOT EXISTS `localizacoes_departamento` (
  `numero_departamento` int(11) NOT NULL,
  `local` varchar(15) NOT NULL,
  PRIMARY KEY (`numero_departamento`,`local`),
  CONSTRAINT `departamento_localizacoes_departamento_fk` FOREIGN KEY (`numero_departamento`) REFERENCES `departamento` (`numero_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela informando a localização do departamento.';

-- Copiando dados para a tabela uvv.localizacoes_departamento: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `localizacoes_departamento` DISABLE KEYS */;
INSERT INTO `localizacoes_departamento` (`numero_departamento`, `local`) VALUES
	(1, 'São Paulo'),
	(4, 'Mauá'),
	(5, 'Itu'),
	(5, 'SantoAndré'),
	(5, 'São Paulo');
/*!40000 ALTER TABLE `localizacoes_departamento` ENABLE KEYS */;

-- Copiando estrutura para tabela uvv.projeto
CREATE TABLE IF NOT EXISTS `projeto` (
  `numero_projeto` int(11) NOT NULL,
  `nome_projeto` varchar(15) NOT NULL,
  `local_projeto` varchar(15) DEFAULT NULL,
  `numero_departamento` int(11) NOT NULL,
  PRIMARY KEY (`numero_projeto`),
  UNIQUE KEY `projeto_idx` (`nome_projeto`),
  KEY `departamento_projeto_fk` (`numero_departamento`),
  CONSTRAINT `departamento_projeto_fk` FOREIGN KEY (`numero_departamento`) REFERENCES `departamento` (`numero_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela com informações do projeto.';

-- Copiando dados para a tabela uvv.projeto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` (`numero_projeto`, `nome_projeto`, `local_projeto`, `numero_departamento`) VALUES
	(1, 'ProdutoX', 'SantoAndré', 5),
	(2, 'ProdutoY', 'Itu', 5),
	(3, 'ProdutoZ', 'São Paulo', 5),
	(10, 'Informatização', 'Mauá', 4),
	(20, 'Reorganização', 'São Paulo', 1),
	(30, 'Novosbenefkios', 'Mauá', 4);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;

-- Copiando estrutura para tabela uvv.trabalha_em
CREATE TABLE IF NOT EXISTS `trabalha_em` (
  `cpf_funcionario` char(11) NOT NULL,
  `numero_projeto` int(11) NOT NULL,
  `horas` decimal(3,1) DEFAULT NULL,
  KEY `cpf_funcionario` (`cpf_funcionario`),
  KEY `projeto_trabalha_em_fk` (`numero_projeto`,`cpf_funcionario`) USING BTREE,
  CONSTRAINT `funcionario_trabalha_em_fk` FOREIGN KEY (`cpf_funcionario`) REFERENCES `funcionario` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `projeto_trabalha_em_fk` FOREIGN KEY (`numero_projeto`) REFERENCES `projeto` (`numero_projeto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabela de onde o funcionário trabalha.';

-- Copiando dados para a tabela uvv.trabalha_em: ~31 rows (aproximadamente)
/*!40000 ALTER TABLE `trabalha_em` DISABLE KEYS */;
INSERT INTO `trabalha_em` (`cpf_funcionario`, `numero_projeto`, `horas`) VALUES
	('12345678966', 1, 32.5),
	('12345678966', 2, 7.5),
	('33344555587', 2, 10.0),
	('33344555587', 3, 10.0),
	('33344555587', 10, 10.0),
	('33344555587', 20, 10.0),
	('45345345376', 1, 20.0),
	('45345345376', 2, 20.0),
	('66688444476', 3, 40.0),
	('98765432168', 20, 15.0),
	('98765432168', 30, 20.0),
	('98798798733', 10, 35.0),
	('98798798733', 30, 5.0),
	('99988777767', 10, 10.0),
	('99988777767', 30, 30.0),
	('12345678966', 1, 32.5),
	('12345678966', 2, 7.5),
	('66688444476', 3, 40.0),
	('45345345376', 1, 20.0),
	('45345345376', 2, 20.0),
	('33344555587', 2, 10.0),
	('33344555587', 3, 10.0),
	('33344555587', 10, 10.0),
	('33344555587', 20, 10.0),
	('99988777767', 30, 30.0),
	('99988777767', 10, 10.0),
	('98798798733', 10, 35.0),
	('98798798733', 30, 5.0),
	('98765432168', 30, 20.0),
	('98765432168', 20, 15.0),
	('88866555576', 20, NULL);
/*!40000 ALTER TABLE `trabalha_em` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
