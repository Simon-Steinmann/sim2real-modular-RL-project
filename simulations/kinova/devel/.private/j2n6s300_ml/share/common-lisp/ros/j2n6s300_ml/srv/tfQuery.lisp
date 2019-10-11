; Auto-generated. Do not edit!


(cl:in-package j2n6s300_ml-srv)


;//! \htmlinclude tfQuery-request.msg.html

(cl:defclass <tfQuery-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass tfQuery-request (<tfQuery-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <tfQuery-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'tfQuery-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2n6s300_ml-srv:<tfQuery-request> is deprecated: use j2n6s300_ml-srv:tfQuery-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <tfQuery-request>) ostream)
  "Serializes a message object of type '<tfQuery-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <tfQuery-request>) istream)
  "Deserializes a message object of type '<tfQuery-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<tfQuery-request>)))
  "Returns string type for a service object of type '<tfQuery-request>"
  "j2n6s300_ml/tfQueryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'tfQuery-request)))
  "Returns string type for a service object of type 'tfQuery-request"
  "j2n6s300_ml/tfQueryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<tfQuery-request>)))
  "Returns md5sum for a message object of type '<tfQuery-request>"
  "00bf7357a79d1c228b9ae3c8a88c8af2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'tfQuery-request)))
  "Returns md5sum for a message object of type 'tfQuery-request"
  "00bf7357a79d1c228b9ae3c8a88c8af2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<tfQuery-request>)))
  "Returns full string definition for message of type '<tfQuery-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'tfQuery-request)))
  "Returns full string definition for message of type 'tfQuery-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <tfQuery-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <tfQuery-request>))
  "Converts a ROS message object to a list"
  (cl:list 'tfQuery-request
))
;//! \htmlinclude tfQuery-response.msg.html

(cl:defclass <tfQuery-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (joint_coordinates
    :reader joint_coordinates
    :initarg :joint_coordinates
    :type geometry_msgs-msg:PoseArray
    :initform (cl:make-instance 'geometry_msgs-msg:PoseArray)))
)

(cl:defclass tfQuery-response (<tfQuery-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <tfQuery-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'tfQuery-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2n6s300_ml-srv:<tfQuery-response> is deprecated: use j2n6s300_ml-srv:tfQuery-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <tfQuery-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2n6s300_ml-srv:success-val is deprecated.  Use j2n6s300_ml-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'joint_coordinates-val :lambda-list '(m))
(cl:defmethod joint_coordinates-val ((m <tfQuery-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2n6s300_ml-srv:joint_coordinates-val is deprecated.  Use j2n6s300_ml-srv:joint_coordinates instead.")
  (joint_coordinates m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <tfQuery-response>) ostream)
  "Serializes a message object of type '<tfQuery-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_coordinates) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <tfQuery-response>) istream)
  "Deserializes a message object of type '<tfQuery-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_coordinates) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<tfQuery-response>)))
  "Returns string type for a service object of type '<tfQuery-response>"
  "j2n6s300_ml/tfQueryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'tfQuery-response)))
  "Returns string type for a service object of type 'tfQuery-response"
  "j2n6s300_ml/tfQueryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<tfQuery-response>)))
  "Returns md5sum for a message object of type '<tfQuery-response>"
  "00bf7357a79d1c228b9ae3c8a88c8af2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'tfQuery-response)))
  "Returns md5sum for a message object of type 'tfQuery-response"
  "00bf7357a79d1c228b9ae3c8a88c8af2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<tfQuery-response>)))
  "Returns full string definition for message of type '<tfQuery-response>"
  (cl:format cl:nil "bool success~%geometry_msgs/PoseArray joint_coordinates~%~%~%~%~%================================================================================~%MSG: geometry_msgs/PoseArray~%# An array of poses with a header for global reference.~%~%Header header~%~%Pose[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'tfQuery-response)))
  "Returns full string definition for message of type 'tfQuery-response"
  (cl:format cl:nil "bool success~%geometry_msgs/PoseArray joint_coordinates~%~%~%~%~%================================================================================~%MSG: geometry_msgs/PoseArray~%# An array of poses with a header for global reference.~%~%Header header~%~%Pose[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <tfQuery-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_coordinates))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <tfQuery-response>))
  "Converts a ROS message object to a list"
  (cl:list 'tfQuery-response
    (cl:cons ':success (success msg))
    (cl:cons ':joint_coordinates (joint_coordinates msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'tfQuery)))
  'tfQuery-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'tfQuery)))
  'tfQuery-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'tfQuery)))
  "Returns string type for a service object of type '<tfQuery>"
  "j2n6s300_ml/tfQuery")