
(cl:in-package :asdf)

(defsystem "detect_car-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "flight_msg" :depends-on ("_package_flight_msg"))
    (:file "_package_flight_msg" :depends-on ("_package"))
  ))