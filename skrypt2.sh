#!/bin/bash

if [ "$1" == "--date" ] || [ "$1" == "-d" ]; then
    echo "Dzisiejsza data: $(date +%Y-%m-%d)"
elif [ "$1" == "--logs" ] || [ "$1" == "-l" ]; then
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
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Dostępne opcje:"
    echo "--date (-d) - wyświetla dzisiejszą datę"
    echo "--logs (-l) - tworzy automatycznie 100 plików logx.txt, x – numer pliku od 1 – 100, w każdym pliku wpisując jego nazwę, nazwę skryptu który go utworzył i datę"
    echo "--logs (-l) N - tworzy automatycznie N plików logx.txt, analogicznie jak powyżej, ale z obsługą argumentu liczby plików"
    echo "--error (-e) - tworzy 100 plików errorx/errorx.txt, x – numer pliku od 1 – 100, w każdym pliku wpisując jego nazwę, nazwę skryptu który go utworzył i datę"
    echo "--error (-e) N - tworzy N plików errorx/errorx.txt, analogicznie jak powyżej, ale z obsługą argumentu liczby plików"
    echo "--init - klonuje całe repozytorium do katalogu w którym został uruchomiony oraz ustawia ścieżkę w zmiennej środowiskowej PATH"
else
    echo "Nieznana opcja. Użyj skrypt.sh --help, aby zobaczyć dostępne opcje."
fi

if [ "$1" == "--init" ]; then

    git clone https://github.com/JakubGibas05/ZAD1.git .

    echo 'export PATH