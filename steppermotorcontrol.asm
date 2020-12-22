//*ASSEMBLY LANGUAGE PROGRAM (8085)*
MAIN1 : MVI A, 80H //80H -  Control word to configure PA,PB,PC in O/P
OUT CWR_Address // Write control word in CWR of 8255
MVI A, 55H // Code for the Phase 1
OUT PortA_Address // sent to motor via port A of 8255 
CALL DELAY // Delay subroutine
MVI A, 99H // Code for the Phase II
OUT PortA_Address // sent to motor via port A of 8255
CALL DELAY // Delay subroutine
MVI A, AAH // Code for the Phase III
OUT PortA_Address // sent to motor via port A of 8255
CALL DELAY // Delay subroutine
MVI A, DDH  // Code for the Phase 1
OUT PortA_Address ; sent to motor via port A of 8255 
CALL DELAY ; Delay subroutine
JMP MAIN1 ; Keep the motor rotating continuously

//DELAY Subroutine
MVI C, FF ; Load C with FF -- Change it for the speed variation
LOOP1: MVI D,FF // Load D with FF
LOOP2: DCR D
JNZ LOOP2
DCR C
JNZ LOOP1
RET // Return to main program .