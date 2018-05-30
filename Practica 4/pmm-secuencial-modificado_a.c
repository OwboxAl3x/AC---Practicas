#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

#define VECTOR_GLOBAL// descomentar para que los vectores sean variables ...
			                     // globales (su longitud no estará limitada por el ...
			                     // tamaño de la pila del programa)
//#define VECTOR_DYNAMIC	// descomentar para que los vectores sean variables ...
						                   // dinámicas (memoria reutilizable durante la ejecución)
#ifdef VECTOR_GLOBAL
#define MAX 15000
double m1[MAX][MAX], m2[MAX][MAX], m3[MAX][MAX]; 
#endif

void multi(int n){

    int i, j, k;
    for(i=0; i<n; i++){
        for(k=0; k<n; k++)
            for(j=0; j<n; j++){
                m3[i][j] += m1[i][k]*m2[k][j];
            }
    }
    printf("Fin\n");

}

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
    double **m1, **m2, **m3;
    m1 = (double**) malloc(n*sizeof(double*));
    m2 = (double**) malloc(n*sizeof(double*));
    m3 = (double**) malloc(n*sizeof(double*));
    for(int i = 0; i < n; i++){
        m1[i] = (double*)malloc(n*sizeof(double));
        m2[i] = (double*)malloc(n*sizeof(double));
        m3[i] = (double*)malloc(n*sizeof(double));
    }
    if ( ( m1==NULL) || (m2==NULL) || (m3==NULL) ){	
        printf("Error en la reserva de espacio para los vectores y matriz\n");
        exit(-2);
    }
    #endif

    int i, j, k;
    struct timespec cgt1, cgt2; double ncgt; //para tiempo de ejecución

    for(i=0; i<n; i++)
        for(j=0; j<n; j++){
            m1[i][j] = 5;
            m2[i][j] = 2;
            m3[i][j] = 0;
        }

    clock_gettime(CLOCK_REALTIME,&cgt1);

    multi(n);
    
    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double)(cgt2.tv_sec-cgt1.tv_sec)+ (double)((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    printf("El componente 0 del vector resultante es: %.0f \n",m3[0][0]);
    printf("El componente %d del vector resultante es: %.0f \n", n-1, m3[n-1][n-1]);

    printf("Tiempo(seg.):%11.9f \n", ncgt);

    #ifdef VECTOR_DYNAMIC
    free(m1); // libera el espacio reservado para m1
    free(m2); // libera el espacio reservado para m2
    free(m3); // libera el espacio reservado para m3
    #endif

    return 0;
}