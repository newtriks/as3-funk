package com.newtriks.utils {
public const fourByThreeAspectRatio:Function = function (width:Number, height:Number):Boolean {
    return Boolean(Number((width / 4) * 3) == height);
}
}