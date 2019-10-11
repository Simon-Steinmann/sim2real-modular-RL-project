;; Auto-generated. Do not edit!


(when (boundp 'j2n6s300_ml::tfQuery)
  (if (not (find-package "J2N6S300_ML"))
    (make-package "J2N6S300_ML"))
  (shadow 'tfQuery (find-package "J2N6S300_ML")))
(unless (find-package "J2N6S300_ML::TFQUERY")
  (make-package "J2N6S300_ML::TFQUERY"))
(unless (find-package "J2N6S300_ML::TFQUERYREQUEST")
  (make-package "J2N6S300_ML::TFQUERYREQUEST"))
(unless (find-package "J2N6S300_ML::TFQUERYRESPONSE")
  (make-package "J2N6S300_ML::TFQUERYRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass j2n6s300_ml::tfQueryRequest
  :super ros::object
  :slots ())

(defmethod j2n6s300_ml::tfQueryRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass j2n6s300_ml::tfQueryResponse
  :super ros::object
  :slots (_success _joint_coordinates ))

(defmethod j2n6s300_ml::tfQueryResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:joint_coordinates __joint_coordinates) (instance geometry_msgs::PoseArray :init))
    )
   (send-super :init)
   (setq _success __success)
   (setq _joint_coordinates __joint_coordinates)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:joint_coordinates
   (&rest __joint_coordinates)
   (if (keywordp (car __joint_coordinates))
       (send* _joint_coordinates __joint_coordinates)
     (progn
       (if __joint_coordinates (setq _joint_coordinates (car __joint_coordinates)))
       _joint_coordinates)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; geometry_msgs/PoseArray _joint_coordinates
    (send _joint_coordinates :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/PoseArray _joint_coordinates
       (send _joint_coordinates :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/PoseArray _joint_coordinates
     (send _joint_coordinates :deserialize buf ptr-) (incf ptr- (send _joint_coordinates :serialization-length))
   ;;
   self)
  )

(defclass j2n6s300_ml::tfQuery
  :super ros::object
  :slots ())

(setf (get j2n6s300_ml::tfQuery :md5sum-) "00bf7357a79d1c228b9ae3c8a88c8af2")
(setf (get j2n6s300_ml::tfQuery :datatype-) "j2n6s300_ml/tfQuery")
(setf (get j2n6s300_ml::tfQuery :request) j2n6s300_ml::tfQueryRequest)
(setf (get j2n6s300_ml::tfQuery :response) j2n6s300_ml::tfQueryResponse)

(defmethod j2n6s300_ml::tfQueryRequest
  (:response () (instance j2n6s300_ml::tfQueryResponse :init)))

(setf (get j2n6s300_ml::tfQueryRequest :md5sum-) "00bf7357a79d1c228b9ae3c8a88c8af2")
(setf (get j2n6s300_ml::tfQueryRequest :datatype-) "j2n6s300_ml/tfQueryRequest")
(setf (get j2n6s300_ml::tfQueryRequest :definition-)
      "---
bool success
geometry_msgs/PoseArray joint_coordinates




================================================================================
MSG: geometry_msgs/PoseArray
# An array of poses with a header for global reference.

Header header

Pose[] poses

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

(setf (get j2n6s300_ml::tfQueryResponse :md5sum-) "00bf7357a79d1c228b9ae3c8a88c8af2")
(setf (get j2n6s300_ml::tfQueryResponse :datatype-) "j2n6s300_ml/tfQueryResponse")
(setf (get j2n6s300_ml::tfQueryResponse :definition-)
      "---
bool success
geometry_msgs/PoseArray joint_coordinates




================================================================================
MSG: geometry_msgs/PoseArray
# An array of poses with a header for global reference.

Header header

Pose[] poses

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



(provide :j2n6s300_ml/tfQuery "00bf7357a79d1c228b9ae3c8a88c8af2")


