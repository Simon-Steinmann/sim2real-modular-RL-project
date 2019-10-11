// Auto-generated. Do not edit!

// (in-package j2n6s300_ml.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class JointOdom {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.names = null;
      this.poses = null;
      this.twist = null;
      this.velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('names')) {
        this.names = initObj.names
      }
      else {
        this.names = [];
      }
      if (initObj.hasOwnProperty('poses')) {
        this.poses = initObj.poses
      }
      else {
        this.poses = [];
      }
      if (initObj.hasOwnProperty('twist')) {
        this.twist = initObj.twist
      }
      else {
        this.twist = [];
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointOdom
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [names]
    // Serialize the length for message field [names]
    bufferOffset = _serializer.uint32(obj.names.length, buffer, bufferOffset);
    obj.names.forEach((val) => {
      bufferOffset = std_msgs.msg.String.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [poses]
    // Serialize the length for message field [poses]
    bufferOffset = _serializer.uint32(obj.poses.length, buffer, bufferOffset);
    obj.poses.forEach((val) => {
      bufferOffset = geometry_msgs.msg.PoseArray.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [twist]
    // Serialize the length for message field [twist]
    bufferOffset = _serializer.uint32(obj.twist.length, buffer, bufferOffset);
    obj.twist.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Twist.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [velocity]
    // Serialize the length for message field [velocity]
    bufferOffset = _serializer.uint32(obj.velocity.length, buffer, bufferOffset);
    obj.velocity.forEach((val) => {
      bufferOffset = std_msgs.msg.Float64.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointOdom
    let len;
    let data = new JointOdom(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [names]
    // Deserialize array length for message field [names]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.names = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.names[i] = std_msgs.msg.String.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [poses]
    // Deserialize array length for message field [poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.poses[i] = geometry_msgs.msg.PoseArray.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [twist]
    // Deserialize array length for message field [twist]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.twist = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.twist[i] = geometry_msgs.msg.Twist.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [velocity]
    // Deserialize array length for message field [velocity]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.velocity = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.velocity[i] = std_msgs.msg.Float64.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.names.forEach((val) => {
      length += std_msgs.msg.String.getMessageSize(val);
    });
    object.poses.forEach((val) => {
      length += geometry_msgs.msg.PoseArray.getMessageSize(val);
    });
    length += 48 * object.twist.length;
    length += 8 * object.velocity.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2n6s300_ml/JointOdom';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6a11b0b66ccf504317c8c0454f9c74a7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # A twist with reference coordinate frame and timestamp
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointOdom(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.names !== undefined) {
      resolved.names = new Array(msg.names.length);
      for (let i = 0; i < resolved.names.length; ++i) {
        resolved.names[i] = std_msgs.msg.String.Resolve(msg.names[i]);
      }
    }
    else {
      resolved.names = []
    }

    if (msg.poses !== undefined) {
      resolved.poses = new Array(msg.poses.length);
      for (let i = 0; i < resolved.poses.length; ++i) {
        resolved.poses[i] = geometry_msgs.msg.PoseArray.Resolve(msg.poses[i]);
      }
    }
    else {
      resolved.poses = []
    }

    if (msg.twist !== undefined) {
      resolved.twist = new Array(msg.twist.length);
      for (let i = 0; i < resolved.twist.length; ++i) {
        resolved.twist[i] = geometry_msgs.msg.Twist.Resolve(msg.twist[i]);
      }
    }
    else {
      resolved.twist = []
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = new Array(msg.velocity.length);
      for (let i = 0; i < resolved.velocity.length; ++i) {
        resolved.velocity[i] = std_msgs.msg.Float64.Resolve(msg.velocity[i]);
      }
    }
    else {
      resolved.velocity = []
    }

    return resolved;
    }
};

module.exports = JointOdom;
