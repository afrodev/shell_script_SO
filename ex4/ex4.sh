
#!/bin/bash
pesquisa=$1
valor=0

exec 3<nomes.txt



imprime_arquivo () {
	exec 3<nomes.txt

	while read line
	do
		echo  "$line"
	done <&3
}

ordenar_arquivo () {
	sort nomes.txt
}

echo "\n\n--------Antiga lista--------"
imprime_arquivo
echo "----------------------------\n\n"

echo "--------Lista ordenada--------"
ordenar_arquivo
echo "------------------------------\n\n"

