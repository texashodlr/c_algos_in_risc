# Bubble Sort in Assembly
# int arr[10] = {777, 169, 123, 175, 132, 209, 203, 300, 403};  // fixed values
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
arr: .word 777, 169, 123, 175, 132, 200, 209, 203, 300, 403 # Array of unsorted ints
size: .word 10
sortComplete: .string "Sorting is complete!\n"
newline: .string "\n"
space: .string " "

# Code Section
.text

# Main Entry Point
# Program Starts here at 0x00000000

main: 
    # initializations
    li t0, 0            # t0 = low (index 0 of arr)
    la t1, arr          # t1 = arr base addr
    lw t2, size         # t2 = arr size
    addi t2, t2, -1     # t2 = arr size - 1 (9)

outer_loop:
    # For i
    bge t0, t2, sort_complete      # if i >= size - 1, Exit 
    li t3, 0                       # t3 = swapped = 0
    li t4, 0                       # t4 = j = 0
    sub t5, t2, t3                 # t5 = size - 1 - i

inner_loop:
    # For J
    bge t4, t5, check_swapped      # If j >= size -1 -i end loop
    slli t6, t4, 2                 # t6 = j*4 (offset)
    add t6, t1, t6                 # t6 = arr +j*4
    lw a0, 0(t6)                   # a0 = arr[j]
    lw a1, 4(t6)                   # a1 = arr[j+1]
    ble a0, a1, no_swap            # if arr[j] <=arr[j+1], no swap
    sw a1, 0(t6)
    sw a0, 4(t6)
    li t3, 1

no_swap:
    addi t4, t4, 1                 # increment j++
    j inner_loop

check_swapped:
    beq t3, zero, sort_complete    # if swapped == 0, done
    addi t0, t0, 1                 # i++
    j outer_loop

sort_complete:
    # Print the sorted array
    li t6, 0                       # t6 = index for printing
    lw t2, size

print_loop:
    bge t6, t2, print_done
    slli t4, t6, 2
    add t4, t1, t4
    lw a1, 0(t4)
    li a0, 1
    ecall
    la a1, space
    li a0, 4
    ecall
    addi t6, t6, 1
    j print_loop

print_done:
    la a1, newline
    li a0, 4
    ecall
    la a1, sortComplete
    li a0, 4
    ecall

end:
    li a0, 10
    ecall