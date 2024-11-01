#include <stdio.h>
//void mything();
void anotherfunc() {
   __asm__ ("mov esi,5\n\t"
              "mov eax,5"
        :::);
}

void myfunc(int argc, char *argv[],void (*fp)()) {
    printf("hello %i '%s'\n",argc,argv[0]);
  //mything();
 //    __asm__ ("call 0x8048530" :::);
  fp();
  //char a[4]="abc";
  
  //printf("%u %u\n",*((unsigned int*)a),
  //(*(unsigned int*)&a[4]));
  
}