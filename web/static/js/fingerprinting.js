"use strict";

export var Fingerprint = {
  run: function run() {
    new Fingerprint2().get((res, comp) => {
      var request = new XMLHttpRequest();
      var data = {
        "device": {
          "device_id": res,
          "is_mobile": WURFL.is_mobile,
          "device_name": WURFL.complete_device_name,
          "form_factor": WURFL.form_factor
        }
      };
      request.open('POST', '/api/devices', true);
      request.setRequestHeader('Content-Type', 'Content-Type: application/json');
      request.send(JSON.stringify(data));
    });
    console.log("Hello from fp");
  }
};
