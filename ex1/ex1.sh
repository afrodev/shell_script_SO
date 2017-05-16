
#!/bin/bash
pesquisa=$1
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
