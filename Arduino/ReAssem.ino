int ReAssem(int Array[],int LengthofArray) {

int NewArray[6];
int l = LengthofArray;
int i = 0;
int a = 1;

    while (SizeOf(NewArray) < (l-1)/2) {
      NewArray[i] = Array[a]*256 + Array[a+1];
      i++;
      a = a+2;
    }
  return NewArray
}
