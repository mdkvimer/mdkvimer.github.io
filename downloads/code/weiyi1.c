int max1(int a,int b){
  return b & ( (a-b) >> 31) | a & (~(a-b) >> 31);
}
int max2(int x,int y){
  return x ^ ((x^y) & -(x < y));
}
int min1(int a,int b){
  return a & ((a-b) >> 31) | b & (~(a-b) >> 31);
}
int min2(int x,int y){
  return y ^ ((x^y) & -(x < y));
}
bool isSampSign(int x,int y){
  return (x^y) >= 0;
}
int getTwo(int n){
 // 2^n
 return 2 << (n-1);
}
bool isTwo(int n){
 return n > 0 ? (n&(n-1)) == 0:false; 
}
int quyu(int m,int n){
  return m & (n-1);
}
int getAgv1(int n,int m){
 return (n+m) >> 1;
}
int getAgv2(int x,int y){
 return ((x^y) >> 1) + (x&y);
}
int getBit(int n,int m){
 return (n >> (m-1)) & 1;
}
int setBit1(int n,int m){ 
 return n | (1 << (m-1));
}
int setBit2(int n,int m){ 
 return n & ~(1 << (m-1));
}
int getnum1(int n){
  //get n+1
  return -~n;
}
int getnum2(int n){
 return ~-n;
}
int getnum3(int n){
 return ~n + 1;
}
