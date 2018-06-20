#include <math.h>

void TwosComplement(const int input[8], int output[8]){
	int i=0;
	if(input[0]==0){
		while(input[i]==0){
			output[i]=input[i];
			i++;
		}
	}
	output[i]=input[i];
	i++;
	while(i<7){
		if (input[i]==1)
			output[i]=0;
		else
			output[i]=1;
		i++;
	}
}

float Bin2Dec(const int bin[8]){
	int i,j;
	i=0;
	j=0;
	int value=0;
	if (input[0]==0){
		while(bin[i]==0 && i<6){
			i++;
	}
	for (j=0;j<6;j++)
		value=(bin[j]*2^j)
	if(bin[7]==1)
		value=value-128;
	value=value/(2^(6-i))
	return value;
}

void Dec2Bin(const float x, int bin[8]){
	int i,j;
	j=x;
	if (x<0)
		bin[7]=1;
	else
		bin[7]=0;
	for(i=0;i<6;i++){
		j*2;
		if(j>1){
			bin[i]=1;
			j=j%1;
		}
		else bin[i]=0;
	}
}





