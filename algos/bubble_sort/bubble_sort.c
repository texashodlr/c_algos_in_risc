//Bubble Sort in C
#include <stdio.h>
#include <stdlib.h>


void bubble_sort(int *arr, int size){
    int swapped;
    for(int i = 0; i < size-1; i++){
        swapped = 0;
        for(int j = 0; j < (size-1-i); j++){
            if(arr[j] > arr[j+1]){
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                swapped = 1;
                //printf("Swapped\n");
            }
        }
        if(swapped == 0){
            printf("Swapping completed!\n");
            break;
        }
    }
}

void generate_array(int *arr, int size){
    //Randomized spawning of Ints for the array
    for(int i = 0; i < size; i++){
        arr[i] = (rand()%99999)+1;
    }
}

void main(){

    //Size of desired array
    int size = 10000;

    //Definition of the array sized to size
    int arr[10000];

    //Generating random elements in array
    generate_array(arr, size);

    //Sorting randomized array
    printf("Starting swap-erations\n");
    bubble_sort(arr, size);

}