package objects;

import openfl.display.Sprite;
import utils.Utils;

class Goal extends Sprite {
	public function new() {
		super();

		graphics.beginFill(Utils.PALETTE[1]);
		graphics.drawRect(-100, -100, 200, 200);
		graphics.endFill();
	}
}