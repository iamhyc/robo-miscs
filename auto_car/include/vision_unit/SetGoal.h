// Generated by gencpp from file vision_unit/SetGoal.msg
// DO NOT EDIT!


#ifndef VISION_UNIT_MESSAGE_SETGOAL_H
#define VISION_UNIT_MESSAGE_SETGOAL_H

#include <ros/service_traits.h>


#include <vision_unit/SetGoalRequest.h>
#include <vision_unit/SetGoalResponse.h>


namespace vision_unit
{

struct SetGoal
{

typedef SetGoalRequest Request;
typedef SetGoalResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetGoal
} // namespace vision_unit


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::vision_unit::SetGoal > {
  static const char* value()
  {
    return "67dc0e3d032b7d90656c7a23574fcdcb";
  }

  static const char* value(const ::vision_unit::SetGoal&) { return value(); }
};

template<>
struct DataType< ::vision_unit::SetGoal > {
  static const char* value()
  {
    return "vision_unit/SetGoal";
  }

  static const char* value(const ::vision_unit::SetGoal&) { return value(); }
};


// service_traits::MD5Sum< ::vision_unit::SetGoalRequest> should match 
// service_traits::MD5Sum< ::vision_unit::SetGoal > 
template<>
struct MD5Sum< ::vision_unit::SetGoalRequest>
{
  static const char* value()
  {
    return MD5Sum< ::vision_unit::SetGoal >::value();
  }
  static const char* value(const ::vision_unit::SetGoalRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::vision_unit::SetGoalRequest> should match 
// service_traits::DataType< ::vision_unit::SetGoal > 
template<>
struct DataType< ::vision_unit::SetGoalRequest>
{
  static const char* value()
  {
    return DataType< ::vision_unit::SetGoal >::value();
  }
  static const char* value(const ::vision_unit::SetGoalRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::vision_unit::SetGoalResponse> should match 
// service_traits::MD5Sum< ::vision_unit::SetGoal > 
template<>
struct MD5Sum< ::vision_unit::SetGoalResponse>
{
  static const char* value()
  {
    return MD5Sum< ::vision_unit::SetGoal >::value();
  }
  static const char* value(const ::vision_unit::SetGoalResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::vision_unit::SetGoalResponse> should match 
// service_traits::DataType< ::vision_unit::SetGoal > 
template<>
struct DataType< ::vision_unit::SetGoalResponse>
{
  static const char* value()
  {
    return DataType< ::vision_unit::SetGoal >::value();
  }
  static const char* value(const ::vision_unit::SetGoalResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // VISION_UNIT_MESSAGE_SETGOAL_H
