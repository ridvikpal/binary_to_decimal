/* Program that converts a binary number to decimal */
           
           .text               // executable code follows
           .global _start
_start:
            MOV    R4, #N
            MOV    R5, #Digits  // R5 points to the decimal digits storage location
            LDR    R4, [R4]     // R4 holds N
            MOV    R0, R4       // parameter for DIVIDE goes in R0
			
RECHECK:	CMP		R0, #100	// check if dividend is 2 digits
			BLT		LT_100
			CMP		R0, #1000	// check if dividend is 3 digits
			BLT		LT_1000
			// else R4 must be 4 digits long
			B		LT_10000
			
LT_10000:	MOV 	R1, #1000	// must divide by 1000 to get thousands number
			BL		DIVIDE
			STRB	R1, [R5, #3] // set thousands number
			B		RECHECK

LT_1000:	MOV		R1, #100
			BL		DIVIDE
			STRB	R1, [R5, #2] // set hundreds number
			B		RECHECK
			
LT_100:		MOV		R1, #10		// pass 10 as the base for divide subroutine
            BL     DIVIDE
            STRB   R1, [R5, #1] // Tens digit is now in R1 - set it
            STRB   R0, [R5]     // Ones digit is in R0 - set it
END:        B      END

/* Subroutine to perform the integer division R0 / R1.
 * Returns: quotient in R1, and remainder in R0 */
DIVIDE:     MOV    R2, #0
CONT:       CMP    R0, R1
            BLT    DIV_END
            SUB    R0, R1
            ADD    R2, #1
            B      CONT
DIV_END:    MOV    R1, R2     // quotient in R1 (remainder in R0)
            MOV    PC, LR

N:          .word  9999         // the decimal number to be converted
Digits:     .space 4          // storage space for the decimal digits

            .end
