#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

//#define VECTOR_GLOBAL// descomentar para que los vectores sean variables ...
			                     // globales (su longitud no estará limitada por el ...
			                     // tamaño de la pila del programa)
#define VECTOR_DYNAMIC	// descomentar para que los vectores sean variables ...
						                   // dinámicas (memoria reutilizable durante la ejecución)
#ifdef VECTOR_GLOBAL
#define MAX 15000
double v1[MAX], v2[MAX], m[MAX][MAX]; 
#endif

int main(int argc, char ** argv)
{
    if(argc < 2){
        printf("Falta el número de filas/columnas. \n");
        exit(-1);
    }

    int n = atoi(argv[1]);

    #ifdef VECTOR_GLOBAL
    if (n>MAX) n=MAX;
    #endif
    #ifdef VECTOR_DYNAMIC
    double *v1, *v2, **m;
    v1 = (double*) malloc(n*sizeof(double));
    v2 = (double*) malloc(n*sizeof(double));
    m = (double**) malloc(n*sizeof(double*));
    for(int i = 0; i < n; i++) m[i] = (double*)malloc(n*sizeof(double));
    if ( (v1==NULL) || (v2==NULL) || (m==NULL) ){	
        printf("Error en la reserva de espacio para los vectores y matriz\n");
        exit(-2);
    }
    #endif

    int i, j;
    struct timespec cgt1, cgt2; double ncgt; //para tiempo de ejecución

    for(i=0; i<n; i++){
        v1[i] = i;
        v2[i] = 0;
    }

    for(i=0; i<n; i++)
        for(j=0; j<n; j++)
            m[i][j] = i*j;

    clock_gettime(CLOCK_REALTIME,&cgt1);

    for(i=0; i<n; i++){
        for(j=0; j<n; j++){
            v2[i] += m[i][j]*v1[j];
        }
    }

    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double)(cgt2.tv_sec-cgt1.tv_sec)+ (double)((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    if(n < 16){
        for(i=0; i<n; i++)
            printf("La suma de la componente %d es: %f \n",i, v2[i]);
    }else{
        printf("El componente 0 del vector resultante es: %f \n",v2[0]);
        printf("El componente %d del vector resultante es: %f \n", n-1, v2[n-1]);
    }

    printf("Tiempo(seg.):%11.9f \n", ncgt);

    #ifdef VECTOR_DYNAMIC
    free(v1); // libera el espacio reservado para v1
    free(v2); // libera el espacio reservado para v2
    free(m); // libera el espacio reservado para m
    #endif

    return 0;
}

