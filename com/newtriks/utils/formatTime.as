package com.newtriks.utils {
public const formatTime:Function = function (dif:Number):String {
    var seconds:Number = Math.floor(dif / 1000);
    var minutes:Number = Math.floor(seconds / 60);
    var hours:Number = Math.floor(minutes / 60);
    seconds %= 60;
    minutes %= 60;
    hours %= 24;
    var sec:String = seconds.toString();
    var min:String = minutes.toString();
    var hrs:String = (hours) ? hours.toString().concat(":") : "";
    if (sec.length < 2) {
        sec = "0" + sec;
    }
    if (min.length < 2) {
        min = "0" + min;
    }
    if (hours && hrs.length < 2) {
        hrs = "0" + hrs;
    }
    return hrs.concat(min, ":", sec);
}
}