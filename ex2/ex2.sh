
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
