package com.newtriks.utils {
import flash.utils.describeType;

public const copyObjectValues:Function = function (obj:Object, objCopy:Object):Object {
    var prop:String;
    var desc:XML = describeType(obj);

    for each(var v:XML in desc.variable) {
        prop = String(v.@name);
        if (obj.hasOwnProperty(prop) && objCopy.hasOwnProperty(prop)) {
            obj[prop] = objCopy[prop];
        }
    }
    return obj;
}
}