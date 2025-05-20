# Bubble Sort in Assembly
# int arr[10] = {123, 132, 169, 175, 203, 206, 209, 300, 403, 777};  // fixed values
# int search = 403;
# # # # # # # # # # # # # # # # # # # # # 
# Basic assembly Bubble Sort, taking an unsorted, randomized int array of size 10
#for i = 0  to (size - 1)
#    swapped = 0
#    for j = 0 to (size - 1 - i)
##        if arr[j] > arr[j+1]
#            temp = arr[j]
#            arr[j] = arr[j+1]
#            arr[j+1] = temp
#            swapped = 1
#@    if swapped == 0
#        exit

.data
arr: .word 777, 169, 123, 175, 132, 209, 203, 300, 403 # Array of unsorted ints
size: .word 10

# Code Section
.text

# Main Entry Point
# Program Starts here at 0x00000000

main: 
    # initializations

outer_loop:
    # For i

inner_loop:
    # For J

sort:
    # arr[j] > arr[j+1]

sort_complete:
    # Call end

end: