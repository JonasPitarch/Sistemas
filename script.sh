#!/bin/bash

select_random_movies(){
    local new_maxfilas=$1
    numrdn=$(( RANDOM % new_maxfilas ))
    pelicula=$(sed "${numrdn}q;d" netflix.csv)
    echo "Película seleccionada al azar: $pelicula"
}
    
select_movies_by_year(){
    echo "Ingrese el año para listar las películas:"
    read year
    grep "$year" netflix.csv
}

sed -i '1d' netflix2.csv

sort -o netflix_sorted.csv netflix2.csv

awk '!seen[$0]++' netflix_sorted.csv > netflix.csv

new_maxfilas=$(wc -l < netflix.csv)

echo "NETFLIX"
echo "Menú de selección de películas"
echo "1. Recomendación rápida"
echo "2. Listar por año"
echo "Ingrese el número de la opción deseada (1 o 2):"
read option

case $option in
    1) select_random_movies $new_maxfilas ;;
    2) select_movies_by_year ;;
    *) echo "Opción no válida. Saliendo del programa." ;;
esac

