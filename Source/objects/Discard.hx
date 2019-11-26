package objects;

import openfl.display.Sprite;
import managers.CardsManager;
import utils.Utils;

class Discard extends Sprite {
	public function update(deltaTime:Float) {
		var discard = CardsManager.instance.discard;
		var count = discard.length;
		for (i in 0...count) {
			discard[i].x = Utils.Lerp(discard[i].x, 0, deltaTime * 5);
			discard[i].y = Utils.Lerp(discard[i].y, 0, deltaTime * 5);
		}
	}
}
