#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(int argc, char *argv[]){

    if(argc < 2){
        printf("Falta el tamaño del vector\n");
        exit(-1);
    }

    int n = atoi(argv[1]);
    int a = 5;
    int i;

    int y[n], x[n];

    for(i=0; i<n; i++){
        x[i] = 5;
        y[i] = 2;
    }

    struct timespec cgt1, cgt2; double ncgt; //para tiempo de ejecución

    clock_gettime(CLOCK_REALTIME,&cgt1);
    
    for(i = 0; i < n; i++){

        y[i] += a * x[i];

    }

    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double)(cgt2.tv_sec-cgt1.tv_sec)+ (double)((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    printf("El componente 0 del vector es: %d \n",y[0]);
    printf("El componente %d del vector es: %d \n", n-1, y[n-1]);

    printf("Tiempo(seg.):%11.9f \n", ncgt);

}