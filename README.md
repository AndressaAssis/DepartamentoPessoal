# PROJETO FINAL - LÓGICA DE PROGRAMAÇÃO

## REALIZADORES DO PROJETO: 
Andressa Assis, Gabriel Berger, Brenda Chaves, Eduarda Goulart, Alex Almeida e Athirson.

## REQUISITOS DO PROGRAMA DE DEPARTAMENTO PESSOAL EM PORTUGOL 

1. CADASTRO DE COLABORADORES.
Descrição: Os alunos devem implementar uma funcionalidade que permita o cadastro de colaboradores. As informações de cada colaborador serão armazenadas em vetores.

Requisitos:
  Utilizar vetores para armazenar os seguintes dados dos colaboradores: nome, CPF e salário.
  Implementar uma função que permita ao usuário cadastrar novos colaboradores até o limite definido (100 colaboradores).
  Verificar se o limite de colaboradores foi atingido antes de permitir novos cadastros.
  Permitir que os dados de um colaborador já cadastrado sejam editados.

2. FOLHA DE PAGAMENTO.
Descrição: Os alunos devem implementar uma funcionalidade que permita calcular e exibir a folha de pagamento dos colaboradores cadastrados, levando em consideração descontos fixos.

Requisitos:
  Implementar uma função que calcule o salário líquido dos colaboradores, subtraindo os descontos do INSS e IRRF 
  O desconto do INSS deve ser calculado com base em alíquotas progressivas:
  Faixa 1: Até R$ 1.412,00 - 7,5%
  Faixa 2: De R$ 1.412,01 até R$ 2.666,68 - 9%
  Faixa 3: De R$ 2.666,69  até R$ 4.000,03 - 12%
  Faixa 4: Acima de R$ 4.000,04 - 14%
  
  O desconto do IRRF deve ser calculado com base em alíquotas progressivas:
  Faixa 1: Até R$ 2.112,00 - Isento
  Faixa 2: De R$ 2.112,01 até R$ 2.826,65 - 7,5%
  Faixa 3: De R$ 2.826,66 até R$ 3.751,05 - 15%
  Faixa 4: De R$ 3.751,06 até R$ 4.664,68 - 22,5%
  Faixa 5: Acima de R$ 4.664,68 - 27,5%
  Exibir o nome do colaborador, salário bruto, valores dos descontos e salário líquido.
  Gerar um relatório com os dados da folha de pagamento.

3. CONTROLE DE PONTO.
Descrição: Os alunos devem implementar uma funcionalidade que permita o registro de ponto dos colaboradores, armazenando os horários de entrada e saída.

Requisitos:
  Utilizar vetores para armazenar as horas de entrada e saída dos colaboradores.
  Implementar uma função que permita registrar o horário de entrada e saída de um colaborador, identificado pelo CPF.
  Garantir que o cálculo de horas trabalhadas seja feito com base na diferença entre a hora de entrada e a hora de saída.
  Exibir relatórios de horas trabalhadas para cada colaborador.

REQUISITOS EXTRAS (Opcional).
Relatórios: 
 Implementar uma função que exibe um relatório completo de todos os colaboradores cadastrados, com seus dados, folha de pagamento e ponto.
 Erros na entrada de dados (vou digitar letras onde esperar número)
 Regras Gerais

## USO DE FUNÇÕES: 
Todos os cálculos e operações devem ser implementados usando funções. Evitar a repetição de código.
Interface Simples: O programa deve apresentar um menu de opções para o usuário escolher entre as funcionalidades (cadastrar colaborador, registrar ponto, calcular folha de pagamento).

  

