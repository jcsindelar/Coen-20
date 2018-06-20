#include <math.h>

void TwosComplement(const int input[8], int output[8]){
	//Declaring variables
	int i;
	int j;
	//Initial for loop to reach the first value
	for (i=0;i<8;i++){
        if(input[i]==0)
			output[i]=input[i];
        else{
            output[i]=input[i];
            i++;
            break;
        }
	}
	//Second for loop to flip the rest of the bits
	for(j=i;j<8;j++){
		if (input[j]==1)
			output[j]=0;
		else
			output[j]=1;
	}
}

float Bin2Dec(const int bin[8]){
	//Declaring variables
	int j;
	//Checking if negative
	float value=-bin[7];
	//Looping through all bits
	for (j=6;j>=0;j--)
		value= 2*value + bin[j];
	//Returning
	return value/128;
}

void Dec2Bin(const float x, int bin[8]){
	//Declaring Variables
	int i,y;
	float j=fabs(x*128);
	y=(int)j;
	//Rounding check
	if (j-y>=0.5 && y!=127)
        y++;
    //For loop to assign all bits
    for(i=0;i<8;i++){
        bin[i]=y%2;
        y/=2;
    }
    //If negative
    if(x<0)
        TwosComplement(bin, bin);
}

