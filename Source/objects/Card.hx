package objects;

import objects.Draggable;
import utils.Utils;

class Card extends Draggable {
	private var type:Int;

	public function new(type:Int) {
		super();

		this.type = type;

		graphics.beginFill(Utils.PALETTE[type + 1]);
		graphics.drawRect(-50, -75, 100, 150);
		graphics.endFill();
	}
}
