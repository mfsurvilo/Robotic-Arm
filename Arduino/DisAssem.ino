int DisAssem(int Array[],int LengthofArray) {

int NewArray[6];
int l = LengthofArray;
int i = 0;
int a = 1;

NewArray[0] = 1;
while (SizeOf(NewArray) < 2*l+1) {
NewArray[a] = Array[i]/256;
NewArray[a+1] = Array[i]%256;

i++;
a = a+2;
}

  return NewArray
}
