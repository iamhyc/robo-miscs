#include <unistd.h>  
#include <stdlib.h>  
#include <stdio.h>  
#include <string.h>  
#include <sys/msg.h>  
#include <errno.h>  

#define PIPE_BUFSIZ (256)
    
struct msg_st  
{  
    long int msg_type;  
    char text[PIPE_BUFSIZ];  
};  

inline int mes_open(key_t flag){
    return msgget((key_t)1234, 0666 | IPC_CREAT);
}


inline int mes_write(int pHandle,const char* message){
    struct msg_st data;
    data.msg_type = 1;    //注意2  
    strcpy(data.text, message);
    return msgsnd(pHandle, (void*)&data, PIPE_BUFSIZ, 0);
}
inline const char* mes_read(int pHandle){
    static struct msg_st data;
    if(msgrcv(pHandle, (void*)&data, PIPE_BUFSIZ, 0, 0) >=0){
        return data.text;
}else{
        return 0;
    }
}
