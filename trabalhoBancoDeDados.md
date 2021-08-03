# TRABALHO  DE  BANCO DE DADOS

### A montadora Ferrari possui atuação nas categorias de corrida F1, F2, F3, F4, Fórmula E e DTM. 
Como ocorrem diversas corridas em um mesmo final de semana e em diferentes continentes, com 
possiblidade de mais de uma corrida por categoria. Essa utiliza o RMS(Race Management System) 
para realizar o gerenciamento dos recursos de cada GP.

* A fabricante possui funcionários que são identificados por código e descritos por nome, data 
de nascimento, idade, sexo, e-mail, telefone celular, telefone residencial, salário e endereço. 
Um funcionário pode ser engenheiro, assistente ou auxiliar. Sendo o engenheiro minuciado 
por seu tipo de atuação e o assistente pelo seu grau.

* Vários funcionários estão alocados no mínimo a uma corrida e essa é identificada por seu 
código e descrita por categoria, data de início, data de término, duração, nome e localização. 
São também atribuídos a quantidade de horas alocadas por funcionário e a data da alocação.
* Para cada corrida são alocados no mínimo 1 um carro, o qual é dito por seu identificador, cor, 
motor, quantidade de peças, ano, modelo, potência, número de série e número de chassi único. 
O mesmo é composto por peças e possui identificador, data de fabricação, valor e fabricante.

* Um carro pode ser pilotado por 1 ou mais pilotos durante uma corrida, e o piloto não é 
considerado funcionário, uma vez que está associado a uma academia de pilotos identificada 
por código, nome e localização. Uma academia possui no mínimo um piloto em associação a 
montadora para a corrida.
 
* O mesmo possui contrato anual com a academia e pode ser minuciado por identificador de 
piloto, data de nascimento, nome, idade, nacionalidade, quantidade de corridas realizadas, 
quantidade de pódios, quantidade de pole positions, quantidade de corridas vencidas, 
quantidades de dnf´s , pontos marcados e posição no campeonato. Esse também é atrelado a 
no mínimo uma corrida e possui registro a mesma