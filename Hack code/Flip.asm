// Program: Flip.asm
// flips the values of RAM[0] and RAM[1]
// Usage: temp = R1
//        R1 = R0
//        R0 = temp 


@R1   // RAM[1]
D=M   // D = RAM[1]

@temp
M=D   // temp = D 

@R0   // RAM[0]
D=M   // D = RAM[0]

@R1   // RAM[1]
M=D   // RAM[1] = RAM[0]

@temp // temp 
D=M

@R0   // RAM[0]
M=D   // RAM[0] = temp

(END) // Infinite loop
  @END
  0;JMP

