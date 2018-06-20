//Joseph Sindelar
//Header
                    .syntax unified
                    .cpu    cortex-m4
                    .text

//Function Header
                    .global PixelAddress
                    .thumb_func
                    .align
PixelAddress:       LDR     R2,=240         //Assign 240 to R2
                    MLA     R0,R2,R1,R0     //Performs given equation
                    LDR     R3,=0xD0000000  //Assigns starting address
                    ADD     R0,R3,R0,LSL 2  //Adds starting displacement, shifts by bytes
                    BX      LR

                    .global BitmapAddress //Function Header
                    .thumb_func
                    .align
BitmapAddress:      SUBS    R0,R0,32        //Adjust for first ASCI displacement
                    ADDS    R3,R3,7         //Follow given equation
                    LSR     R3,R3,3         //Divide by 8
                    MUL     R3,R3,R2        //Multiply height and width
                    MLA     R0,R0,R3,R1     //Multiply area by character displacement, add font table displacement
                    BX      LR

                    .global GetBitmapRow //Function header
                    .thumb_func
                    .align

GetBitmapRow:       LDR     R0,[R0]
                    REV     R0,R0
                    BX      LR

                    .end    //Ends it all
