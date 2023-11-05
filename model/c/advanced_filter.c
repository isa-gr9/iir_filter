#include<stdio.h>
#include<stdlib.h>

#define N 1 /// order of the filter
#define NTm1 (N) /// number of coeffients minus one (equal to the order)
#define NB 13  /// number of bits
#define SHAMT 20 /// shift amount

const int bi0 = 1723; /// coefficient b0
const int bi  = 1723; /// b array
const int ai  = -649; /// a array

/// Perform fixed point filtering assuming direct form II
///\param x is the new input sample
///\return the new output sample
int myfilter(int x)
{
  static int sw1[4], sw2[4], sw3[4], sw4[4], sw5[4], sw6[4], sw7[4], sw8[4], sw9[4]; /// w shift register
  static int first_run = 0; /// for cleaning the shift register
  int i; /// index
  int w, a, b, c, d, e, f, g, s; /// intermediate value (w)
  int y; /// output sample
  int fb, ff;

  /// clean the buffer
  if (first_run == 0)
  {
    first_run = 1;
    for (i=0; i<NTm1; i++)
      sw1[i] = 0;
      sw2[i] = 0;
      sw3[i] = 0;
      sw4[i] = 0;
      sw5[i] = 0;
      sw6[i] = 0;
      sw7[i] = 0;
      sw8[i] = 0;
      sw9[i] = 0;
  }


  /// compute feed-back and feed-forward
  fb=ff=0;
  //Evaluate values indepent from the registers
  b = ((x*bi) >> SHAMT) << (SHAMT-NB+1);
  s = ((ai*bi) >> SHAMT) << (SHAMT-NB+1);
  //feedback
  w = sw1[0]-sw3[0];
  a = ((sw2[0]*ai) >> SHAMT) << (SHAMT-NB+1);
  fb -= sw3[0];
  //feedforward
  c = ((sw2[0]*s) >> SHAMT) << (SHAMT-NB+1);
  d = sw5[0]+sw4[0];
  e = sw6[0];
  f = sw7[0];
  g = ((sw2[0]*bi0) >> SHAMT) << (SHAMT-NB+1);
  y = sw9[0];
  ff += sw8[0];
  //Output value
  y += ff;

  /// update the shift register
  for (i=NTm1; i>0; i--)
    sw1[i] = sw1[i-1];
  sw1[0] = x;

  for (i=NTm1; i>0; i--)
    sw2[i] = sw2[i-1];
  sw2[0] = w;

  for (i=NTm1; i>0; i--)
    sw3[i] = sw3[i-1];
  sw3[0] = a;

  for (i=NTm1; i>0; i--)
    sw4[i] = sw4[i-1];
  sw4[0] = b;

  for (i=NTm1; i>0; i--)
    sw5[i] = sw5[i-1];
  sw5[0] = c;
 
  for (i=NTm1; i>0; i--)
    sw6[i] = sw6[i-1];
  sw6[0] = d;

  for (i=NTm1; i>0; i--)
    sw7[i] = sw7[i-1];
  sw7[0] = e;

  for (i=NTm1; i>0; i--)
    sw8[i] = sw8[i-1];
  sw8[0] = f;

  for (i=NTm1; i>0; i--)
    sw9[i] = sw9[i-1];
  sw9[0] = g;

return y;
  
}

int main (int argc, char **argv)
{
  FILE *fp_in;
  FILE *fp_out;

  int x;
  int y;

  /// check the command line
  if (argc != 3)
  {
    printf("Use: %s <input_file> <output_file>\n", argv[0]);
    exit(1);
  }

  /// open files
  fp_in = fopen(argv[1], "r");
  if (fp_in == NULL)
  {
    printf("Error: cannot open %s\n");
    exit(2);
  }
  fp_out = fopen(argv[2], "w");

  /// check shift amount
  if (SHAMT < ((NB)-1))
  {
    printf("Error shift amount must be at least nbit-1\n");
    exit(3);
  }  

  /// get samples and apply filter
  fscanf(fp_in, "%d", &x);
  do{
    y = myfilter(x);
    fprintf(fp_out,"%d\n", y);
    fscanf(fp_in, "%d", &x);
  } while (!feof(fp_in));

  fclose(fp_in);
  fclose(fp_out);

  return 0;

}
