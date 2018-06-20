//Joseph Sindelar
//Header
            .syntax unified
            .cpu    cortex-m4
            .text

//Function Header
            .global UseLDRB
            .thumb_func
            .align
UseLDRB:    .REPT   512 //Repeats the following steps
            LDRB    R2,[R1],1 //Loads one byte
            STRB    R2,[R0],1 //Stores one byte
            .ENDR
            BX      LR //Returns

            .global UseLDRH //Function Header
            .thumb_func
            .align
UseLDRH:    .REPT   256 //Repeats the following steps
            LDRH    R2,[R1],2
            STRH    R2,[R0],2
            .ENDR
            BX      LR //Returns

            .global UseLDR //Function header
            .thumb_func
            .align
UseLDR:     .REPT   128 //Repeats the following steps
            LDR     R2,[R1],4
            STR     R2,[R0],4
            .ENDR
            BX      LR

            .global UseLDRD //Function header
            .thumb_func
            .align
UseLDRD:    .REPT   64 //Repeats the following steps
            LDRD    R2,R3,[R1],8
            STRD    R2,R3,[R0],8
            .ENDR
            BX      LR //Returns

            .global UseLDMIA //Function header
            .thumb_func
            .align
UseLDMIA:   PUSH    {R4 - R9} //Pushes registers on the stack
            .REPT   16 //Repeats the following steps
            LDMIA   R1!,{R2 - R9}
            STMIA   R0!,{R2 - R9}
            .ENDR
            POP     {R4 - R9}
            BX      LR //Returns

            .end    //Ends it all
