int getMaxInt1(){
  return ( 1 << 31 ) - 1; //优先级括号不能省略
}
int getMaxInt2(){
  return ~( 1 << 31 );
}
int getMaxInt3(){
  return ( 1 << -1 ) - 1;  //gcc 不支持
}
int getMaxInt4(){
  return ( (unsigned int) - 1 ) >> 1;
}
int getMinInt5(){
  return 1 << 31; //获取int类型的最小值
}
int getMinInt6(){
  return 1 << -1; //gcc 不支持
}
int getMaxLong(){
  return ((unsigned long) - 1 ) >> 1;
}
int getMinLong(){
  return 1 << 63;
}
int mulTwo(int n){
   return n << 1;
}
int divTwo(int n){
  return n >> 1;
}
int mulTwoPower(int n,int m){
 //n*(2^m)
  return n << m;
}
int divTwoPower(int n,int m){
 //n/(2^m)
  return n >> m;
}
bool isOddNumber(int n){
  return (n & 1) == 1;
}
void swap1(int a,int b){
 a ^= b;
 b ^= a;
 a ^= b;
 cout<<a<<" "<<b<<endl;
}
void swap2(int *a,int *b){
 (*a) ^= (*b) ^= (*a) ^= (*b); 
}
int abs(int n){
  return (n^( n >> 31 )) -( n >> 31 );
}
