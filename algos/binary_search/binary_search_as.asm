# Binary Search in assembly
# Implementation of a simplified version of my linear search
# int arr[10] = {123, 132, 169, 175, 203, 206, 209, 300, 403, 777};  // fixed values
# int search = 403;
# # # # # # # # # # # # # # # # # # # # # 
# Basic assembly Binary Search, taking a pre-sorted array of size 10, looking for a value
# int left, right;
# while left <= right
#   middle = left+right /2
##  if target = arr[middle] return middle
##  elif target < arr[middle] right - 1;
##  e    target > arr[middle] left + 1;
# return -1 

.data
arr: .word 123, 132, 169, 175, 203, 206, 209, 300, 403, 777       # Array of integers
size: .word 10                                                    # Size of the array
search: .word 132                                                 # What we're searching for
left: .word 0
right: .word 0
foundIndex: .string "Found at index: "
notfoundIndex: .string "Not found at index\n"
newline: .string "\n"
outofrange: .string "The target is greater than the array's elements!\n"

# Code Section
.text

# Main Entry Point
# Program Starts here at 0x00000000

main: 
    # initializations
    li t0, 0                  # t0 = low (index 0 of arr)
    la t1, arr                # t1 = arr base addr
    lw t3, search             # t3 = search value = 403
    lw t4, size               # t4 = size of arr = 10
    addi t4, t4, -1           # t4 = 10 - 1 = 9
    slli t5, t4, 2            # t5 = 9*4 = 36 (offset)
    add t6, t1, t5            # t6 = arr + 36 -> address of arr[9]5
    lw t2, 0(t6)              # t2 = arr[9] = 777
    bgt t3, t2, _not_in_range # If target is > arr[size-1] then its out of bounds and exits.
loop:
    bge t0, t4, not_found               # if left > right, done
    add t5, t0, t4                      # t5 = middle = left + right 
    srli t5, t5, 1                      # Divide t10 by / 2 -> This produces an integer, now to load the arr element at that index
    slli t6, t5, 2                    # t11 = middle*4 = offset
    add t6, t1, t6                    # t12 = arr + middle*4 -> address of arr[middle]
    lw t6, 0(t6)                      # t13 = arr[middle] = 175
    beq  t3, t6, _found                # search == arr[middle]
    blt t3, t6, _search_lt             # search < arr[middle]
    addi t0, t5, 1                     # search > arr [mid] -> low = mid +1 
    j loop

_search_lt:
    # Perform high_bound = middle - 1
    addi t4, t5, -1        # t4 = middle - 1 = 4 - 1 = 3 --> New upperbound index
    j loop

_found:
    # print "Found at index" - Env call 4
    la a1, foundIndex
    li a0, 4
    ecall
    # Print new line
    la a1, newline
    li a0, 4
    ecall 
    # Load index of where the searched word was found
    mv a1, t5
    li a0, 1
    ecall
    # Print newline
    la a1, newline
    li a0, 4
    ecall
    j end

_not_in_range:
    # Hitting this if target is greater than the last element of the array (out of range)
    la a0, outofrange
    li a1, 4
    ecall
    j end

not_found:
    # Hitting this if target isn't inside of the array
    la a0, notfoundIndex
    li a1, 4
    ecall
    j end

end:
    # Exit
    li a0, 10
    ecall
    
