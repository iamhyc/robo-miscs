#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <tf_tree/tf_factory.h>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "robot_tf_publisher");
    ros::NodeHandle n;
    ros::Rate r(100);//advertise@100Hz
    tf::TransformBroadcaster broadcaster;
    autocar::tf_mul::tf_factory lidar_tf;
    lidar_tf.create_tf();
    tf::Quaternion quaternion = lidar_tf.get_rotate();//fixed(0, 0, 0, 1)
    tf::Vector3 trans = lidar_tf.get_transf();//fixed(-0.1, 0.0, 0.1)

    while(n.ok())
    {
        //发布固定的lidar相对base_link的相对坐标
        broadcaster.sendTransform(tf::StampedTransform(tf::Transform(quaternion, trans), ros::Time::now(), "base_link", "laser"));
        r.sleep();
    }
}
