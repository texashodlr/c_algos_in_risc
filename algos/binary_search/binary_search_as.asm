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
search: .word 403                                                 # What we're searching for
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
    li t0, 0        # t0 = low (index 0 of arr)
    la t1, arr      # t1 = arr base addr
    lw t2, 0(t1)    # t2 = arr[0] = 123
    lw t3, search   # t3 = search value = 403
    lw t4, size     # t4 = size of arr = 10
    addi t4, t4, -1   # t4 = 10 - 1 = 9
    la t5, left
    sw t2, 0(t5)    # Left = 123
    slli t7, t4, 2  # t7 = 9*4 = 36 (offset)
    add t8, t1, t7  # t8 = arr + 36 -> address of arr[9]
    lw t9, 0(t8)    # t9 = arr[9] = 777
    la t5, right    # t5 = address of right
    sw t9, 0(t5)    # right = arr[9] = 777
    bgt t3, t9, _not_in_range # If target is > arr[size-1] then its out of bounds and exits.
loop:
    bge t0, t4, not_found          # if left > right, done
    add t10, t0, t4                # t10 = middle = left + right 
    srli t10, t10, 1                    # Divide t10 by / 2 -> This produces an integer, now to load the arr element at that index
    slli t11, t10, 2                    # t11 = middle*4 = offset
    add t12, t1, t11                    # t12 = arr + middle*4 -> address of arr[middle]
    lw t13, 0(t12)                      # t13 = arr[middle] = 175
    beq  t3, t13, _found                # search == arr[middle]
    blt t3, t13, _search_lt             # search < arr[middle]
    bgt t3, t13, _search_gt             # search > arr[middle]
    j not_found

_search_lt:
    # Perform high_bound = middle - 1
    addi t4, t10, -1        # t4 = middle - 1 = 4 - 1 = 3 --> New upperbound index
    # slli t7, t4, 2          # t7 = 3*4 = 12 (offset)
    # add t8, t1, t7          # t8 = arr + 12 -> address of arr[9]
    # lw t9, 0(t8)            # t9 = arr[9] = 777
    # la t5, right            # t5 = address of right
    # sw t9, 0(t5)            # right = arr[9] = 777
    j loop

_search_gt:
    # Perform low_bound = middle + 1
    addi t0, t10, 1         # t0 = middle + 1 = 4 + 1 = 5 -> New lower bound index
    # slli t14, t0, 2         # t14 = 5*4 = 20 (offset)
    # add t15, t1, t14        # t15 = arr + 20 -> address of arr[5]
    # lw t2, 0(t15)           # t2 = arr[5] = 206
    # la t5, left            # t5 = address of right
    # sw t2, 0(t5)            # right = arr[9] = 777
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
    mv a1, t10
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
    la a0, notfound
    li a1, 4
    ecall
    j end

end:
    # Exit
    li a0, 10
    ecall
    
