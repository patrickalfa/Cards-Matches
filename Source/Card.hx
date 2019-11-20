package;

import Draggable;
import Utils;

class Card extends Draggable {
	public function new() {
		super();

		graphics.beginFill(Utils.PALETTE[3]);
		graphics.drawRect(-50, -75, 100, 150);
		graphics.endFill();
	}
}
