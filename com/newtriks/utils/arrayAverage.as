package com.newtriks.utils {
public const arrayAverage:Function = function (arr:Array):Number {
    if (arr.length == 0)
        return 0;

    var t:Number = 0;
    var l:uint = arr.length;

    while (l--)
        t += arr[l];

    return t / arr.length;
}
}