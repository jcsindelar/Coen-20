//Joseph Sindelar
//Header
                    .syntax unified
                    .cpu    cortex-m4
                    .text

                    //Provided Functions
                    .global CallReturnOverhead
                    .thumb_func
                    .align
CallReturnOverhead: BX      LR

                    //Function Header
                    .global SDIVby13
                    .thumb_func
                    .align
SDIVby13:           MOVS.N R1,13
                    SDIV R0,R0,R1
                    BX LR

                    //Function Header
                    .global UDIVby13
                    .thumb_func
                    .align
UDIVby13:           MOVS.N R1,13
                    UDIV R0,R0,R1
                    BX LR


                    //Function Header
                    .global MySDIVby13
                    .thumb_func
                    .align
MySDIVby13:         LDR     R1,=0x4EC4EC4F      // 2 clock cycle(s) Loads a constant (2^34/13)
                    SMMUL   R1,R1,R0            // 2 clock cycle(s) Signed multiplication of the dividend by constant into 64bit
                    ASRS.N  R1,R1,2             // 1 clock cycle(s) Arithmetic shift right divides by 4 with sign extension and changes to 16bit command
                    ADD     R0,R1,R0,LSR 31     // 1 clock cycle(s) Adds the signed bit of dividend to the value
                    BX      LR                  //Return

                    .global MyUDIVby13          //Function Header
                    .thumb_func
                    .align
MyUDIVby13:         LDR     R1,=0x4EC4EC4F      // 2 clock cycle(s) Loads a constant (2^34/13)
                    UMULL   R2,R1,R1,R0         // 1 clock cycle(s) Unsigned multiplication of the constant and dividend into 64bit
                    LSRS.N  R0,R1,2             // 1 clock cycle(s) Shifts right to divide by 4
                    BX      LR                  //Return

                    .end    //Ends it all
