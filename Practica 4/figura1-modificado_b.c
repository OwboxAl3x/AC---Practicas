#include <stdio.h>
#include <time.h>

struct {
    int a;
    int b;
}   s[5000];

int main()
{
    int ii, X1, X2, i;
    int R[40000];

    struct timespec cgt1, cgt2;
    double ncgt;

    clock_gettime(CLOCK_REALTIME, &cgt1);
    for (ii = 0; ii < 40000; ii++) {

        X1 = 0; X2 = 0; 

        for(i = 0; i < 5000; i+=5){  
            X1 += 2 * s[i].a + ii;  
            X2 += 3 * s[i].b - ii;
            X1 += 2 * s[i+1].a + ii;  
            X2 += 3 * s[i+1].b - ii;
            X1 += 2 * s[i+2].a + ii;  
            X2 += 3 * s[i+2].b - ii;
            X1 += 2 * s[i+3].a + ii;  
            X2 += 3 * s[i+3].b - ii;
            X1 += 2 * s[i+4].a + ii;  
            X2 += 3 * s[i+4].b - ii;
        }

        if(X1 < X2) 
            R[ii] = X1;
        else
            R[ii] = X2;

    }
    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double)(cgt2.tv_sec-cgt1.tv_sec)+ (double)((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    printf("El componente 0 de R es: %d \n", R[0]);
    printf("El componente %d de R es: %d \n", 39999, R[39999]);

    printf("Tiempo(seg.):%11.9f \n", ncgt);

    return 0;
}