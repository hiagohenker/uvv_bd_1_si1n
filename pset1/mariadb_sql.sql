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

-- Copiando dados para a tabela uvv.departamento: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` (`numero_departamento`, `nome_departamento`, `cpf_gerente`, `data_inicio_gerente`) VALUES
	(1, 'Matriz', '88866555576', '1981-06-19'),
	(4, 'Administração', '98765432168', '1995-01-01'),
	(5, 'Pesquisa', '33344555587', '1988-05-22');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;

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

-- Copiando dados para a tabela uvv.localizacoes_departamento: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `localizacoes_departamento` DISABLE KEYS */;
INSERT INTO `localizacoes_departamento` (`numero_departamento`, `local`) VALUES
	(1, 'São Paulo'),
	(4, 'Mauá'),
	(5, 'Itu'),
	(5, 'SantoAndré'),
	(5, 'São Paulo');
/*!40000 ALTER TABLE `localizacoes_departamento` ENABLE KEYS */;

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

-- Copiando dados para a tabela uvv.trabalha_em: ~15 rows (aproximadamente)
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
