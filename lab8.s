//Joseph Sindelar
//Header
                    .syntax unified
                    .cpu    cortex-m4
                    .text

zero:               .float      0.0             //Creating a 0 float
                    .global FloatPoly           //Function header
                    .thumb_func
                    .align
FloatPoly:
                    VMOV    S3,1.0              //Assign a 1.0 float
                    VLDR    S4,zero             //Load 0 float
next:
                    CBZ         R1,done1        //if terms == 0 then done
                    VLDR        S1,[R0]         //Load address into S1
                    ADD         R0,R0,4         //Increment address
                    VMUL.F32    S2,S1,S3        //Multiply S1 by S3
                    VADD.F32    S4,S2,S4        //Add S2 to S4
                    SUB         R1,R1,1         //count--
                    VMUL.F32    S3,S3,S0        //Multiply S3 and S0
                    B           next            //Loop

done1:
                    VMOV S0,S4                  //prepare result for return
                    BX LR                       //Return

                    //Function Header
                    .global FixedPoly
                    .thumb_func
                    .align

FixedPoly:
                    PUSH        {R4-R7}         //Push registers
                    MOV         R3,R0           //Move x into R3
                    MOV         R0,1<<16        //Mov 1
                    LDR         R4,=0           //Load 0
                    LDR         R5,=0           //Load 0

loop:
                    CBZ         R2,done         //if terms == 0 done=
                    LDR         R6,[R1],4       //Load address into R6 then shift
                    SMLAL       R4,R5,R0,R6     //Multiply
                    SUB         R2,R2,1         //Count--
                    SMULL     	R0,R7,R0,R3     //Multiply
                    LSRS.N      R0,R0,16        //Extract
                    ORR         R0,R0,R7,LSL 16 //Extract
                    B           loop            //Loop
done:
                    LSRS.N      R0,R4,16        //Extract middle bits
                    ORR         R0,R0,R5,LSL 16 //Extract
                    POP         {R4-R7}         //Pop registers
                    BX          LR              //Return


                    .end                        //Ends it all
