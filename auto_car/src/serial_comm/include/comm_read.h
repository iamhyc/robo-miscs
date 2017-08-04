#ifndef COMMREAD_H
#define COMMREAD_H

#include <serial_comm/car_speed.h>
#include <fstream>
#include <iostream>
#include <sstream>
#include <sys/types.h>
#include <sys/stat.h>
#include <memory>
#include <vector>
#include <string>
#include <math.h>
#include <fcntl.h>      /*file control lib*/
#include <termios.h>    /*PPSIX terminal*/
#include <errno.h>      /*error information*/
#include <stdlib.h>     /*standard lib*/
#include <unistd.h>     /*Unix standard func*/

namespace autocar
{
namespace serial_mul
{
typedef struct
{
  uint8_t sof;//(MPU6050 data?)
  int16_t angle;//pose angle(reference???)
  int16_t v_w;//velocity of rotate
  int16_t v_x;//velocity of x-axis
  int16_t v_y;//velocity of y-axis


  uint8_t flag;//(seems like UWB data format)
  uint32_t x;//(seems like UWB data format)
  uint32_t y;//(seems like UWB data format)
  uint32_t z;//(seems like UWB data format)
  uint32_t compass;//(seems like UWB data format)
  uint8_t data_status;//???

  float pan_title_yaw;//yun_tai_yaw(z-axis)
  float pan_title_pitch;//yun_tai_pitch(x-axis)
  uint8_t end;//fixed: 0xFE
}__attribute__((packed)) data_t;

class comm_read{
public:
  comm_read();
  ~comm_read();
  /**
   * @brief Initialization the serial paramters for reading data
   * @return
   */
  bool read_setup();
  /**
   * @brief initialization the yaw angle
   */
  void read_init();
  /**
   * @brief reading data from serial
   */
  void read_data();
public:
  serial_comm::car_speed pubData;
private:
  std::string dev;
  int serial_baudrate;
  int fd;
  int data_len;
  int16_t ForeBack, LeftRight, Y, R;
  double YawAngle, Rotate;
  int16_t init_yaw;
  data_t data;
};

}
}
#endif // COMMREAD_H
