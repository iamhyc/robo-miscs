;; Auto-generated. Do not edit!


(when (boundp 'vision_unit::SetGoal)
  (if (not (find-package "VISION_UNIT"))
    (make-package "VISION_UNIT"))
  (shadow 'SetGoal (find-package "VISION_UNIT")))
(unless (find-package "VISION_UNIT::SETGOAL")
  (make-package "VISION_UNIT::SETGOAL"))
(unless (find-package "VISION_UNIT::SETGOALREQUEST")
  (make-package "VISION_UNIT::SETGOALREQUEST"))
(unless (find-package "VISION_UNIT::SETGOALRESPONSE")
  (make-package "VISION_UNIT::SETGOALRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass vision_unit::SetGoalRequest
  :super ros::object
  :slots (_target_pose ))

(defmethod vision_unit::SetGoalRequest
  (:init
   (&key
    ((:target_pose __target_pose) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _target_pose __target_pose)
   self)
  (:target_pose
   (&rest __target_pose)
   (if (keywordp (car __target_pose))
       (send* _target_pose __target_pose)
     (progn
       (if __target_pose (setq _target_pose (car __target_pose)))
       _target_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _target_pose
    (send _target_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _target_pose
       (send _target_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _target_pose
     (send _target_pose :deserialize buf ptr-) (incf ptr- (send _target_pose :serialization-length))
   ;;
   self)
  )

(defclass vision_unit::SetGoalResponse
  :super ros::object
  :slots (_current_pose ))

(defmethod vision_unit::SetGoalResponse
  (:init
   (&key
    ((:current_pose __current_pose) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _current_pose __current_pose)
   self)
  (:current_pose
   (&rest __current_pose)
   (if (keywordp (car __current_pose))
       (send* _current_pose __current_pose)
     (progn
       (if __current_pose (setq _current_pose (car __current_pose)))
       _current_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _current_pose
    (send _current_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _current_pose
       (send _current_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _current_pose
     (send _current_pose :deserialize buf ptr-) (incf ptr- (send _current_pose :serialization-length))
   ;;
   self)
  )

(defclass vision_unit::SetGoal
  :super ros::object
  :slots ())

(setf (get vision_unit::SetGoal :md5sum-) "67dc0e3d032b7d90656c7a23574fcdcb")
(setf (get vision_unit::SetGoal :datatype-) "vision_unit/SetGoal")
(setf (get vision_unit::SetGoal :request) vision_unit::SetGoalRequest)
(setf (get vision_unit::SetGoal :response) vision_unit::SetGoalResponse)

(defmethod vision_unit::SetGoalRequest
  (:response () (instance vision_unit::SetGoalResponse :init)))

(setf (get vision_unit::SetGoalRequest :md5sum-) "67dc0e3d032b7d90656c7a23574fcdcb")
(setf (get vision_unit::SetGoalRequest :datatype-) "vision_unit/SetGoalRequest")
(setf (get vision_unit::SetGoalRequest :definition-)
      "geometry_msgs/PoseStamped target_pose

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
geometry_msgs/PoseStamped current_pose


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get vision_unit::SetGoalResponse :md5sum-) "67dc0e3d032b7d90656c7a23574fcdcb")
(setf (get vision_unit::SetGoalResponse :datatype-) "vision_unit/SetGoalResponse")
(setf (get vision_unit::SetGoalResponse :definition-)
      "geometry_msgs/PoseStamped target_pose

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
geometry_msgs/PoseStamped current_pose


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :vision_unit/SetGoal "67dc0e3d032b7d90656c7a23574fcdcb")


