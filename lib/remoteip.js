"use strict";
var RemoteIp = (function () {
    function RemoteIp() {
        var execSync = require('child_process').execSync;
        this.ip = execSync('docker run --net host --rm florentbenoit/che-ip').toString();
    }
    RemoteIp.prototype.getIp = function () {
        return this.ip;
    };
    return RemoteIp;
}());
exports.RemoteIp = RemoteIp;