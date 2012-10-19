/**
 * User: newtriks
 * Date: 10/05/2012
 */
package com.newtriks.utils {
import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.utils.getTimer;

public class CountTimer extends EventDispatcher {
    public static const COUNT:String = "CountTimer::COUNT";
    public static const COMPLETE:String = "CountTimer::COMPLETE";

    private var limit:int;
    private var startTime:int;
    private var stage:DisplayObject;
    private var up:Boolean = false;

    public function CountTimer() {
    }

    /**
     * API
     */

    private var _count:int;
    public function get count():int {
        return _count;
    }

    public function set count(value:int):void {
        _count = value;
    }

    public function startCountDown(iterations:int, display:DisplayObject):void {
        up = false;
        if (!iterations) throw new Error("Cannot countdown 0 iterations");
        limit = iterations;
        stage = display;
        startTime = getTimer();
        stage.addEventListener(Event.ENTER_FRAME, countDownHandler);
    }

    public function startCountUp(iterations:int, display:DisplayObject):void {
        up = true;
        limit = iterations;
        stage = display;
        startTime = getTimer();
        stage.addEventListener(Event.ENTER_FRAME, countUpHandler);
    }

    public function stopCount():void {
        if (!up) stage.removeEventListener(Event.ENTER_FRAME, countDownHandler);
        else stage.removeEventListener(Event.ENTER_FRAME, countUpHandler);
        this.dispatchEvent(new Event(COMPLETE, true));
    }

    /**
     *  Internal
     */

    protected function countDownHandler(e:Event):void {
        var timeDifference:Number = getTimer() - startTime;
        count = limit - timeDifference;
        if (count >= 0) {
            this.dispatchEvent(new Event(COUNT, true));
        } else {
            stopCount();
        }
    }

    protected function countUpHandler(e:Event):void {
        var timeDifference:Number = getTimer() - startTime;
        count = timeDifference;
        if (limit && timeDifference >= limit) {
            stopCount();
        } else {
            this.dispatchEvent(new Event(COUNT, true));
        }
    }
}
}
