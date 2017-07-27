#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <iostream>
#include <string>

#define k_udp_port 18300
inline int k_master_udp_open(){
    //it's does not need to do anything here. 
    return 0;
}
inline int k_master_send(const std::string s){

	struct sockaddr_in beat_remote_addr;
	bzero(&beat_remote_addr, sizeof(beat_remote_addr));
	beat_remote_addr.sin_family = AF_INET;
	beat_remote_addr.sin_port = htons(k_udp_port);
	inet_pton(AF_INET, "127.0.0.1", &beat_remote_addr.sin_addr);;
    int sb_socket = socket(AF_INET, SOCK_DGRAM, 0);    
    int sendl = 0;
    sendto(sb_socket, s.c_str(), s.length(), 0,
            (struct sockaddr *)&beat_remote_addr,
            sizeof(beat_remote_addr));
    close(sb_socket);    
    return sendl;
}

inline int k_slave_open(){
    int mysocket = socket(AF_INET, SOCK_DGRAM, 0);
    static struct sockaddr_in remote_addr;
    static unsigned int socklen;
    struct sockaddr_in server_addr;
	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(k_udp_port);
	inet_pton(AF_INET, "127.0.0.1", &server_addr.sin_addr);;
 	if (bind(mysocket, (struct sockaddr *) &server_addr, sizeof(server_addr))
			< 0) {
        std::cout << "open err" << std::endl;
        close(mysocket);
		return 0;
	}else{
        std::cout << "udp bind... 127.0.0.1:" << k_udp_port<<std::endl;
	 	return mysocket;
    }
}
inline const std::string k_slave_read(int mysocket){
    #define EXAMPLE_DEFAULT_PKTSIZE 1024
	static char databuff[EXAMPLE_DEFAULT_PKTSIZE+1];
	databuff[EXAMPLE_DEFAULT_PKTSIZE] = 0;
	while (1) {
		int len = recv(mysocket, databuff, EXAMPLE_DEFAULT_PKTSIZE, 0);
		if (len > 0) {
			std::string w = databuff;
			return w;
		} else {

		}
	} 
}

inline int k_slave_close(int mysocket){
	close(mysocket);
	return 0;
}
