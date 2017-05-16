# Feito por Humberto Vieira de Castro
# Todos os exercícios foram desenvolvidos.
# Também foi feito um menu para a execução dos exercícios um a um.
# Além disso, o arquivo texto de exemplo também está contido.

buscar_opcao () {
	echo "Digite o nome de pesquisa:"
	read nome
	while read line
	do

		if [ "$line" = "$nome" ]; then
			# valor na variavel
			valor=1
		fi
	 
		# echo  "$line"

	done <&3

	echo "Nome Pesquisado: $pesquisa"

	if [ "$valor" = 1 ]; then
		echo "Pesquisa ENCONTRADA"
	else 
		echo "Pesquisa NÃO encontrada"

	fi

}

adicionar_opcao () {
	echo "Digite o nome que deseja adicionar: "
	read nome
	echo "$nome" >> nomes.txt
}

atualizar_opcao () {
	echo "Digite algum dos nomes abaixo que deseja editar: "
	imprime_arquivo
	read nomePesquisado


	echo "\nDigite o nome editado:"
	read nomeEditado
	echo "\n"

	sed -i -e "s/$nomePesquisado/$nomeEditado/g" nomes.txt

}

imprime_arquivo () {
	exec 3<nomes.txt

	while read line
	do
		echo  "$line"
	done <&3
}

remover_opcao () {
	echo "Digite algum dos nomes abaixo que deseja remover: "
	imprime_arquivo
	read nomePesquisado

	sed -i -e "/$nomePesquisado/d" nomes.txt

}


ordenar_arquivo () {
	sort nomes.txt
}


ex1 () {
	#!/bin/bash


	echo "Digite o nome para a pesquisa: "
	read pesquisa
	valor=0

	exec 3<nomes.txt

	while read line
	do

		if [ "$line" = "$pesquisa" ]; then
			# valor na variavel
			valor=1
		fi
	 
		# echo  "$line"

	done <&3

	echo "Nome Pesquisado: $pesquisa"

	if [ "$valor" = 1 ]; then
		echo "Pesquisa ENCONTRADA"
	else 
		echo "Pesquisa NÃO encontrada"

	fi

}

ex2 () {

	#!/bin/bash
	pesquisa=$1
	valor=0

	exec 3<nomes.txt

	echo "Escolha uma das opções de nome para pesquisa:"
	echo "Digite 1 para Jobson"
	echo "Digite 2 para Rafael"
	echo "Digite 3 para Michel"
	echo "Digite 4 para Monica"

	read opcao

	case $opcao in
		1 )
			pesquisa="Jobson"
			break
			;;
		2 )
			pesquisa="Rafael"
			break
			;;
		3 )
			pesquisa="Michel"
			break
			;;
		4 )
			pesquisa="Monica"
			break
			;;		
	esac



	while read line
	do

		if [ "$line" = "$pesquisa" ]; then
			# valor na variavel
			valor=1
		fi
	 
		# echo  "$line"

	done <&3

	echo "Nome Pesquisado: $pesquisa"

	if [ "$valor" = 1 ]; then
		echo "Pesquisa ENCONTRADA"
	else 
		echo "Pesquisa NÃO encontrada"

	fi

}



ex3 () {
	#!/bin/bash
	pesquisa=$1
	valor=0

	exec 3<nomes.txt

	echo "Escolha uma das opções de nome para pesquisa:"
	echo "Digite 1 para Buscar nome"
	echo "Digite 2 para Adicionar"
	echo "Digite 3 para Atualizar"
	echo "Digite 4 para Remover"

	read opcao


	case $opcao in
		1 )
			buscar_opcao
			break
			;;
		2 )
			adicionar_opcao
			break
			;;
		3 )
			atualizar_opcao
			break
			;;
		4 )
			remover_opcao
			break
			;;		
	esac
}


ex4 () {
	#!/bin/bash
	pesquisa=$1
	valor=0

	exec 3<nomes.txt

	echo "\n\n--------Antiga lista--------"
	imprime_arquivo
	echo "----------------------------\n\n"

	echo "--------Lista ordenada--------"
	ordenar_arquivo
	echo "------------------------------\n\n"


}


echo "Escolha um dos exercícios para ser executado: "
echo "Digite 1 para Exercício 01"
echo "Digite 2 para Exercício 02"
echo "Digite 3 para Exercício 03"
echo "Digite 4 para Exercício 04"

read opcao



case $opcao in
	1 )
		ex1
		break
		;;
	2 )
		ex2
		break
		;;
	3 )
		ex3
		break
		;;
	4 )
		ex4
		break
		;;		
esac


