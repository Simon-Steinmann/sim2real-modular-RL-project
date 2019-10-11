; Auto-generated. Do not edit!


(cl:in-package collision_check-srv)


;//! \htmlinclude CheckJointStateCollision-request.msg.html

(cl:defclass <CheckJointStateCollision-request> (roslisp-msg-protocol:ros-message)
  ((joint_state
    :reader joint_state
    :initarg :joint_state
    :type sensor_msgs-msg:JointState
    :initform (cl:make-instance 'sensor_msgs-msg:JointState)))
)

(cl:defclass CheckJointStateCollision-request (<CheckJointStateCollision-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckJointStateCollision-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckJointStateCollision-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name collision_check-srv:<CheckJointStateCollision-request> is deprecated: use collision_check-srv:CheckJointStateCollision-request instead.")))

(cl:ensure-generic-function 'joint_state-val :lambda-list '(m))
(cl:defmethod joint_state-val ((m <CheckJointStateCollision-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader collision_check-srv:joint_state-val is deprecated.  Use collision_check-srv:joint_state instead.")
  (joint_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckJointStateCollision-request>) ostream)
  "Serializes a message object of type '<CheckJointStateCollision-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckJointStateCollision-request>) istream)
  "Deserializes a message object of type '<CheckJointStateCollision-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckJointStateCollision-request>)))
  "Returns string type for a service object of type '<CheckJointStateCollision-request>"
  "collision_check/CheckJointStateCollisionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckJointStateCollision-request)))
  "Returns string type for a service object of type 'CheckJointStateCollision-request"
  "collision_check/CheckJointStateCollisionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckJointStateCollision-request>)))
  "Returns md5sum for a message object of type '<CheckJointStateCollision-request>"
  "95d7107aa9a79f1c107abc9acf788b2f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckJointStateCollision-request)))
  "Returns md5sum for a message object of type 'CheckJointStateCollision-request"
  "95d7107aa9a79f1c107abc9acf788b2f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckJointStateCollision-request>)))
  "Returns full string definition for message of type '<CheckJointStateCollision-request>"
  (cl:format cl:nil "sensor_msgs/JointState joint_state~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckJointStateCollision-request)))
  "Returns full string definition for message of type 'CheckJointStateCollision-request"
  (cl:format cl:nil "sensor_msgs/JointState joint_state~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckJointStateCollision-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckJointStateCollision-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckJointStateCollision-request
    (cl:cons ':joint_state (joint_state msg))
))
;//! \htmlinclude CheckJointStateCollision-response.msg.html

(cl:defclass <CheckJointStateCollision-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (info
    :reader info
    :initarg :info
    :type cl:string
    :initform ""))
)

(cl:defclass CheckJointStateCollision-response (<CheckJointStateCollision-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckJointStateCollision-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckJointStateCollision-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name collision_check-srv:<CheckJointStateCollision-response> is deprecated: use collision_check-srv:CheckJointStateCollision-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <CheckJointStateCollision-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader collision_check-srv:success-val is deprecated.  Use collision_check-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'info-val :lambda-list '(m))
(cl:defmethod info-val ((m <CheckJointStateCollision-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader collision_check-srv:info-val is deprecated.  Use collision_check-srv:info instead.")
  (info m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckJointStateCollision-response>) ostream)
  "Serializes a message object of type '<CheckJointStateCollision-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'info))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'info))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckJointStateCollision-response>) istream)
  "Deserializes a message object of type '<CheckJointStateCollision-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'info) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'info) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckJointStateCollision-response>)))
  "Returns string type for a service object of type '<CheckJointStateCollision-response>"
  "collision_check/CheckJointStateCollisionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckJointStateCollision-response)))
  "Returns string type for a service object of type 'CheckJointStateCollision-response"
  "collision_check/CheckJointStateCollisionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckJointStateCollision-response>)))
  "Returns md5sum for a message object of type '<CheckJointStateCollision-response>"
  "95d7107aa9a79f1c107abc9acf788b2f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckJointStateCollision-response)))
  "Returns md5sum for a message object of type 'CheckJointStateCollision-response"
  "95d7107aa9a79f1c107abc9acf788b2f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckJointStateCollision-response>)))
  "Returns full string definition for message of type '<CheckJointStateCollision-response>"
  (cl:format cl:nil "bool success~%string info~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckJointStateCollision-response)))
  "Returns full string definition for message of type 'CheckJointStateCollision-response"
  (cl:format cl:nil "bool success~%string info~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckJointStateCollision-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckJointStateCollision-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckJointStateCollision-response
    (cl:cons ':success (success msg))
    (cl:cons ':info (info msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CheckJointStateCollision)))
  'CheckJointStateCollision-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CheckJointStateCollision)))
  'CheckJointStateCollision-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckJointStateCollision)))
  "Returns string type for a service object of type '<CheckJointStateCollision>"
  "collision_check/CheckJointStateCollision")