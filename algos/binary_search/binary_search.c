//This is the C implementation of Binary Search
// (by yours truly)
#include <stdio.h>
#include <stdlib.h>
#include <time.h>


//Binary Search function, rx's a sorted array and search value, then returns T/F if the
// search value is present in the array
//void binary_search(){}


// [1,2,3,4,2]
//Sort Function rx's an array of ints then sorts, sx an array of sorted ints
void sort(int *arr, int size){
    for (int i = 0; i<(size-1); i++){
        int swapped =0;
        for(int j = 0; j < (size-1-i); j++){
            if(arr[j]>arr[j+1]){
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                swapped = 1;
            }
        }
        if (swapped == 0){
            break;
        }
    }
}

void generate_array(int *arr, int size){
    
    int num_ones = 0;
    for (int i = 0; i<size; i++){
        arr[i] = (rand()%99999)+1;
        if(arr[i] == 1){
            num_ones++;
        }
    }
    printf("Number of ones: %d",num_ones);
}

int main(){
    int size = 1000;
    int arr[1000];
    srand((unsigned int)time(NULL));
    generate_array(arr, size);
    sort(arr, size);
    
    for (int i = 0; i<size; i++){
        printf("Index: %d | Value: %d\n",i, arr[i]);
    }

    //int search = (rand()%99)+1;

    return 0;
}