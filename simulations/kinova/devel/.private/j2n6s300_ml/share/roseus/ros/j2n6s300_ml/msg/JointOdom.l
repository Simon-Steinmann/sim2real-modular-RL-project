;; Auto-generated. Do not edit!


(when (boundp 'j2n6s300_ml::JointOdom)
  (if (not (find-package "J2N6S300_ML"))
    (make-package "J2N6S300_ML"))
  (shadow 'JointOdom (find-package "J2N6S300_ML")))
(unless (find-package "J2N6S300_ML::JOINTODOM")
  (make-package "J2N6S300_ML::JOINTODOM"))

(in-package "ROS")
;;//! \htmlinclude JointOdom.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass j2n6s300_ml::JointOdom
  :super ros::object
  :slots (_header _names _poses _twist _velocity ))

(defmethod j2n6s300_ml::JointOdom
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:names __names) (let (r) (dotimes (i 0) (push (instance std_msgs::String :init) r)) r))
    ((:poses __poses) (let (r) (dotimes (i 0) (push (instance geometry_msgs::PoseArray :init) r)) r))
    ((:twist __twist) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Twist :init) r)) r))
    ((:velocity __velocity) (let (r) (dotimes (i 0) (push (instance std_msgs::Float64 :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _names __names)
   (setq _poses __poses)
   (setq _twist __twist)
   (setq _velocity __velocity)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:names
   (&rest __names)
   (if (keywordp (car __names))
       (send* _names __names)
     (progn
       (if __names (setq _names (car __names)))
       _names)))
  (:poses
   (&rest __poses)
   (if (keywordp (car __poses))
       (send* _poses __poses)
     (progn
       (if __poses (setq _poses (car __poses)))
       _poses)))
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/String[] _names
    (apply #'+ (send-all _names :serialization-length)) 4
    ;; geometry_msgs/PoseArray[] _poses
    (apply #'+ (send-all _poses :serialization-length)) 4
    ;; geometry_msgs/Twist[] _twist
    (apply #'+ (send-all _twist :serialization-length)) 4
    ;; std_msgs/Float64[] _velocity
    (apply #'+ (send-all _velocity :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/String[] _names
     (write-long (length _names) s)
     (dolist (elem _names)
       (send elem :serialize s)
       )
     ;; geometry_msgs/PoseArray[] _poses
     (write-long (length _poses) s)
     (dolist (elem _poses)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Twist[] _twist
     (write-long (length _twist) s)
     (dolist (elem _twist)
       (send elem :serialize s)
       )
     ;; std_msgs/Float64[] _velocity
     (write-long (length _velocity) s)
     (dolist (elem _velocity)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/String[] _names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _names (let (r) (dotimes (i n) (push (instance std_msgs::String :init) r)) r))
     (dolist (elem- _names)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/PoseArray[] _poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _poses (let (r) (dotimes (i n) (push (instance geometry_msgs::PoseArray :init) r)) r))
     (dolist (elem- _poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Twist[] _twist
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _twist (let (r) (dotimes (i n) (push (instance geometry_msgs::Twist :init) r)) r))
     (dolist (elem- _twist)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/Float64[] _velocity
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocity (let (r) (dotimes (i n) (push (instance std_msgs::Float64 :init) r)) r))
     (dolist (elem- _velocity)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get j2n6s300_ml::JointOdom :md5sum-) "6a11b0b66ccf504317c8c0454f9c74a7")
(setf (get j2n6s300_ml::JointOdom :datatype-) "j2n6s300_ml/JointOdom")
(setf (get j2n6s300_ml::JointOdom :definition-)
      "# A twist with reference coordinate frame and timestamp
std_msgs/Header header
std_msgs/String[] names
geometry_msgs/PoseArray[] poses
geometry_msgs/Twist[] twist
std_msgs/Float64[] velocity

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
MSG: std_msgs/String
string data

================================================================================
MSG: geometry_msgs/PoseArray
# An array of poses with a header for global reference.

Header header

Pose[] poses

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

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

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
================================================================================
MSG: std_msgs/Float64
float64 data
")



(provide :j2n6s300_ml/JointOdom "6a11b0b66ccf504317c8c0454f9c74a7")


