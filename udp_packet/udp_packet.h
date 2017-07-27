 #ifndef __UDP_PACKET__
#define __UDP_PACKET__

//#define LOCAL_ADDR	127.0.0.1
#define LOCAL_PORT		12345

#define REMOTE_ADDR		"192.168.0.1"
#define REMOTE_PORT		12345

#include <sys/types.h>
#include <sys/socket.h>
#include <pthread.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>

struct sockaddr_in local_addr;
struct sockaddr_in remote_addr;

int udp_socket;

int udp_packet_tx(char* buff);

#endif