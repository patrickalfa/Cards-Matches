package objects;

import openfl.display.Sprite;
import objects.Card;
import utils.Utils;

class Goal extends Sprite {
	public function new() {
		super();

		graphics.beginFill(Utils.PALETTE[1]);
		graphics.drawRect(-100, -100, 200, 200);
		graphics.endFill();
	}

	public function CheckMatch(board:Array<Card>):Bool {
		return false;
	}
}