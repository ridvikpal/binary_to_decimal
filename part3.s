/* Program that finds the largest number in a list of integers	*/
            
            .text                   // executable code follows
            .global _start                  
_start:                             
            MOV     R4, #RESULT     // R4 points to result location
            LDR     R0, [R4, #4]    // R0 holds the number of elements in the list
            MOV     R1, #NUMBERS    // R1 points to the start of the list
            BL      LARGE           
            STR     R0, [R4]        // R0 holds the subroutine return value

END:        B       END             

/* Subroutine to find the largest integer in a list
 * Parameters: R0 has the number of elements in the list
 *             R1 has the address of the start of the list
 * Returns: R0 returns the largest item in the list */
LARGE:		MOV		R3, R0			// Make R3 hold the # of elements in the list
			LDR		R0, [R1]		// R0 holds the largest number (initially the first element in the numbers list)
			B		LOOP			// start the acutal loop for checking the largest element
LOOP:		SUBS	R3, #1			// decrement the loop counter which is R3 (# of elements in list)
			BEQ		DONE_LARGE		// if R3 is equal to 0, end the subroutine
			ADD		R1, #4			// go to the next number in the list
			LDR		R2, [R1]		// get the next number
			CMP		R0, R2			// check if larger number found
			BGE		LOOP			// if larger number not found, loop again
			MOV		R0, R2			// update the largest number if found
			B		LOOP			// loop until end condition
DONE_LARGE:	BX		LR				// store largest number into result location	

RESULT:     .word   0           
N:          .word   7           // number of entries in the list
NUMBERS:    .word   4, 5, 3, 6  // the data
            .word   1, 8, 2                 

            .end                            
