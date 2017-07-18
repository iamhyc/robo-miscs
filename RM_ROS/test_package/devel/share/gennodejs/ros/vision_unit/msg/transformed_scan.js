// Auto-generated. Do not edit!

// (in-package vision_unit.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class transformed_scan {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.dist = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('dist')) {
        this.dist = initObj.dist
      }
      else {
        this.dist = [];
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type transformed_scan
    // Serialize message field [dist]
    bufferOffset = _arraySerializer.float32(obj.dist, buffer, bufferOffset, null);
    // Serialize message field [angle]
    bufferOffset = _arraySerializer.float32(obj.angle, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type transformed_scan
    let len;
    let data = new transformed_scan(null);
    // Deserialize message field [dist]
    data.dist = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [angle]
    data.angle = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.dist.length;
    length += 4 * object.angle.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vision_unit/transformed_scan';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd04f633fb6d830034a14d1a39c7655c7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] dist
    float32[] angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new transformed_scan(null);
    if (msg.dist !== undefined) {
      resolved.dist = msg.dist;
    }
    else {
      resolved.dist = []
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = []
    }

    return resolved;
    }
};

module.exports = transformed_scan;
