package com.newtriks.utils {
import flash.external.ExternalInterface;
import flash.system.Capabilities;

import mx.utils.StringUtil;

public const systemStatsLog:Function = function ():String {
    var userAgent:* = function ():String {
        if (!ExternalInterface.available) return "";
        return ExternalInterface.call("window.navigator.userAgent.toString");
    };

    return StringUtil.substitute("Flash Player Version: {0} - Operating System: {1} - Browser: {2} - UserAgent: {3}", Capabilities.version, Capabilities.os, function ():String {
        try {
            var browser:String = "[Unknown Browser]";
            if (userAgent.indexOf("Safari") != -1) {
                browser = "Safari";
            }
            if (userAgent.indexOf("Firefox") != -1) {
                browser = "Firefox";
            }
            if (userAgent.indexOf("Chrome") != -1) {
                browser = "Chrome";
            }
            if (userAgent.indexOf("MSIE") != -1) {
                browser = "Internet Explorer";
            }
            if (userAgent.indexOf("Opera") != -1) {
                browser = "Opera";
            }
        }
        catch (e:Error) {
            //could not access ExternalInterface in containing page
            return "[No ExternalInterface]";
        }
        return browser;
    }, userAgent);
}
}