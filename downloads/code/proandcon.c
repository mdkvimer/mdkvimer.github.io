#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/wait.h>
#include<sys/types.h>
#include<unistd.h>
#include<pthread.h>
#include<time.h>
#include<math.h>
#define BUFFER_SIZE 8

struct prodcons {
 int buffer[BUFFER_SIZE];
 pthread_mutex_t lock;
 int readpos,writepos;
 pthread_cond_t notempty;
 pthread_cond_t notfull;
};

void init(struct prodcons *b)
{
  pthread_mutex_init(&b->lock,NULL);
  pthread_cond_init(&b->notempty,NULL);
  pthread_cond_init(&b->notfull,NULL);
  b->readpos = 0 ;
  b->writepos = 0 ;
}

void put(struct prodcons *b,int data)
{
  pthread_mutex_lock(&b->lock);
  if((b->writepos + 1)%BUFFER_SIZE == b->readpos)
  {
    pthread_cond_wait(&b->notfull,&b->lock);
  }
  b->buffer[b->writepos] = data;
  b->writepos++;
 if(b->writepos >= BUFFER_SIZE)
     b->writepos = 0;
 pthread_cond_signal(&b->notempty);
 pthread_mutex_unlock(&b->lock);
}

int get(struct prodcons *b)
{
 int data;
 pthread_mutex_lock(&b->lock);
 if(b->writepos == b->readpos)
 {
  pthread_cond_wait(&b->notempty,&b->lock);
 }
 data = b->buffer[b->readpos];
 b->readpos++;
 
 if(b->readpos >= BUFFER_SIZE)
     b->readpos = 0;

 pthread_cond_signal(&b->notfull);
 pthread_mutex_unlock(&b->lock);
 return data;
}
#define OVER (-1)
struct prodcons buffer;
void *producer(void *data)
{
 int n;
 for(n = 0 ; n < 50 ; n++)
 {
  printf("%d\t",n);
  put(&buffer,n);
 }
 put(&buffer,OVER);
 return NULL;
}
void *consumer(void *data)
{
  int d;
  while(1) 
  {
   d = get(&buffer);
   if(d == OVER)
       break;
   printf("%d\t",d);
  }
  return NULL;
}
int main(void)
{
  pthread_t th_a,th_b;
  void *retval;
  init(&buffer);
  pthread_create(&th_a,NULL,producer,0);
  pthread_create(&th_b,NULL,consumer,0);
  pthread_join(th_a,&retval);
  pthread_join(th_b,&retval);
  printf("\n");
  return 0;
}
