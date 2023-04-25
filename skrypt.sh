#!/bin/bash

if [ "$1" == "--date" ]; then
    echo "Dzisiejsza data: $(date +%Y-%m-%d)"
elif [ "$1" == "--logs" ]; then
    if [ -z "$2" ]; then

        for i in {1..100}; do
            echo "Log $i" > log$i.txt
            echo "Nazwa pliku: log$i.txt" >> log$i.txt
            echo "Nazwa skryptu: $0" >> log$i.txt
            echo "Data: $(date +%Y-%m-%d)" >> log$i.txt
        done
    else

        for i in $(seq 1 "$2"); do
            echo "Log $i" > log$i.txt
            echo "Nazwa pliku: log$i.txt" >> log$i.txt
            echo "Nazwa skryptu: $0" >> log$i.txt
            echo "Data: $(date +%Y-%m-%d)" >> log$i.txt
        done
    fi
elif [ "$1" == "--help" ]; then
    echo "Dostępne opcje:"
    echo "--date - wyświetla dzisiejszą datę"
    echo "--logs - tworzy automatycznie 100 plików logx.txt, x – numer pliku od 1 – 100, w każdym pliku wpisując jego nazwę, nazwę skryptu który go utworzył i datę"
    echo "--logs N - tworzy automatycznie N plików logx.txt, analogicznie jak powyżej, ale z obsługą argumentu liczby plików"
else
    echo "Nieznana opcja. Użyj skrypt.sh --help, aby zobaczyć dostępne opcje."
fi


echo "log*.txt" > .gitignore
