;; Auto-generated. Do not edit!


(when (boundp 'serial_comm::car_speed)
  (if (not (find-package "SERIAL_COMM"))
    (make-package "SERIAL_COMM"))
  (shadow 'car_speed (find-package "SERIAL_COMM")))
(unless (find-package "SERIAL_COMM::CAR_SPEED")
  (make-package "SERIAL_COMM::CAR_SPEED"))

(in-package "ROS")
;;//! \htmlinclude car_speed.msg.html


(defclass serial_comm::car_speed
  :super ros::object
  :slots (_angle _v_x _v_y _v_r _yaw ))

(defmethod serial_comm::car_speed
  (:init
   (&key
    ((:angle __angle) 0.0)
    ((:v_x __v_x) 0.0)
    ((:v_y __v_y) 0.0)
    ((:v_r __v_r) 0.0)
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _angle (float __angle))
   (setq _v_x (float __v_x))
   (setq _v_y (float __v_y))
   (setq _v_r (float __v_r))
   (setq _yaw (float __yaw))
   self)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:v_x
   (&optional __v_x)
   (if __v_x (setq _v_x __v_x)) _v_x)
  (:v_y
   (&optional __v_y)
   (if __v_y (setq _v_y __v_y)) _v_y)
  (:v_r
   (&optional __v_r)
   (if __v_r (setq _v_r __v_r)) _v_r)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; float64 _angle
    8
    ;; float64 _v_x
    8
    ;; float64 _v_y
    8
    ;; float64 _v_r
    8
    ;; float64 _yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v_x
       (sys::poke _v_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v_y
       (sys::poke _v_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v_r
       (sys::poke _v_r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v_x
     (setq _v_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v_y
     (setq _v_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v_r
     (setq _v_r (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get serial_comm::car_speed :md5sum-) "7a02c599e55c2d47f4d95b574a34e902")
(setf (get serial_comm::car_speed :datatype-) "serial_comm/car_speed")
(setf (get serial_comm::car_speed :definition-)
      "float64 angle
float64 v_x
float64 v_y
float64 v_r
float64 yaw

")



(provide :serial_comm/car_speed "7a02c599e55c2d47f4d95b574a34e902")


