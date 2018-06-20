//Joseph Sindelar
//Header
            .syntax unified
            .cpu    cortex-m4
            .text

//Function Header
            .global Ten32
            .thumb_func
            .align
Ten32:      LDR      R0,=10 //Assigns value to register
            BX       LR     //Returns

            .global Ten64 //Function Header
            .thumb_func
            .align
Ten64:      LDR      R0,=10 //Assigns value to register
            LDR      R1,=0  //Adds in the most significant bits as 0 to make value 64 bits
            BX       LR     //Returns


            .global Incr //Function header
            .thumb_func
            .align
Incr:       ADD     R0,R0,1 //Add 1 to the value in R0
            BX      LR  //Returns


            .global Nested1 //Function header
            .thumb_func
            .align
Nested1:    PUSH    {LR} //Pushes Link Register to the stack
            BL      rand    //Calls nested function
            ADD     R0,R0,1 //Add one to the value stored in R0
            POP     {PC}    //Pops the program counter to return


            .global Nested2 //Function header
            .thumb_func
            .align
Nested2:    PUSH    {R4,LR} //Pushes the stack again, except this time we need a register to copy
            BL      rand //Function call
            MOV     R4,R0 //Copies the result to R4
            BL      rand //Second function call
            ADD     R0,R0,R4 //Adds
            POP     {R4,PC} //Returns

            .global PrintTwo    //Function header
            .thumb_func
            .align
PrintTwo:   PUSH    {R4,R5,LR} //Pushes the stack, this time we need to copy two variables
            MOV     R4,R0   //Copies R0 to R4
            MOV     R5,R1   //Copies R1 to R5
            BL      printf  //Function calls
            ADD     R1,R5,1 //Adds
            MOV     R0,R4   //Copies the format
            BL      printf  //Function call
            POP     {R4,R5,PC}  //Returns again


            .end    //Ends it all
