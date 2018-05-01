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
    double start, end, tTotal; //para tiempo de ejecución
    #pragma omp parallel
    {
        #pragma omp for private(j)
            for(i=0; i<n; i++)
                for(j=0; j<n; j++){
                    m1[i][j] = 5;
                    m2[i][j] = 2;
                    m3[i][j] = 0;
                }

        #pragma omp single
            start = omp_get_wtime();
        
        #pragma omp for private(k,j)
            for(i=0; i<n; i++){
                for(j=0; j<n; j++)
                    for(k=0; k<n; k++){
                        m3[i][j] += m1[i][k]*m2[k][j];
                    }
            }
        
        #pragma omp single
            end = omp_get_wtime();

    }

    tTotal = end - start;

    printf("El componente 0 del vector resultante es: %.0f \n",m3[0][0]);
    printf("El componente %d del vector resultante es: %.0f \n", n-1, m3[n-1][n-1]);

    printf("Tiempo(seg.):%11.9f \n", tTotal);

    #ifdef VECTOR_DYNAMIC
    for (i=0; i<n; i++){
		free(m1[i]);
        free(m2[i]);
        free(m3[i]);
    }
    free(m1); // libera el espacio reservado para m1
    free(m2); // libera el espacio reservado para m2
    free(m3); // libera el espacio reservado para m3
    #endif

    return 0;
}