//This is the C implementation of Linear Search
#include <stdio.h> 
#include <stdlib.h>
#include <time.h>

int main(){

    srand((unsigned int)time(NULL));

    int arr[50];
    
    for (int i = 0; i<50; i++){
        arr[i] = (rand()%99)+1;  //Integer between 1-99
        printf("Index: %d | Value: %d \n",i, arr[i]);
    }

    int search = (rand()%99)+1;
    printf("Searching for..... %d\n",search);
    for(int i = 0; i<50; i++){
        if(search == arr[i]){
            printf("%d found at Index: %d..... exiting\n",search,i);
            return 0;
        }
    }

    printf("%d not found.... exiting\n",search);


    return 0;
}