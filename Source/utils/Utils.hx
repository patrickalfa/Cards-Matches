package utils;

import openfl.display.DisplayObject;
import openfl.geom.Point;

enum CARD_STATE {
	HAND;
	BOARD;
	RESERVE;
	DISCARDED;
}

class Utils {
	public static var PALETTE:Array<Int> = [
        0xffa372,   //#ffa372
        0xed6663,   //#ed6663
        0xb52b65,   //#b52b65
        0x621055    //#621055
    ];

    public static inline var CARD_WIDTH = 100;
    public static inline var CARD_HEIGHT = 150;
    public static inline var HAND_SIZE = 5;
    public static inline var HAND_SPACING = 20;
    public static inline var MISSION_SIZE = 3;
    public static inline var MISSION_SPACING = 30;

    public static function Lerp(a:Float, b:Float, t:Float) {
        return a + (b - a) * t;
    }

    public static function LocalToLocal(child:DisplayObject, localA:DisplayObject, localB:DisplayObject) {
        var oldPos = new Point(child.x, child.y);
        var globalPos = localA.localToGlobal(oldPos);
        var newPos = localB.globalToLocal(globalPos);
        child.x = newPos.x;
        child.y = newPos.y;
    }
}