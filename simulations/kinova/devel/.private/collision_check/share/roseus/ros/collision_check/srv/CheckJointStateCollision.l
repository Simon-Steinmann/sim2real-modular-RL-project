;; Auto-generated. Do not edit!


(when (boundp 'collision_check::CheckJointStateCollision)
  (if (not (find-package "COLLISION_CHECK"))
    (make-package "COLLISION_CHECK"))
  (shadow 'CheckJointStateCollision (find-package "COLLISION_CHECK")))
(unless (find-package "COLLISION_CHECK::CHECKJOINTSTATECOLLISION")
  (make-package "COLLISION_CHECK::CHECKJOINTSTATECOLLISION"))
(unless (find-package "COLLISION_CHECK::CHECKJOINTSTATECOLLISIONREQUEST")
  (make-package "COLLISION_CHECK::CHECKJOINTSTATECOLLISIONREQUEST"))
(unless (find-package "COLLISION_CHECK::CHECKJOINTSTATECOLLISIONRESPONSE")
  (make-package "COLLISION_CHECK::CHECKJOINTSTATECOLLISIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass collision_check::CheckJointStateCollisionRequest
  :super ros::object
  :slots (_joint_state ))

(defmethod collision_check::CheckJointStateCollisionRequest
  (:init
   (&key
    ((:joint_state __joint_state) (instance sensor_msgs::JointState :init))
    )
   (send-super :init)
   (setq _joint_state __joint_state)
   self)
  (:joint_state
   (&rest __joint_state)
   (if (keywordp (car __joint_state))
       (send* _joint_state __joint_state)
     (progn
       (if __joint_state (setq _joint_state (car __joint_state)))
       _joint_state)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/JointState _joint_state
    (send _joint_state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/JointState _joint_state
       (send _joint_state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/JointState _joint_state
     (send _joint_state :deserialize buf ptr-) (incf ptr- (send _joint_state :serialization-length))
   ;;
   self)
  )

(defclass collision_check::CheckJointStateCollisionResponse
  :super ros::object
  :slots (_success _info ))

(defmethod collision_check::CheckJointStateCollisionResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:info __info) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _info (string __info))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:info
   (&optional __info)
   (if __info (setq _info __info)) _info)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _info
    4 (length _info)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _info
       (write-long (length _info) s) (princ _info s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass collision_check::CheckJointStateCollision
  :super ros::object
  :slots ())

(setf (get collision_check::CheckJointStateCollision :md5sum-) "95d7107aa9a79f1c107abc9acf788b2f")
(setf (get collision_check::CheckJointStateCollision :datatype-) "collision_check/CheckJointStateCollision")
(setf (get collision_check::CheckJointStateCollision :request) collision_check::CheckJointStateCollisionRequest)
(setf (get collision_check::CheckJointStateCollision :response) collision_check::CheckJointStateCollisionResponse)

(defmethod collision_check::CheckJointStateCollisionRequest
  (:response () (instance collision_check::CheckJointStateCollisionResponse :init)))

(setf (get collision_check::CheckJointStateCollisionRequest :md5sum-) "95d7107aa9a79f1c107abc9acf788b2f")
(setf (get collision_check::CheckJointStateCollisionRequest :datatype-) "collision_check/CheckJointStateCollisionRequest")
(setf (get collision_check::CheckJointStateCollisionRequest :definition-)
      "sensor_msgs/JointState joint_state

================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

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
---
bool success
string info

")

(setf (get collision_check::CheckJointStateCollisionResponse :md5sum-) "95d7107aa9a79f1c107abc9acf788b2f")
(setf (get collision_check::CheckJointStateCollisionResponse :datatype-) "collision_check/CheckJointStateCollisionResponse")
(setf (get collision_check::CheckJointStateCollisionResponse :definition-)
      "sensor_msgs/JointState joint_state

================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

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
---
bool success
string info

")



(provide :collision_check/CheckJointStateCollision "95d7107aa9a79f1c107abc9acf788b2f")


