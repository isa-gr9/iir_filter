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
  static int sw1[4], sw2[4], sw3[4], sw4[4], sw5[4], sw6[4], sw7[4], sw8[4], sw9[4], sw10[4],sw11[4], sw12[4];/// w shift register
  static int first_run = 0; /// for cleaning the shift register
  int i; /// index
  int a, b, c, d, e, f, g, h, j, s, m; 
  int y; /// output sample
  int fb, ff1, ff2;

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
      sw10[i] = 0;
      sw11[i] = 0;
      sw12[i] = 0;
  }


  // compute feed-back and feed-forward
  fb=ff1=ff2=0;
  //feedforward 1
  a = ((sw1[0]*ai) >> SHAMT) << (SHAMT-NB+1);
  ff1 += sw2[0];

  b = sw1[0]-ff1;
  c = sw3[0]+fb;

  //feedback
  //d = sw4[0];
  s = ((ai*ai) >> SHAMT) << (SHAMT-NB+1);
  e = ((sw5[0]*s) >> SHAMT) << (SHAMT-NB+1);
  f = sw6[0];
  fb -= sw7[0];

  //feedforward 2
  g = ((sw4[0]*bi) >> SHAMT) << (SHAMT-NB+1);
  h = sw8[0];
  j = sw9[0];
  e = sw10[0];
  ff2 += sw11[0];
  m = ((sw4[0]*bi0) >> SHAMT) << (SHAMT-NB+1);
  y = sw12[0];

  //Output
  y += ff2;

  /// update the shift register
  for (i=NTm1; i>0; i--)
    sw1[i] = sw1[i-1];
  sw1[0] = x;

  for (i=NTm1; i>0; i--)
    sw2[i] = sw2[i-1];
  sw2[0] = a;

  for (i=NTm1; i>0; i--)
    sw3[i] = sw3[i-1];
  sw3[0] = b;

  for (i=NTm1; i>0; i--)
    sw4[i] = sw4[i-1];
  sw4[0] = c;

  for (i=NTm1; i>0; i--)
    sw5[i] = sw5[i-1];
  sw5[0] = c;
 
  for (i=NTm1; i>0; i--)
    sw6[i] = sw6[i-1];
  sw6[0] = e;

  for (i=NTm1; i>0; i--)
    sw7[i] = sw7[i-1];
  sw7[0] = f;

  for (i=NTm1; i>0; i--)
    sw8[i] = sw8[i-1];
  sw8[0] = g;

  for (i=NTm1; i>0; i--)
    sw9[i] = sw9[i-1];
  sw9[0] = h;

  for (i=NTm1; i>0; i--)
    sw10[i] = sw10[i-1];
  sw9[0] = j;

  for (i=NTm1; i>0; i--)
    sw11[i] = sw11[i-1];
  sw11[0] = e;

  for (i=NTm1; i>0; i--)
    sw12[i] = sw12[i-1];
  sw12[0] = m;

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
