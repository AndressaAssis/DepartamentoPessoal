programa 
{
  inclua biblioteca Tipos
  inclua biblioteca Texto

  // ------- > < -------
  const inteiro LIMITE = 10
  // Indexes
  // h = hora calculada
  // i = cadastrados
  // j = colaboradores
  // k = folha de pagamento
  // o = CPF
 
  inteiro h = 0, i = 0, j = 0, k = 0, o = 0, fp_selecionado
  inteiro selecionado, minutosTrabalhados[LIMITE], minutosCalculados = 0
  real salarios[LIMITE], salario, salarioLiquido = 0.0
  cadeia horaEntrada = "", horaSaida = "", nome, CPF, CPFHoras

  // Vetores
  cadeia nomes[LIMITE], CPFs[LIMITE], CPFsHoras[LIMITE]
  // ------- > < -------

  // NÃO MEXER NA FUNÇÃO INÍCIO
  funcao inicio()  
  {
  	  // NÃO MEXER
      interface()
  }
  
// ------------- > Colaboradores < -------------
  funcao atribuirColaboradores()
  {
  	caracter parada = 's'
      enquanto(parada == 's')
      {
          escreva("Digite o nome do colaborador: ")
          leia(nome)
          nomes[i] = nome

          escreva("\nDigite o salário do colaborador: R$")
          leia(salario)
          salarios[i] = salario

          escreva("\nDigite o CPF do colaborador: ")
          leia(CPF)
          CPFs[i] = CPF
          i++

          escreva("\nContinuar cadastrando? (s/n): ")
          leia(parada)

          escolha(parada)
          {
            caso 's': 
            escreva("\n---------------------\n")
            pare

            caso 'n': 
            guiColaboradores()
            pare

            caso contrario:
            escreva("\nSua ordem foi inválida!\n")
            escreva("Reiniciando cadastros!")
            atribuirColaboradores()
            pare

          }

          se(i >= LIMITE)
          {
            escreva("Você atingiu o limite (10) de cadastrados!")
		  guiColaboradores()
          }
      }
  }
  funcao mostrarColaboradores()
  {
    escreva("\nLista dos colaboradores cadastrados:\n\n")
    	se(i == 0){
    		escreva("\nNão existem colaboradores para listar.\n")
    		guiColaboradores()
    	} senao {
    		para(j = 0; j < i; j++)
	      { 	
	        escreva("\n*******************\n")
	        escreva("ID: ", j, "\n")
	        escreva("Nome: ", nomes[j], "\n")
	        escreva("CPF: ", CPFs[j], "\n")
	        escreva("Salário: R$", salarios[j], "\n")
	        escreva("*******************\n")
	      }
    	}
  }
  funcao editarColaboradores()
  {
    caracter editar
    se(i == 0) {
    		escreva("\nNão existem colaboradores para editar.\n")
    		guiColaboradores()
    	} senao {
        escreva("\nQual cadastro deseja editar? (0 de ",i-1,"): ")
        leia(selecionado)
        se(selecionado >= 0)
        {
            escreva("\nDigite um novo nome do colaborador: ")
            leia(nome)
            nomes[selecionado] = nome

            escreva("\nDigite um novo salário do colaborador: ")
            leia(salario)
            salarios[selecionado] = salario

            escreva("\nDigite um novo CPF do colaborador: ")
            leia(CPF)
            CPFs[selecionado] = CPF
        }
        senao
        {
            escreva("ID inválido!\n")
        }

        escreva("\nDeseja continuar? (s ou n): ")
        leia(editar)

        se(editar == 's')
        {
            editarColaboradores()
        }
        senao
        {
            mostrarColaboradores()
            escreva("\nOs colaboradores foram suficientemente atendidos!\n")
            guiColaboradores()
        }
    }
  }
// ------------- > Colaboradores < -------------

// ------------- > Folha de Pagamento < -------------
  funcao real calcularINSS(real salarioBruto)
  {
	se(salarioBruto <= 1412)
	{
    		retorne 0.075 * salarioBruto
	}
	senao se(salarioBruto <= 2666.68)
	{
    		retorne 0.09 * salarioBruto
	}
	senao se(salarioBruto <= 4000.03)
	{
    		retorne 0.012 * salarioBruto
	}
	senao
	{
    		retorne 0.014 * salarioBruto
	}
  }
  funcao real calcularIRRF(real salarioBruto)
  {
      se(salarioBruto <= 2112) 
     {
    		retorne 0.0
	}
	senao se(salarioBruto <= 2826.65)
	{
    		retorne 0.075 * salarioBruto
	}
	senao se(salarioBruto <= 3751.05)
	{
    		retorne 0.15 * salarioBruto
	}
	senao se(salarioBruto <= 4664.68)
	{
    		retorne 0.225 * salarioBruto
	}
	senao 
	{
    		retorne 0.275 * salarioBruto
	}
  }
  funcao folhaDePagamento()
  {
      escreva("\nDe qual colaborador cadastrado deseja ver a Folha de Pagamento? (0 a ", i-1, "): ")
      leia(fp_selecionado)
      
	 caracter resposta
      salarioLiquido = salarios[fp_selecionado] - calcularINSS(salarios[fp_selecionado]) - calcularIRRF(salarios[fp_selecionado])
	 
      se(fp_selecionado >= 0 e fp_selecionado < i)
      {
          escreva("\nO nome do colaborador é: ", nomes[fp_selecionado])
          escreva("\nO salário do colaborador é: R$", salarios[fp_selecionado])
          escreva("\nO INSS do colaborador é: R$", calcularINSS(salarios[fp_selecionado]))
          escreva("\nO IRRF do colaborador é: R$", calcularIRRF(salarios[fp_selecionado]))
          escreva("\nO salário liquido do colaborador é: R$", salarioLiquido)
          k++
      }
      senao
      {
          escreva("ID inválido!\n")
          escreva("Selecione um ID existente!\n")
          folhaDePagamento()
      }

      escreva("\nDeseja ver o relatório da folha de pagamento? (s ou n): ")
      leia(resposta)
      se(resposta == 's')
      {
      	escreva("\nAqui está o seu relatório!\n")	
      	mostrarFolhasDePagamento()
      }
      senao se(resposta == 'n')
      {
      	guiFolhaPagamento()
      }
      senao
      {
      	escreva("\nResposta invalida, tente novamente!\n")
      	escreva("\nDeseja ver o relatorio da folha de pagamento? (s ou n): ")
      	leia(resposta)	
      }
  }
  funcao mostrarFolhasDePagamento()
  {
 	para(inteiro contador = 0; contador < k; contador++)
 	{
      	salarioLiquido = salarios[contador] - calcularINSS(salarios[contador]) - calcularIRRF(salarios[contador])
	 
	     escreva("\nO nome do colaborador é: ", nomes[contador])
	     escreva("\nO sálario do colaborador é: R$", salarios[contador])
	     escreva("\nO INSS do colaborador é: R$", calcularINSS(salarios[contador]))
	     escreva("\nO IRRF do colaborador é: R$", calcularIRRF(salarios[contador]))
	     escreva("\nO salário líquido do colaborador é: R$", salarioLiquido, "\n") 
 	}
 	guiFolhaPagamento()
  }
// ------------- > Folha de Pagamento < -------------

// ------------- > Registrar Ponto < -------------
  funcao inteiro obterIndice(cadeia cpf_indice) 
  {
	para(inteiro indice = 0; indice < i; indice++) 
	{
		se(cpf_indice == CPFs[indice]) 
		{
          	retorne indice
          }
     }
     escreva("Colaborador não encontrado, digite um CPF válido: ")
     leia(cpf_indice)
     retorne obterIndice(cpf_indice)
  }
  funcao inteiro converterHoraEmMinutos(cadeia horaDeEntrada, cadeia horaDeSaida)
  {
       cadeia hora1 = Texto.extrair_subtexto(horaDeEntrada, 0, 2)
       cadeia minuto1= Texto.extrair_subtexto(horaDeEntrada, 3, 5)

	  real horaRealEntrada = Tipos.cadeia_para_real(hora1)
       real minutoRealEntrada = Tipos.cadeia_para_real(minuto1)
       
	  cadeia hora2 = Texto.extrair_subtexto(horaDeSaida, 0, 2)
       cadeia minuto2= Texto.extrair_subtexto(horaDeSaida, 3, 5)
	
       real horaRealSaida = Tipos.cadeia_para_real(hora2)
       real minutoRealSaida = Tipos.cadeia_para_real(minuto2)

	  minutosCalculados = ((horaRealSaida * 60 + minutoRealSaida) - (horaRealEntrada * 60 + minutoRealEntrada)) 
	  retorne minutosCalculados
   }
  funcao armazenarHorasCPF()
  {
  	caracter resposta	
  	para(inteiro h1 = 0; h1 < i; h1++)
  	{	
  		escreva("\nDigite seu CPF para confirmar suas horas de entrada: ")
  		leia(CPFHoras)

		inteiro indiceColaborador = obterIndice(CPFHoras)

		CPFsHoras[o] = CPFs[indiceColaborador]
		o++

	   	escreva("\nDigite a sua hora de entrada (HH:MM): ")
  		leia(horaEntrada)

  		escreva("\nDigite sua a hora de saida (HH:MM): ")
  		leia(horaSaida)

		inteiro minutos = converterHoraEmMinutos(horaEntrada, horaSaida)
		minutosTrabalhados[indiceColaborador] += minutos

	   	escreva("Deseja ver o relatório do registro de ponto dos colaboradores? (s ou n): ")
	   	leia(resposta)

	   	se(resposta == 's')
	   	{
	   		escreva("\nO Registro de ponto dos cadastrados está disponivel logo abaixo:\n")
	   		mostrarHorasCPF()
	   	}
	   	senao se(resposta == 'n')
	   	{
	   		guiRegistrarPonto()
	   	}
	   	senao
	   	{
	   		escreva("\nResposta Invalida!\n")
	   		escreva("Reiniciando Registro de Ponto\n")
			armazenarHorasCPF()
	   	}
	}
  }
  funcao mostrarHorasCPF()
  {
  	para(inteiro contador3 = 0; contador3 < i; contador3++)
 	{
 		se(minutosTrabalhados[contador3] != 0)
 		{
 			escreva("\n*****************")
			escreva("\nCPF: ", CPFsHoras[contador3])
			escreva("\nHoras trabalhados: ", (minutosTrabalhados[contador3]/60))
			escreva("\n*****************")
 		}	
 	}
 	guiRegistrarPonto()
  }
// ------------- > Registrar Ponto < -------------

// ------------- > Interface < -------------
  funcao interface() 
  {
	guiPrincipal()	
  }
  funcao guiPrincipal() 
  {
  	inteiro secao
  	escreva("---------------------")
  	escreva("\nMenu de departamento pessoal")
  	escreva("\n1. Colaboradores")
  	escreva("\n2. Registrar ponto")	
  	escreva("\n3. Calcular folha de pagamento")
  	escreva("\n4. Gerar Relatorio Geral")
  	escreva("\n0. Sair")
  	escreva("\nEscolha sua opção: ")
  	leia(secao)
  	escreva("---------------------")
  	

  	escolha(secao)
  	{
  		caso 1:
  			guiColaboradores()
  			pare
  		caso 2:
  			guiRegistrarPonto()
  			pare
  		caso 3:
  			guiFolhaPagamento()
  			pare
  		caso 4:
  			relatorioGeral()
  			pare
  		caso contrario:
 			escreva("Saindo do programa...")
  			pare
  	}
  }
  funcao guiColaboradores() 
  {
  	inteiro secao
  	escreva("\n---------------------")
  	escreva("\nMenu de colaboradores")
  	escreva("\n1. Cadastrar colaborador")
  	escreva("\n2. Editar colaborador")	
  	escreva("\n3. Listar colaboradores")
  	escreva("\n0. Voltar")
  	escreva("\nEscolha sua opção: ")
  	leia(secao)
  	escreva("---------------------\n")
  	

  	escolha(secao)
  	{
  		caso 1:
  			atribuirColaboradores()
  			pare
  		caso 2:	
  			editarColaboradores()
  			pare
  		caso 3:
  			mostrarColaboradores()
  			guiColaboradores()
  			pare
  		caso contrario:
 			guiPrincipal()
  			pare
  	}
  }
  funcao guiRegistrarPonto()
  {
  	inteiro secao
  	escreva("\n---------------------")
  	escreva("\nMenu de registro de ponto")
  	escreva("\n1. Mostrar Colaboradores")
  	escreva("\n2. Registrar Horas Trabalhadas")	
  	escreva("\n3. Relatorio dos pontos registrados")
  	escreva("\n0. Voltar")
  	escreva("\nEscolha sua opção: ")
  	leia(secao)
  	escreva("\n---------------------\n")
  	escolha(secao)	
  	{
  		caso 1:
  			mostrarColaboradores()
  			guiRegistrarPonto()
  			pare
  		caso 2:
  			armazenarHorasCPF()
  			pare
  		caso 3:
  			mostrarHorasCPF()
  			pare
  		caso contrario:
 			guiPrincipal()
  			pare
  	}
  }
  funcao guiFolhaPagamento()
  {
      inteiro secao
      escreva("\n---------------------")
      escreva("\nFolha de pagamento")
      escreva("\n1. Mostrar Colaboradores")
      escreva("\n2. Calcular folha de pagamento")    
      escreva("\n3. Relatorio das folhas de pagamento")
      escreva("\n0. Voltar")
      escreva("\nEscolha sua opção: ")
      leia(secao)    
      escreva("\n---------------------\n")

      escolha(secao)
      {
          caso 1:
              mostrarColaboradores()
              pare
          caso 2:
              folhaDePagamento()
              pare
          caso 3:
              mostrarFolhasDePagamento()
              pare
          caso contrario:
              guiPrincipal() 
              pare
      }    
  }
// ------------- > Interface < -------------

// ------------- > OPCIONAL < -------------
  funcao relatorioGeral()
  {
  		escreva("\nRelatório Geral de Colaboradores\n")
  		escreva("-----------------------------------------------------------------------------------------------------\n")

  		para(inteiro contador = 0; contador < i; contador++)
    {
          real inss = calcularINSS(salarios[contador])
          real irrf = calcularIRRF(salarios[contador])
          real salarioLiquido = salarios[contador] - inss - irrf

          escreva("ID: ", contador, "\nNOME: ", nomes[contador], "\nCPF: ", CPFs[contador], "\nHORAS TRABALHADAS: ", (minutosTrabalhados[contador]/60), "\nSALÁRIO BRUTO: ", salarios[contador], "\nINSS: ", inss, "\nIRRF: ", irrf, "\nSALÁRIO LÍQUIDO: ", salarioLiquido, "\n")
          escreva("-----------------------------------------------------------------------------------------------------\n")
    }

       guiPrincipal()  
}



  }
// ------------- > OPCIONAL < -------------
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1786; 
 * @DOBRAMENTO-CODIGO = [24, 31, 77, 95, 141, 160, 183, 225, 242, 255, 272, 314, 331, 335, 369, 400, 429, 461];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 12640; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */