;; Auto-generated. Do not edit!


(when (boundp 'vision_unit::armor_msg)
  (if (not (find-package "VISION_UNIT"))
    (make-package "VISION_UNIT"))
  (shadow 'armor_msg (find-package "VISION_UNIT")))
(unless (find-package "VISION_UNIT::ARMOR_MSG")
  (make-package "VISION_UNIT::ARMOR_MSG"))

(in-package "ROS")
;;//! \htmlinclude armor_msg.msg.html


(defclass vision_unit::armor_msg
  :super ros::object
  :slots (_detected _x _y _d ))

(defmethod vision_unit::armor_msg
  (:init
   (&key
    ((:detected __detected) nil)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:d __d) 0.0)
    )
   (send-super :init)
   (setq _detected __detected)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _d (float __d))
   self)
  (:detected
   (&optional __detected)
   (if __detected (setq _detected __detected)) _detected)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:serialization-length
   ()
   (+
    ;; bool _detected
    1
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _d
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _detected
       (if _detected (write-byte -1 s) (write-byte 0 s))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _d
       (sys::poke _d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _detected
     (setq _detected (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _d
     (setq _d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get vision_unit::armor_msg :md5sum-) "c146d150956b810994d3493ae1029278")
(setf (get vision_unit::armor_msg :datatype-) "vision_unit/armor_msg")
(setf (get vision_unit::armor_msg :definition-)
      "bool detected
float64 x
float64 y
float64 d

")



(provide :vision_unit/armor_msg "c146d150956b810994d3493ae1029278")


