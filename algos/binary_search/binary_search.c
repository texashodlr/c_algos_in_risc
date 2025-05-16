//This is the C implementation of Binary Search
// (by yours truly)
#include <stdio.h>
#include <stdlib.h>
#include <time.h>


//Binary Search function, rx's a sorted array and search value, then returns T/F if the
// search value is present in the array
void binary_search(){}

//Sort Function rx's an array of ints then sorts, sx an array of sorted ints
void sort(){}

int main(){

    srand((unsigned int)time(NULL));

    int arr[100];
    for (int i = 0; i<100; i++){
        arr[i] = (rand()%99)+1;
    }

    int search = (rand()%99)+1;

    return 0;
}