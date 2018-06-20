//Joseph Sindelar
//Header
                    .syntax unified
                    .cpu    cortex-m4
                    .text


                    .global SIMD_USatAdd           //Function header
                    .thumb_func
                    .align
SIMD_USatAdd:
                    PUSH        {R4-R11}            //Push registers
                    BFI         R2,R2,8,8           //Bitfield insert 8
                    BFI         R2,R2,16,16         //Insert 16
loop:
                    CMP         R1,40               //Compare against 40
                    BLT         loop2               //Branch when less that 40
                    LDMIA       R0,{R3-R12}         //Load registers
                    UQADD8      R3,R3,R2            //Adds bytes to the register to increase saturation
                    UQADD8      R4,R4,R2            //Adds bytes to the register to increase saturation
                    UQADD8      R5,R5,R2            //Adds bytes to the register to increase saturation
                    UQADD8      R6,R6,R2            //Adds bytes to the register to increase saturation
                    UQADD8      R7,R7,R2            //Adds bytes to the register to increase saturation
                    UQADD8      R8,R8,R2            //Adds bytes to the register to increase saturation
                    UQADD8      R9,R9,R2            //Adds bytes to the register to increase saturation
                    UQADD8      R10,R10,R2          //Adds bytes to the register to increase saturation
                    UQADD8      R11,R11,R2          //Adds bytes to the register to increase saturation
                    UQADD8      R12,R12,R2          //Adds bytes to the register to increase saturation
                    STMIA       R0!,{R3-R12}        //Store added values
                    SUB         R1,R1,40            //Subtract 40 from count
                    B           loop                //Branch to the top of the loop
loop2:              CBZ         R1,done             //Branch if 0
                    LDR         R3,[R0]             //Load address in R0
                    UQADD8      R3,R3,R2            //Adds bytes to the register to increase saturation
                    STR         R3,[R0],4           //Store result
                    SUB         R1,R1,4             //Decrement Count
                    B           loop2               //Branch to top of loop
done:               POP         {R4-R11}            //Pop registers
                    BX          LR                       //Return

                    //Function Header
                    .global SIMD_USatSub
                    .thumb_func
                    .align

SIMD_USatSub:       PUSH        {R4-R11}            //Push Registers
                    BFI         R2,R2,8,8           //Bitfield insert 8
                    BFI         R2,R2,16,16         //Bitfield insert 16
loop1:
                    CMP         R1,40               //Compare against 40
                    BLT         loop3               //Branch if less than
                    LDMIA       R0,{R3-R12}         //Load registers
                    UQSUB8      R3,R3,R2            //Subtract bytes from the register to decrease saturation
                    UQSUB8      R4,R4,R2            //Subtract bytes from the register to decrease saturation
                    UQSUB8      R5,R5,R2            //Subtract bytes from the register to decrease saturation
                    UQSUB8      R6,R6,R2            //Subtract bytes from the register to decrease saturation
                    UQSUB8      R7,R7,R2            //Subtract bytes from the register to decrease saturation
                    UQSUB8      R8,R8,R2            //Subtract bytes from the register to decrease saturation
                    UQSUB8      R9,R9,R2            //Subtract bytes from the register to decrease saturation
                    UQSUB8      R10,R10,R2          //Subtract bytes from the register to decrease saturation
                    UQSUB8      R11,R11,R2          //Subtract bytes from the register to decrease saturation
                    UQSUB8      R12,R12,R2          //Subtract bytes from the register to decrease saturation
                    STMIA       R0!,{R3-R12}        //Store results
                    SUB         R1,R1,40            //Decrement count
                    B           loop1               //Branch to top of loop
loop3:              CBZ         R1,done1            //Compare and branch if zero
                    LDR         R3,[R0]             //Load register
                    UQSUB8      R3,R3,R2            //Subtract bytes from the register to decrease saturation
                    STR         R3,[R0],4           //Store result
                    SUB         R1,R1,4             //Decrement count
                    B           loop3               //Branch to top
done1:              POP         {R4-R11}            //Pop registers
                    BX          LR                  //Return


                    .end                        //Ends it all
