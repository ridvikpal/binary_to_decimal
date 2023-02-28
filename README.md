# binary_to_decimal
Working Code for ECE243 Lab 1 (Winter 2023) at the University of Toronto. All code is written and debugged in ARM Assembly. To simulate the code, upload the code and compile using the ARMv7 [CPUlator online tool](https://cpulator.01xz.net/?sys=arm-de1soc "CPUlator"). See the included lab handout for more information.

## Part 3
Part 3 finds the largest number stored in a set of consecutive memory registers (an array) using subroutines. For example, for an array of the following numbers:
```assembly
NUMBERS:    .word   4, 5, 3, 6  // the data
            .word   1, 8, 2
```
The program outputs the following in register R0:
![image](https://user-images.githubusercontent.com/105998663/221732609-148f4ef1-b281-494a-91d1-44cf95db88aa.png)

## Part 4
Part 4 converts any binary number abbreviated as a hexadecimal value in a memory register into a decimal number seperated by 1 byte in another memory register. For example, for the following memory registers with the value:
```assembly
N:          .word  9999         // the decimal number to be converted stored in binary (hexadecimal) in the memory register
Digits:     .space 4          // storage space for the decimal digits
```
The output in the memory location ```Digits``` is:
![image](https://user-images.githubusercontent.com/105998663/221733229-edf08c0c-f27a-4085-8962-46bb9c6c737e.png)
