// Program: Add2.asm
// Computes: if R0>0
//              R1=1
//           else
//               R1=0

// Code:
@R0        // RAM[0]
D=M        // D = RAM[0] 

@POSITIVE  // Jump to (POSITIVE) if D is greater than 0
D;JGT  

@R1        // RAM[1]
M=0        // RAM[1] = 0
@END       // Jump to (END) 
0;JMP  

(POSITIVE)
  @R1      //RAM[1]
  M=1      //RAM[1] = 1

(END)      // Infinite loop 
  @END
  0;JMP      
