#include <stdio.h>
#include <dlfcn.h>
//void mything();
int asm_main(int argc, char *argv[]);
/*
void mytest() {
    asm
    (   ".intel_syntax;"
        "mov %0, 1;"
        ".att_syntax;"
        : "=r"(temp)
        :                 
    );
}*/
int var=5;

int main(int argc, char *argv[]) {
    printf("Start %i\n",var);
   //mything();
  //printf("%u\n",(unsigned int)argv);
  
 
//  char b[12]="./libmy.so";
//  printf("%u %u %u\n",*((unsigned int *)b),*((unsigned int *)&b[4]),*((unsigned int *)&b[8]) );
  /*
    void *x=dlopen("./libmy.so", RTLD_LAZY);
  

    void (*f)();
  
    if (!x) {
        fprintf(stderr, "a%s\n", dlerror());
       return 0;
    }
    f = dlsym(x, "myfunc");
  
    char *error;
    
   if ((error = dlerror()) != NULL)  {
      fprintf(stderr, "b%s\n", error);
      return 0;
  }

 
   (*f)();
   dlclose(x);*/
   

    return asm_main(argc,argv);
}