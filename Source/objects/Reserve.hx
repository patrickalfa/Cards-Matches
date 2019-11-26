package objects;

import openfl.display.Sprite;
import managers.CardsManager;
import utils.Utils;

class Reserve extends Sprite {
	public function update(deltaTime:Float) {
		var reserve = CardsManager.instance.reserve;
		var count = reserve.length;
		for (i in 0...count) {
			reserve[i].x = Utils.Lerp(reserve[i].x, 0, deltaTime * 5);
			reserve[i].y = Utils.Lerp(reserve[i].y, 0, deltaTime * 5);
		}
	}
}
