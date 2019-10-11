// Auto-generated. Do not edit!

// (in-package collision_check.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class CheckJointStateCollisionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_state = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_state')) {
        this.joint_state = initObj.joint_state
      }
      else {
        this.joint_state = new sensor_msgs.msg.JointState();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CheckJointStateCollisionRequest
    // Serialize message field [joint_state]
    bufferOffset = sensor_msgs.msg.JointState.serialize(obj.joint_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CheckJointStateCollisionRequest
    let len;
    let data = new CheckJointStateCollisionRequest(null);
    // Deserialize message field [joint_state]
    data.joint_state = sensor_msgs.msg.JointState.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.JointState.getMessageSize(object.joint_state);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'collision_check/CheckJointStateCollisionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9ca061465ef0ed08771ed240c43789f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sensor_msgs/JointState joint_state
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CheckJointStateCollisionRequest(null);
    if (msg.joint_state !== undefined) {
      resolved.joint_state = sensor_msgs.msg.JointState.Resolve(msg.joint_state)
    }
    else {
      resolved.joint_state = new sensor_msgs.msg.JointState()
    }

    return resolved;
    }
};

class CheckJointStateCollisionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.info = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('info')) {
        this.info = initObj.info
      }
      else {
        this.info = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CheckJointStateCollisionResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [info]
    bufferOffset = _serializer.string(obj.info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CheckJointStateCollisionResponse
    let len;
    let data = new CheckJointStateCollisionResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [info]
    data.info = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.info.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'collision_check/CheckJointStateCollisionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5b014a3b1f45715ffd8087f5d5c89429';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string info
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CheckJointStateCollisionResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.info !== undefined) {
      resolved.info = msg.info;
    }
    else {
      resolved.info = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: CheckJointStateCollisionRequest,
  Response: CheckJointStateCollisionResponse,
  md5sum() { return '95d7107aa9a79f1c107abc9acf788b2f'; },
  datatype() { return 'collision_check/CheckJointStateCollision'; }
};
