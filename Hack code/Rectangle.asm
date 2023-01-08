// Progam: Rectangle.asm
// Draw a filled rectangle at the screen's top left corner, with
// width of 16 pixels and height of RAM[0] pixels.
// Usage: put a non-negative number (rectangle's height) in RAM[0]


@SCREEN
D=A

@addr
M=D   // addr = 16384


@0
D=M

@n
M=D // n = RAM[0]


@i
M=0 // i = 0


(LOOP)
  @i
  D=M
  @n
  D=D-M
  @END
  D; JGT // if i > n jump to END


  @addr
  A=M  
  M=-1 // RAM[addr] = 111111111111111

  @i
  M=M+1 // i = i + 1

  @32
  D=A

  @addr
  M=M+D // addr = addr + 32

  @LOOP
  D;JMP

(END) // Infinite loop
  @END
  0;JMP



