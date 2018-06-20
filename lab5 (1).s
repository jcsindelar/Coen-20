//Joseph Sindelar
//Header
                    .syntax unified
                    .cpu    cortex-m4
                    .text

//Function Header
                    .global DeleteItem
                    .thumb_func
                    .align
DeleteItem:         SUB     R12,R1,R2       //Finding the number of iterations
                    SUB     R12,R12,1       //Accounting for 0
                    ADD     R0,R0,R2,LSL 2  //Moving our pointer
Loop1:              CMP     R12,0           //Comparison for loop
                    BLE     DONE            //Break
                    LDR     R3,[R0,4]       //Loading value infront of pointer
                    STR     R3,[R0],4       //Into the previous location
                    SUB     R12,R12,1       //Decrement count
                    B       Loop1           //Return to top of loop
DONE:               SUB     R1,R1,1         //Decrementing the number of items
                    BX      LR              //Return

                    .global InsertItem      //Function Header
                    .thumb_func
                    .align
InsertItem:         SUB     R12,R1,R2       //Finding number of iterations
                    SUB     R12,R12,1       //Accounting for 0
                    SUB     R1,R1,1         //Decrementing the number of items to avoid going beyond the array
                    ADD     R0,R0,R1,LSL 2  //Moving pointer
Loop2:              CMP     R12,0           //Comparison for loop
                    BLE     DONE1           //Break
                    LDR     R1,[R0,-4]      //Moving item behind the pointer
                    STR     R1,[R0],-4      //Into the location of the pointer
                    SUB     R12,R12,1       //Decrement count
                    B       Loop2           //Return to top of loop
DONE1:              STR     R3,[R0]         //Store the value into the location of the pointer
                    BX      LR              //Return

                    .end    //Ends it all
