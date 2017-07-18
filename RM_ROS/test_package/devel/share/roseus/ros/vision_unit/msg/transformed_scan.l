;; Auto-generated. Do not edit!


(when (boundp 'vision_unit::transformed_scan)
  (if (not (find-package "VISION_UNIT"))
    (make-package "VISION_UNIT"))
  (shadow 'transformed_scan (find-package "VISION_UNIT")))
(unless (find-package "VISION_UNIT::TRANSFORMED_SCAN")
  (make-package "VISION_UNIT::TRANSFORMED_SCAN"))

(in-package "ROS")
;;//! \htmlinclude transformed_scan.msg.html


(defclass vision_unit::transformed_scan
  :super ros::object
  :slots (_dist _angle ))

(defmethod vision_unit::transformed_scan
  (:init
   (&key
    ((:dist __dist) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:angle __angle) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _dist __dist)
   (setq _angle __angle)
   self)
  (:dist
   (&optional __dist)
   (if __dist (setq _dist __dist)) _dist)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float32[] _dist
    (* 4    (length _dist)) 4
    ;; float32[] _angle
    (* 4    (length _angle)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _dist
     (write-long (length _dist) s)
     (dotimes (i (length _dist))
       (sys::poke (elt _dist i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _angle
     (write-long (length _angle) s)
     (dotimes (i (length _angle))
       (sys::poke (elt _angle i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _dist
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _dist (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _dist i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _angle
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angle (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _angle i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get vision_unit::transformed_scan :md5sum-) "d04f633fb6d830034a14d1a39c7655c7")
(setf (get vision_unit::transformed_scan :datatype-) "vision_unit/transformed_scan")
(setf (get vision_unit::transformed_scan :definition-)
      "float32[] dist
float32[] angle

")



(provide :vision_unit/transformed_scan "d04f633fb6d830034a14d1a39c7655c7")


