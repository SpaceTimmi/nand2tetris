// Program: Add2.asm
// Computes: RAM[2] = RAM[0] + RAM[1]
// Usage: put values in RAM[0], RAM[1]
// Dreg -> D register


@R0    // RAM[0]
D=M   // Store RAM[0] into the Dreg 

@R1    // RAM[1]
D=D+M // Store the result of adding Dreg and RAM[1] into Dreg 

@R2    // RAM[2]
M=D   // Store Dreg into RAM[2]

@R6    // Infinite loop
0;JMP 
