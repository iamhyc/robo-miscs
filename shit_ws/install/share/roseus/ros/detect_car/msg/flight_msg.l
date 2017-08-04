;; Auto-generated. Do not edit!


(when (boundp 'detect_car::flight_msg)
  (if (not (find-package "DETECT_CAR"))
    (make-package "DETECT_CAR"))
  (shadow 'flight_msg (find-package "DETECT_CAR")))
(unless (find-package "DETECT_CAR::FLIGHT_MSG")
  (make-package "DETECT_CAR::FLIGHT_MSG"))

(in-package "ROS")
;;//! \htmlinclude flight_msg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass detect_car::flight_msg
  :super ros::object
  :slots (_type _data ))

(defmethod detect_car::flight_msg
  (:init
   (&key
    ((:type __type) 0)
    ((:data __data) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _data __data)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; int16 _type
    2
    ;; geometry_msgs/Vector3 _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _type
       (write-word _type s)
     ;; geometry_msgs/Vector3 _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _type
     (setq _type (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; geometry_msgs/Vector3 _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(setf (get detect_car::flight_msg :md5sum-) "479f5e7156bf9518d1a9151816bb4bd6")
(setf (get detect_car::flight_msg :datatype-) "detect_car/flight_msg")
(setf (get detect_car::flight_msg :definition-)
      "int16 type
geometry_msgs/Vector3 data
================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :detect_car/flight_msg "479f5e7156bf9518d1a9151816bb4bd6")


