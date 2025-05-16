# Linear Seach in assembly
# Implementation of a simplified version of my linear search
# int arr[5] = {14, 67, 23, 89, 45};  // fixed values
# int search = 23;

# for (int i = 0; i < 5; i++) {
# /  if (arr[i] == search) {
#        // found at i
#        break;
#    }
# }

.data
arr: .word 14, 67, 23, 89, 45       # Array of integers
search: .word 45                    # What we're searching for
found: .string "Found at index: "
notfound: .string "Not found at index\n"
newline: .string "\n"

# Code Section
.text

# Main Entry Point
# Program Starts here at 0x00000000

main: 
    # initializations
    li t0, 0        # index i = 0
    la t1, arr      # address of arr[0]
    lw t3, search   # load search value
    li t4, 5        # Max iterations
loop:
    beq t0, t4, not_found    # if i == 5, done
    slli t5, t0, 2           # offset = i*4
    add t6, t1, t5           # addr = base + offset
    lw t2, 0(t6)             # load arr[i]
    beq t2, t3, _found       # if arr[i] == search
    addi t0, t0, 1           # i++
    j loop

_found:
    # print "Found at index" - Env call 4
    la a1, found
    li a0, 4
    ecall
    # Print new line
    la a1, newline
    li a0, 4
    ecall 
    # Load index of where the searched word was found
    mv a1, t0
    li a0, 1
    ecall
    # Print newline
    la a1, newline
    li a0, 4
    ecall
    j end

not_found:
    # print "Not found at index" - Env call 11
    la a0, notfound
    li a1, 4
    ecall
    j end

end:
    # Exit
    li a0, 10
    ecall
    
