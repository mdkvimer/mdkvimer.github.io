/*
 * =====================================================================================
 *
 *       Filename:  memblockman.c
 *
 *    Description:  memory control
 *
 *        Version:  1.0
 *        Created:  2012年12月31日 14时21分14秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  ACman mdk (Orz Linux Sir Koma linyu zhujiajun), mdk@server.example.com
 *        Company:  ACM 309 JudgeOnline
 *
 * =====================================================================================
 */
/*进入程序后可以根据菜单项进入不同的模块*/
/*1.使用首次适应算法分配空间            */
/*2.使用最佳适应算法分配空间            */
/*3.释放一块内存空间                    */
/*4.显示内存分配情况                    */
/*5.退出系统                            */
/*--------------------------------------*/
#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
#include<sys/wait.h>
#include<sys/types.h>
#define MEMSIZE 100  /*定义内存大小为100*/
#define MINSIZE 2   /*分配时如果剩余小于此值则不再分配*/
typedef struct MemoryInformation{
  int start; /*开始的地址*/
  int size; /*大小*/
  char info; /*状态:f空闲(FREE):'u'占用(USED):'e'表结束(END)*/
}MEMINFO;
MEMINFO MemList[MEMSIZE];
void Display();
/*-----------------------*/
/*函数名：InitAll()      */
/*功能:初始化所有变量    */
/*-----------------------*/
void InitAll()
{
  int i;
  MEMINFO temp={0,0,'e'};
  for(i=0;i<MEMSIZE;i++)
      MemList[i]=temp;
  MemList[0].start = 0;
  MemList[0].size = MEMSIZE;
  MemList[0].info = 'f';
}
/*--------------------------------*/
/*函数名:FirstFit_new()          */
/*功能：使用首次适应算法分配内存*/
/*------------------------------*/
void FirstFit_new()
{
 int i,j,size;
 char temp[10];
 printf("How MAny MEMORY do you require?");
 scanf("%d",&size);
 for(i=0;i < MEMSIZE -1 && MemList[i].info!='e';i++){
  if(MemList[i].size >= size && MemList[i].info=='f'){
    if(MemList[i].size - size <= MINSIZE)
        MemList[i].info='u';
    else{
      for(j=MEMSIZE - 2;j > i;j--){
       MemList[j+1] = MemList[j];
      }
      MemList[i+1].start = MemList[i].start + size;
      MemList[i+1].size = MemList[i].size - size;
      MemList[i+1].info = 'f';
      MemList[i].size = size;
      MemList[i].info = 'u';
    }
    break;
  }
 }
  if(i == MEMSIZE - 1 || MemList[i].info == 'e'){
    printf("NOT Enough Memory!\n");
    getchar();
  }
  Display();
}
/*------------------------------*/
/*函数名：BestFit_new()         */
/*功能：使用最佳适应算法分配内存*/
/*------------------------------*/
void BestFit_new()
{
  int i,j,k,flag,size;
  char temp[10];
  printf("How Many MEMORY require?");
  scanf("%d",&size);
  j = 0;
  flag = 0;
  k = MEMSIZE;
  for(i=0;i<MEMSIZE - 1 && MemList[i].info!='e';i++){
   if(MemList[i].size >= size && MemList[i].info == 'f'){
    flag = 1;
    if(MemList[i].size < k){
     k = MemList[i].size;
     j = i;
    }
   }
  }
  i=j;
  if(flag == 0)
  {
    printf("NOT ENOUGH Memory!\n");
    getchar();
  }
  else if(MemList[i].size - size <= MINSIZE)
      MemList[i].info = 'u';
  else{
   for(j=MEMSIZE-2;j > i;j--){
    MemList[j+1]=MemList[j];
   }
   MemList[i].start = MemList[i].start + size;
   MemList[i].size = MemList[i].size - size;
   MemList[i].info = 'f';
   MemList[i].size = size;
   MemList[i].info = 'u';
  }
  Display();
}
/*------------------------*/
/*函数名：del()          */
/*功能:释放一块内存      */
/*-----------------------*/
void del()
{
  int i,number;
  printf("please input the NUMBER you want to delete:");
  scanf("%d",&number);
  if(MemList[number].info == 'u'){
   MemList[number].info = 'f';
   if(MemList[number+1].info=='f'){
    MemList[number].size += MemList[number+1].size;
        for(i=number+1;i<MEMSIZE - 1 && MemList[i].info!='e';i++)
            MemList[i]=MemList[i+1];
   }
   if(MemList[number - 1].info != 'f'){
    MemList[number -1].size += MemList[number].size; 
        for(i=number;i<MEMSIZE - 1 && MemList[i].info!='e';i++)
            MemList[i]=MemList[i+1];
   }
  }
  else{
   printf("This number is NOT exits or is NOT sued!\n");
   getchar();
  }
  Display();
}
/*---------------------------*/
/*函数名:Display()           */
/*功能:显示内存状态          */
/*---------------------------*/
void Display()
{
  int i,used = 0;
  printf("\n------------------------------------------\n");
  printf("%5s %15s %15s","Number","Start","Size","info");
  printf("\n------------------------------------------\n");
  for(i=0;i<MEMSIZE && MemList[i].info != 'e';i++){
    if(MemList[i].info == 'u')
        used+= MemList[i].size;
    printf("%5d %15d %15d %15s\n",i,MemList[i].start,MemList[i].size,MemList[i].info == 'u'?"USED":"FREE");
  }
  printf("\n------------------------------------------\n");
  printf("TotalSize : %-10d Used: %-10d Free:%-10d\n",MEMSIZE,used,MEMSIZE - used);
  printf("\n\nPress Any Key to Return\n");
  getchar();
}
/*----------------*/
/*函数名;main()   */
/*功能:主函数     */
/*----------------*/
int main()
{
  char ch;
  InitAll();
  while(1)
  {
    printf("   Memory manager  \n");
    printf("================================================\n");
    printf("1. Get a block use the FIRSTFIT method\n");
    printf("2. Get a block use the BESTFFIT method\n");
    printf("3. Free or delete a block\n");
    printf("4. Display Mem information\n");  
    printf("5. Exit\n");
    printf("================================================\n");
    ch = getchar();
    switch(ch){
        case '1':
            FirstFit_new();
            break;
        case '2':
            BestFit_new();
            break;
        case '3':
            del();
            break;
        case '4':
            Display();
            break;
        case '5':
            exit(0);
    }
  }
}
