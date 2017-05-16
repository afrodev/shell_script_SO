
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

