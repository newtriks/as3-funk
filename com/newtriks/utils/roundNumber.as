/** @author: Simon Bailey <simon@newtriks.com> */
package com.newtriks.utils {
public const roundNumber:Function = function roundNumber(number:Number, decimals:int = 1):Number {
    return Number(parseFloat(number.toFixed(decimals)));
}
}