package com.newtriks.utils {
public const linkBuilder:Function = function (url:String):String {
    if(url == null || !url.length ) return "";
    return '<a href="'.concat(url, '">', url, '</a>');
}
}