#!/bin/bash

for ((N=1;N<5;N++))
do
    export OMP_NUM_THREADS=$N
    echo -e "\nPara $OMP_NUM_THREADS threads:"

    echo -e "\nPara 100 de tamanio:"
    ./pmm-OpenMP 100
done

