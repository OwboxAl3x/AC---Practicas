#!/bin/bash
#Se asigna al trabajo el nombre pmm-OpenMP
#PBS -N pmm-OpenMP
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"

for ((N=1;N<13;N++))
do
    export OMP_NUM_THREADS=$N
    echo -e "\nPara $OMP_NUM_THREADS threads:"

    echo -e "\nPara 100 de tamanio:"
    $PBS_O_WORKDIR/pmm-OpenMP 100
done

