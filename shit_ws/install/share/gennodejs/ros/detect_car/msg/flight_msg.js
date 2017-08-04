// Auto-generated. Do not edit!

// (in-package detect_car.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class flight_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type flight_msg
    // Serialize message field [type]
    bufferOffset = _serializer.int16(obj.type, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type flight_msg
    let len;
    let data = new flight_msg(null);
    // Deserialize message field [type]
    data.type = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'detect_car/flight_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '479f5e7156bf9518d1a9151816bb4bd6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 type
    geometry_msgs/Vector3 data
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new flight_msg(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.data !== undefined) {
      resolved.data = geometry_msgs.msg.Vector3.Resolve(msg.data)
    }
    else {
      resolved.data = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = flight_msg;
