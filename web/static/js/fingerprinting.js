"use strict";

export var Fingerprint = {
  run: function run() {
    new Fingerprint2().get((res, comp) => {
      console.log(res);
      console.dir(comp);
    });
    console.log("Hello from fp");
  }
}
