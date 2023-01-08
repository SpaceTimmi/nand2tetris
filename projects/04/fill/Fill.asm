// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Pseudo-code
// CHECK:
//   if keyboard_scan_code != 0
//       if screen is black: 
//           goto CHECK
//       else:
//           state: 1111111111111111 (black)
//   else:
//        if screen is white:
//           goto CHECK
//        else: 
//           state: 0000000000000000 (white)
//   
//  
//   n = 32 (per row)  * 256 (number of rows) = 8192
//   addr = 16384   
//
//
//   DRAW:
//   for (i=0; i<n; i++) {
//       RAM[addr] = state
//       addr = addr + 1
//   }
//   goto CHECK
//   
// Note: It works visually but doesn't pass the automatic test. If I set n to 8192 then
//       the screen doesn't turn white even if key pressed is released. It works well for 8191.
//       I believe it doesn't pass the test because there is still 1 (from 8191) 16-bit left that doesn't change color



// MAIN CODE:

(CHECK)
  @KBD
  D=M 
  @SETCOLOR
  D;JNE  // goto SETCOLOR if keyboard scan code is not equal to 0

  @SCREEN
  D=M

  @CHECK
  D;JEQ // If screen is already white and no key pressed then check again 


  @state
  M=0     // state = 0000000000000000
  @SETPARAMS
  0;JMP  // goto - SETPARAMS
  

(SETCOLOR)
  @SCREEN
  D=M

  @CHECK
  D;JGT // If screen is already black and key pressed then check again

  @state
  M=-1   // state = 1111111111111111


(SETPARAMS)
  @SCREEN
  D=A    // 16384
  @addr
  M=D   // addr = 16384

  @8191 // 32 per row *256 rows
  D=A

  @n
  M=D   // n = 8192

  @i
  M=0   // i = 0

(DRAW)
  @i
  D=M
  @n
  D=D-M
  @CHECK
  D; JGT   // goto CHECK if i != n (8192)  

  @state
  D=M    // D = state

  @addr
  A=M  
  M=D    // RAM[addr] = state

  @i
  M=M+1  // i = i + 1

  @addr
  M=M+1  // addr = addr + 1

  @DRAW
  D;JMP
  

