; Auto-generated. Do not edit!


(cl:in-package detect_car-msg)


;//! \htmlinclude flight_msg.msg.html

(cl:defclass <flight_msg> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass flight_msg (<flight_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <flight_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'flight_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name detect_car-msg:<flight_msg> is deprecated: use detect_car-msg:flight_msg instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <flight_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader detect_car-msg:type-val is deprecated.  Use detect_car-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <flight_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader detect_car-msg:data-val is deprecated.  Use detect_car-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <flight_msg>) ostream)
  "Serializes a message object of type '<flight_msg>"
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <flight_msg>) istream)
  "Deserializes a message object of type '<flight_msg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<flight_msg>)))
  "Returns string type for a message object of type '<flight_msg>"
  "detect_car/flight_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'flight_msg)))
  "Returns string type for a message object of type 'flight_msg"
  "detect_car/flight_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<flight_msg>)))
  "Returns md5sum for a message object of type '<flight_msg>"
  "479f5e7156bf9518d1a9151816bb4bd6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'flight_msg)))
  "Returns md5sum for a message object of type 'flight_msg"
  "479f5e7156bf9518d1a9151816bb4bd6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<flight_msg>)))
  "Returns full string definition for message of type '<flight_msg>"
  (cl:format cl:nil "int16 type~%geometry_msgs/Vector3 data~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'flight_msg)))
  "Returns full string definition for message of type 'flight_msg"
  (cl:format cl:nil "int16 type~%geometry_msgs/Vector3 data~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <flight_msg>))
  (cl:+ 0
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <flight_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'flight_msg
    (cl:cons ':type (type msg))
    (cl:cons ':data (data msg))
))
