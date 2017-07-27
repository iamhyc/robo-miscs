#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include "udp_packet.h"

void udp_init()
{
	local_addr.sin_family = AF_INET;
    local_addr.sin_port = htons(LOCAL_PORT);
    local_addr.sin_addr.s_addr = htonl(INADDR_ANY);

    remote_addr.sin_family = AF_INET;
    remote_addr.sin_port = htons(REMOTE_PORT);
    remote_addr.sin_addr.s_addr = inet_addr(REMOTE_ADDR);

    if ((udp_socket = socket(AF_INET, SOCK_DGRAM, 0)) < 0 )
    {
    	perror("socket open error.");
    	exit(1);
    }

    if (bind(udp_socket, (struct sockaddr *)&local_addr, sizeof(local_addr)) < 0)
    {
        perror("socket local port bind error.");
        exit(1);
    }
}

int udp_packet_tx(char* buff)
{
	int rs;
	rs = sendto(udp_socket, buff, strlen(buff), 0, \
		(struct sockaddr *)&remote_addr, sizeof(remote_addr));
	if (rs < 0)
		perror("packet send error.");
	printf("%s\n", buff);
	return rs;
}

int main(int argc, char const *argv[])
{
	udp_init();
	udp_packet_tx("this is a test message witouht case sensitivity.");
	return 0;
}