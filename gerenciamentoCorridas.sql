CREATE DATABASE gerenciamentoCorridas;
USE gerenciamentoCorridas;

CREATE TABLE TEMPORADA (
id_Temporada INT NOT NULL,
ano DATE,
qtdeCorridas INT,
CONSTRAINT PK_Temporada PRIMARY KEY (id_Temporada)

);

CREATE TABLE CATEGORIA(
id_Categoria INT NOT NULL,
nome VARCHAR(50)
 CONSTRAINT PK_Categoria PRIMARY KEY(id_Categoria)
CONSTRAINT checknomeCategoria CHECK ( nome IN ('F1', 'F2', 'F3', 'F4', 'Fórmula E','DTM'))

);


CREATE TABLE Funcionario(
codFunc INT NOT NULL,
nome  VARCHAR(50) NOT NULL,
dataNacimento DATE ,
sexo CHAR(1),
 CONSTRAINT PK_Funcionario PRIMARY KEY (codFunc)
);



CREATE TABLE Telefones(
id_telefones INT NOT NULL,	
telefoneCelular VARCHAR(15),
telefoneResidencial VARCHAR(15),
codFunc INT NOT NULL,
CONSTRAINT PK_Telefones PRIMARY KEY(codFunc , id_telefones),
CONSTRAINT FK_TelefonesFuncionario FOREIGN KEY(codFunc) REFERENCES  Funcionario(codFunc)
);




CREATE TABLE Corrida(
codCorrida INT NOT NULL,
nome VARCHAR(50),
duracao INT,
dataInicio DATE,
dataTermino DATE,
continente VARCHAR(10),
pais VARCHAR(50),
cidade VARCHAR(70),
id_Temporada INT NOT NULL,
id_Categoria INT NOT NULL,
CONSTRAINT PK_Corrida PRIMARY KEY (codCorrida),
CONSTRAINT checkcontinente CHECK (continente IN ('África', 'Ásia', 'Europa', 'Oceania', 'América' , 'Antártida')),
CONSTRAINT FK_CorridaTemporada FOREIGN KEY (id_Temporada) REFERENCES Temporada(id_Temporada),
CONSTRAINT FK_CorridaCategoria FOREIGN KEY (id_Categoria) REFERENCES Categoria(id_Categoria)
);

CREATE TABLE Alocacao(
codFunc INT NOT NULL,
codCorrida INT NOT NULL,
qtdeHoras INT,
dataAlocacao DATE,
CONSTRAINT PK_Alocacao PRIMARY KEY (codFunc,codCorrida),
CONSTRAINT FK_ALocacaoFuncionario FOREIGN KEY (codFunc) REFERENCES Funcionario(codFunc) ,
CONSTRAINT FK_AlocacaoCorrida FOREIGN KEY (codCorrida) REFERENCES Corrida(codCorrida)

);

CREATE TABLE Academia(
codAcademia INT NOT NULL,
nome VARCHAR(50),
continente  VARCHAR(10),
pais VARCHAR(50),
cidade VARCHAR(70),
 CONSTRAINT PK_Academia PRIMARY KEY (codAcademia),
CONSTRAINT checkcontin CHECK (continente IN ('África', 'Ásia', 'Europa', 'Oceania', 'América' , 'Antártida'))

);

CREATE TABLE Piloto(
id_Piloto INT NOT NULL,
nome VARCHAR(100),
dataNascimento DATE,
idade INT,
nacionalidade VARCHAR(50) DEFAULT 'DUPLA- NACIONALIDADE',
qtdeCorridas INT,
qtdePodios INT,
posicaoCampeonato INT,
qtdePoles INT,
qtdeCorridasVencidas INT,
qtdeDnfs INT,
pontosCampeonato INT,
codAcademia INT NOT NULL,
CONSTRAINT PK_Piloto PRIMARY KEY(id_Piloto) ,
CONSTRAINT FK_PilotoAcademia FOREIGN KEY (codAcademia) REFERENCES Academia(codAcademia)
);

CREATE TABLE Paticipacao(
id_Piloto INT NOT NULL,
codCorrida INT NOT NULL,
CONSTRAINT PK_Participacao PRIMARY KEY (id_Piloto,codCorrida),
CONSTRAINT FK_ParticipacaoPiloto FOREIGN KEY (id_Piloto) REFERENCES Piloto(id_Piloto),
CONSTRAINT FK_ParticipacaoCorrida FOREIGN KEY (codCorrida) REFERENCES Corrida(codCorrida)


);


CREATE TABLE Carro(
id_Carro INT NOT NULL,
numChassi INT ,
motor VARCHAR(20),
numSerie VARCHAR(20),
potencia INT,
ano DATE,
cor VARCHAR(40),
modelo VARCHAR(30),
CONSTRAINT PK_Carro PRIMARY KEY(id_Carro)
);

CREATE TABLE Associacao(
id_Carro INT NOT NULL,
codCorrida INT NOT NULL,
CONSTRAINT PK_Assosiacao PRIMARY KEY (id_Carro,codCorrida),
CONSTRAINT  Fk_AssociacaoCorrida FOREIGN KEY(codCorrida) REFERENCES Corrida(codCorrida),
CONSTRAINT FK_AssociacaoCarro FOREIGN KEY (id_Carro) REFERENCES Carro(id_Carro)
);


CREATE TABLE Pecas(
id_Carro INT NOT NULL,
id_Peca INT NOT NULL,
valor MONEY,
dataFacricacao DATE,
 Fabricante VARCHAR(40),
 CONSTRAINT PK_Pecas PRIMARY KEY (id_Carro,id_Peca),
 CONSTRAINT FK_PecaCarro FOREIGN KEY (id_Carro) REFERENCES Carro(id_Carro)
);


CREATE TABLE Dirige(
id_Carro INT NOT NULL,
id_Piloto INT NOT NULL,
 CONSTRAINT PK_Dirige PRIMARY KEY (id_Carro,id_Piloto),
CONSTRAINT FK_DirigePiloto FOREIGN KEY(id_Piloto) REFERENCES Piloto(id_Piloto),
CONSTRAINT FK_DirigeCarro FOREIGN KEY (id_Carro) REFERENCES Carro(id_Carro)
);

-- Valores de Temporada
INSERT INTO TEMPORADA VALUES(12,'2013',23);
INSERT INTO TEMPORADA VALUES(1,'2005',22);
INSERT INTO TEMPORADA VALUES(15,'2009',20);
INSERT INTO TEMPORADA VALUES(17,'2008',24);
INSERT INTO TEMPORADA VALUES(3,'1969',10);
INSERT INTO TEMPORADA VALUES(4,'1988',13);
INSERT INTO TEMPORADA VALUES(5,'2021',27);
INSERT INTO TEMPORADA VALUES(7,'2020',22);
INSERT INTO TEMPORADA VALUES(8,'2004',20);
INSERT INTO TEMPORADA VALUES(21,'2019',23);


-- Valores de Categoria

INSERT INTO CATEGORIA VALUES(1,'F1');
INSERT INTO CATEGORIA VALUES(2,'F2');
INSERT INTO CATEGORIA VALUES(3,'F3');
INSERT INTO CATEGORIA VALUES(4,'F4');
INSERT INTO CATEGORIA VALUES(5,'Fórmula E');
INSERT INTO CATEGORIA VALUES(6,'DTM');

-- Valores de funcionário

INSERT INTO Funcionario VALUES (12,'Alexandre Ferreira','20/02/1994','M');
INSERT INTO Funcionario VALUES (4,'Camila Antonia','12/03/1991','F');
INSERT INTO Funcionario VALUES (1,'Alexandra Pinheiro','09/03/1995','F');
INSERT INTO Funcionario VALUES (23,'Henrique Kubtz','04/05/1993','M');
INSERT INTO Funcionario VALUES (76,'Enzo Almeida','06/06/1989','M');
INSERT INTO Funcionario VALUES (55,'Israel Moraes','17/08/1990','M');
INSERT INTO Funcionario VALUES (27,'Giona Carlo','06/12/1992','M');
INSERT INTO Funcionario VALUES (32,'Juliana Poncione','05/01/1996','F');
INSERT INTO Funcionario VALUES (83,'Carla Pietra','29/07/1995','F');
INSERT INTO Funcionario VALUES (56,'Pietro Carlos','03/08/1992','M');

-- Valores de telefones de funcionários

INSERT INTO Telefones VALUES(876,'3194749559','48596079483',12);
INSERT INTO Telefones VALUES(23,'3758093744','374858933',4);
INSERT INTO Telefones VALUES(83,'3759608272','3748959842',1);
INSERT INTO Telefones VALUES(34,'846568984','485894592',23);
INSERT INTO Telefones VALUES(94,'78965258','89652827',76);
INSERT INTO Telefones VALUES(67,'78502893524','85244526',55);
INSERT INTO Telefones VALUES(23,'78965203354','89652034',27);
INSERT INTO Telefones VALUES(45,'789630286','525014569',32);
INSERT INTO Telefones VALUES(99,'895612356','78962520',32);
INSERT INTO Telefones VALUES(51,'89652387','852324589',55);

-- Valores de corrida

INSERT INTO CORRIDA VALUES (6845,'GP - BAKU',2,'12/04/2013','15/04/2013','Ásia','Azerbaijão','Baku',12,1);
INSERT INTO CORRIDA VALUES (2222,'GP - INGLATERRA',4,'16/09/2020','20/09/20','Europa','Inglaterra','Silverstone',7,2);
INSERT INTO CORRIDA VALUES (4444,'GP - Mônaco',4,'10/05/2021','15/05/21','Europa','França','Mônaco',5,1);
INSERT INTO CORRIDA VALUES (7777,'GP - Brasil',4,'07/12/1988','10/12/1988','América','Brasil','Interlagos',4,1);
INSERT INTO CORRIDA VALUES (1011,'GP - INGLATERRA',4,'16/09/2020','20/09/20','Europa','Inglaterra','Silverstone',7,1);
INSERT INTO CORRIDA VALUES (1111,'GP - Mônaco',4,'10/05/2021','15/05/21','Europa','França','Mônaco',5,2);
INSERT INTO CORRIDA VALUES (6666,'GP - Mônaco',4,'07/05/2021','09/05/21','Europa','França','Mônaco',5,5);
INSERT INTO CORRIDA VALUES (9999,'GP - Itália',4,'02/02/2009','09/05/2009','Europa','Itália','Monza',15,6);
INSERT INTO CORRIDA VALUES (8888,'GP - Itália',4,'02/06/2019','09/06/2019','Europa','Itália','Monza',21,4);
INSERT INTO CORRIDA VALUES (9229,'GP - Itália',2,'01/10/2004','08/10/2004','Europa','Itália','Monza',15,3);

-- Valores Alocação
INSERT INTO Alocacao VALUES (12,6845,250,'02/04/2013');
INSERT INTO Alocacao VALUES (12,9999,300,'17/01/2009');
INSERT INTO Alocacao VALUES (23,4444,50,'08/05/2021');
INSERT INTO Alocacao VALUES (76,9229,100,'29/11/2004');
INSERT INTO Alocacao VALUES (1,2222,200,'15/09/2020');
INSERT INTO Alocacao VALUES (55,8888,300,'02/06/2019');
INSERT INTO Alocacao VALUES (83,2222,98,'15/09/2020');
INSERT INTO Alocacao VALUES (55,1111,55,'09/05/2021');
INSERT INTO Alocacao VALUES (76,6845,40,'12/04/2013');


-- Valores Academia


INSERT INTO Academia VALUES (1,'RENAULT','Europa','França','Nice');
INSERT INTO Academia VALUES (2,'FERRARI','Europa','Itália','Maranello');
INSERT INTO Academia VALUES (3,'MERCEDES','Europa','Alemanha','Untertürkheim ');
INSERT INTO Academia VALUES (4,'WILLIAMS','Europa','Inglaterra','Wantage');
INSERT INTO Academia VALUES (5,'McLaren','Europa','Inglaterra','Woking');

-- Valores Piloto

INSERT INTO Piloto VALUES(1,'CARLOS','12/05/1994',27,'espanhol',9,1,16,0,0,4,12,2);
INSERT INTO Piloto VALUES(2,'OSCAR','11/05/2000',20,'australiano',3,2,4,0,2,0,44,2);
INSERT INTO Piloto VALUES(3,'DINO','11/05/2002',18,'italiano',10,1,4,0,2,0,62,5);
INSERT INTO Piloto VALUES(4,'FELIPE','15/04/1999',22,'brasileiro',21,2,4,0,2,0,8,5);
INSERT INTO Piloto VALUES(5,'ENZO','11/05/2001',20,'brasileiro',1,0,0,0,0,0,0,4);
INSERT INTO Piloto VALUES(6,'GIOVINAZI','15/07/1989',32,'italiano',3,2,4,0,2,0,44,4);
INSERT INTO Piloto VALUES(9,'VICTOR','12/03/2001',20,'francês',10,2,4,0,2,4,55,1);
INSERT INTO Piloto VALUES(10,'CAIO','10/04/2001',20,'brasileiro',10,3,1,2,8,0,68,1);
INSERT INTO Piloto VALUES(11,'PAULIN CAÇADÔ','10/04/2000',20,'brasileiro',10,3,1,2,8,0,68,1);
INSERT INTO Piloto VALUES(12,'VICTOR HAMILTON','10/04/2000',20,'brasileiro',10,3,1,2,8,0,68,1);
INSERT INTO Piloto VALUES(13,'GIOVANA SCHUMACHER','10/04/1990',41,'austriaco',10,3,1,2,8,0,68,1);


-- Valores Participação
INSERT INTO Paticipacao VALUES(1,6845);
INSERT INTO Paticipacao VALUES(3,1111);
INSERT INTO Paticipacao VALUES(10,8888);
INSERT INTO Paticipacao VALUES(9,8888);
INSERT INTO Paticipacao VALUES(6,2222);
INSERT INTO Paticipacao VALUES(2,4444);
INSERT INTO Paticipacao VALUES(4,8888);
INSERT INTO Paticipacao VALUES(11,4444);
INSERT INTO Paticipacao VALUES(12,4444);
INSERT INTO Paticipacao VALUES(13,2222);
INSERT INTO Paticipacao VALUES(3,1011);

-- Valores Carro
INSERT INTO Carro VALUES(1,123,'V8','233414',2000,'2012','VERMELHO','VENUS');
INSERT INTO Carro VALUES(2,124,'V8','223414',2000,'2012','VERMELHO','VENUS');
INSERT INTO Carro VALUES(3,125,'V10','2245414',3000,'2013','LILAS','A9');
INSERT INTO Carro VALUES(4,126,'V10','22455414',3000,'2013','LILAS','A9');
INSERT INTO Carro VALUES(5,127,'V10','22334414',3000,'2013','LILAS','A9');
INSERT INTO Carro VALUES(6,128,'V12','2233452414',4000,'2015','VERDE','C22');
INSERT INTO Carro VALUES(7,129,'V12','223345414',4000,'2015','VERDE','C22');
INSERT INTO Carro VALUES(8,130,'V12','223345414',4000,'2015','VERDE','C22');

-- Valores Associacao
INSERT INTO Associacao VALUES(1,6845);
INSERT INTO Associacao VALUES(2,6845);
INSERT INTO Associacao VALUES(3,1111);
INSERT INTO Associacao VALUES(4,1111);
INSERT INTO Associacao VALUES(5,1111);
INSERT INTO Associacao VALUES(6,8888);
INSERT INTO Associacao VALUES(7,8888);
INSERT INTO Associacao VALUES(8,2222);
INSERT INTO Associacao VALUES(2,4444);
INSERT INTO Associacao VALUES(4,2222);

-- Valores Peças

INSERT INTO Pecas VALUES(1,22,2345,'04/05/2009','HTW');
INSERT INTO Pecas VALUES(2,223,23450,'02/03/2008','HTW');
INSERT INTO Pecas VALUES(3,2245,29345,'01/05/2010','HTW');
INSERT INTO Pecas VALUES(4,22245,25345,'22/05/2010','NVZ');
INSERT INTO Pecas VALUES(5,22245,2445,'29/01/2010','ATM');
INSERT INTO Pecas VALUES(6,22472,23545,'30/09/2012','JPWP');
INSERT INTO Pecas VALUES(7,2246,1345,'14/03/2012','JCP');
INSERT INTO Pecas VALUES(8,22466,2300,'17/04/2012','KNR');


-- Valores Dirige

INSERT INTO Dirige VALUES (1,2);
INSERT INTO Dirige VALUES (2,3);
INSERT INTO Dirige VALUES (3,5);
INSERT INTO Dirige VALUES (4,6);
INSERT INTO Dirige VALUES (5,10);
INSERT INTO Dirige VALUES (6,9);
INSERT INTO Dirige VALUES (7,4);
INSERT INTO Dirige VALUES (8,1);


-- 1) Indice 
CREATE INDEX IX_nome ON Funcionario (nome,codFunc);

-- 2) Índice 
     CREATE INDEX IX_nome ON Piloto (nome);

	
-- 1) VISÃO 1
-- Crie uma visão que demonstre quais pilotos com idade  menor ou igual a 20, possuem pelo menos uma vitória.

CREATE VIEW  PilotoVitorias AS
SELECT  P.nome AS Piloto , P.idade AS Idade
FROM Piloto P
WHERE P.idade <=20 AND p.qtdeCorridasVencidas >=1;

SELECT * FROM PilotoVitorias; -- vizualização da visão

-- 2) VISÃO 2
-- Crie uma visão que mostre as corridas de 2021 , suas datas de  ínicio , a cidade  e as categorias que correrão ou  já correram .

CREATE VIEW  Corridas2021 AS
SELECT C.nome AS Corrida , C.dataInicio As Início , C.cidade  AS Cidade, CA.nome AS Categoria
FROM Corrida C
INNER JOIN  CATEGORIA CA ON  CA.id_Categoria = C.id_Categoria
WHERE YEAR(C.dataInicio) = '2021';

SELECT * FROM Corridas2021; -- vizualização da visão



-- SELECT´S

-- 1)junção de 3 ou mais tabelas, com ORDER BY;

--   Selecione o nome  do piloto , a academia a qual ele pertence e o número do chassi do carro que o mesmo dirige.

SELECT  P.nome AS Piloto , A.nome  AS Academia , C.numChassi AS Chassi
FROM PILOTO P
INNER JOIN Academia A ON A.codAcademia = P.codAcademia
INNER JOIN Dirige D ON D.id_Piloto = P.id_Piloto
INNER JOIN Carro C ON C.id_Carro = D.id_Carro
ORDER BY p.nome;



--2)junção de 3 ou mais tabelas, com ORDER BYe filtros na cláusula WHERE;

-- Selecione o nome do piloto, sua idade, nome da academia a qual ele pertence e que já participaram de uma corrida em mônaco

select p.nome as Piloto, p.idade as Idade ,a.nome as academia
from Piloto p
inner join Academia a on a.codAcademia = p.codAcademia
inner join Paticipacao part on part.id_Piloto = p.id_Piloto
inner join Corrida c on c.codCorrida = part.codCorrida
where p.idade < 23 and c.cidade = 'Mônaco'
order by p.idade;


--3)junção de 3 ou mais tabelas, usando os operadores LIKE e BETWEEN;

-- Selecione o nome do piloto, nome da academia a qual ele pertence, nome da corrida de todos os participantes que realizaram 
-- uma corrida no ano de 2020 e que tenha  no nome

select p.nome as Piloto, p.idade as Idade ,a.nome as academia
from Piloto p
inner join Academia a on a.codAcademia = p.codAcademia
inner join Paticipacao part on part.id_Piloto = p.id_Piloto
inner join Corrida c on c.codCorrida = part.codCorrida
where c.dataInicio between '2020-01-01' and '2020-12-30' and p.nome like '%GIO%';

--4)junção de 3 ou mais tabelas, usando os operadores IN/NOT IN e IS NULL/IS NOT NULL;

-- Selecione o nome do piloto e nome da fabricante dos carro que utilizam peças das fabricantes HTM, NVZ e ATM

select p.nome as Piloto , Peca.Fabricante as Fabricante
from Piloto p
inner join Dirige d on d.id_Piloto = p.id_Piloto
inner join Carro car on car.id_Carro = d.id_Carro
inner join Pecas peca on peca.id_Carro = car.id_Carro
where peca.Fabricante in ('HTM','NVZ','ATM');

--5)junção de 2 ou mais tabelas com GROUP BY, sem HAVING, usando uma função agregada qualquer (MIN, MAX, AVG, SUM, COUNT). Use ORDER BY;

-- Selecione a quantidade de pilotos que cada academia possui.

select a.nome as Academia, COUNT(p.id_Piloto) AS QTDE_PILOTO
from Piloto p
inner join Academia a on a.codAcademia = p.codAcademia
group by a.nome 
order by QTDE_PILOTO DESC;

--6)junção de 2 ou mais tabelas com GROUP BY e HAVING, usando uma função agregada qualquer (MIN, MAX, AVG, SUM, COUNT);

-- Selecione a quantidade de pilotos que cada academia possui e a quantidade total é menor que 5.

select a.nome as Academia, COUNT(p.id_Piloto) AS QTDE_PILOTO
from Piloto p
inner join Academia a on a.codAcademia = p.codAcademia
group by a.nome 
having COUNT(p.id_Piloto) < 5
order by QTDE_PILOTO DESC

--7)subselect sem correlação;

-- Selecione o nome dos pilotos que são de uma academia na inglaterra e participaram de corrida na inglaterra

select p.nome AS Piloto, a.nome AS Academia 
from Piloto p
inner join Academia a on a.codAcademia = p.codAcademia
inner join Paticipacao part on part.id_Piloto = p.id_Piloto
inner join Corrida c on c.codCorrida = part.codCorrida
where c.codCorrida in (select c.codCorrida 
					from Corrida c
					where c.pais = 'inglaterra');

--8)subselect com correlação;

-- Selecione todas as peças que possuem valor maior que a media de preço da sua fabricante

select p.id_Peca as PecaID, p.valor 
from Pecas p 
where p.valor > (select AVG(p1.valor) 
					from Pecas p1 
					where p.Fabricante = p1.Fabricante
					group by p1.Fabricante);

--9)subselect com EXISTS;

-- Selecione o modelo do carro que possui peças com valor maior de 23.000,00

select c.modelo as Modelo 
from Carro c 
where exists (select p.valor
				from Pecas p
				where p.id_Carro = c.id_Carro and p.valor > 23000.00);

--10)junção de 2 ou mais tabelas com GROUP BY, HAVING e ALL.

-- Selecione o codigo do funcionario que tem a maior quantidade de horas alocadas

select f.codFunc AS Codigo, sum(a.qtdeHoras) AS QTDE
from Funcionario f 
inner join Alocacao a ON a.codFunc = f.codFunc
group by f.codFunc
having sum(a.qtdeHoras) >= ALL (select SUM(a.qtdeHoras) 
								from Funcionario f 
								inner join Alocacao a ON a.codFunc = f.codFunc
								group by f.codFunc);
