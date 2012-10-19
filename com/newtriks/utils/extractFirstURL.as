package com.newtriks.utils {
public const extractFirstURL:Function = function (str:String):String {
    var domain:Array = new RegExp("(?i)<a([^>]+)>(.+?)</a>").exec(str);
    return domain[domain.length - 1];
}
}