#!/bin/bash
#Se asigna al trabajo el nombre pmtv-OpenMP
#PBS -N pmtv-OpenMP
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"

export OMP_NUM_THREADS=12

export OMP_SCHEDULE="static"
echo "\nPara static y chunk por defecto"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="static,1"
echo "\nPara static y chunk 1"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="static,64"
echo "\nPara static y chunk 64"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic"
echo "\nPara dynamic y chunk por defecto"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic,1"
echo "\nPara dynamic y chunk 1"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic,64"
echo "\nPara dynamic y chunk 64"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="guided"
echo "\nPara guided y chunk por defecto"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="guided,1"
echo "\nPara guided y chunk 1"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="guided,64"
echo "\nPara guided y chunk 64"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="static"
echo "\nPara static y chunk por defecto"
$PBS_O_WORKDIR/pmtv-OpenMP 23040

export OMP_SCHEDULE="static,1"
echo "\nPara static y chunk 1"
$PBS_O_WORKDIR/pmtv-OpenMP 23040

export OMP_SCHEDULE="static,64"
echo "\nPara static y chunk 64"
$PBS_O_WORKDIR/pmtv-OpenMP 23040

export OMP_SCHEDULE="dynamic"
echo "\nPara dynamic y chunk por defecto"
$PBS_O_WORKDIR/pmtv-OpenMP 23040

export OMP_SCHEDULE="dynamic,1"
echo "\nPara dynamic y chunk 1"
$PBS_O_WORKDIR/pmtv-OpenMP 23040

export OMP_SCHEDULE="dynamic,64"
echo "\nPara dynamic y chunk 64"
$PBS_O_WORKDIR/pmtv-OpenMP 23040

export OMP_SCHEDULE="guided"
echo "\nPara guided y chunk por defecto"
$PBS_O_WORKDIR/pmtv-OpenMP 23040

export OMP_SCHEDULE="guided,1"
echo "\nPara guided y chunk 1"
$PBS_O_WORKDIR/pmtv-OpenMP 23040

export OMP_SCHEDULE="guided,64"
echo "\nPara guided y chunk 64"
$PBS_O_WORKDIR/pmtv-OpenMP 23040