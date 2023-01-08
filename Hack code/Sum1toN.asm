// Program: Sum1toN.asm
// Computes RAM[1] = 1+2+ ...+n
// Usage: calc the sum of all the integers between 1 and RAM[0]
//        store the result in RAM[1]


@R0 // RAM[0]
D=M // D = RAM[0] 

@n
M=D // n = RAM[0]

@i
M=1 // i = 1

@sum
M=0 // sum = 0


(LOOP)
  @i
  D=M
  @n
  D=D-M
  @STOP
  D;JGT // if i > n goto STOP 

  @sum
  D=M
  
  @i
  D=D+M
  
  @sum
  M=D // sum = sum + i

  @i
  M=M+1 // i = i + 1

  @LOOP
  0;JMP


(STOP) // Set RAM[1] to sum
  @sum
  D=M
  @R1
  M=D // RAM[1] = sum

  
(END) // Infinite loop
  @END
  0;JMP

