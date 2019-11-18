package;

import Draggable;

class Card extends Draggable {
	public function new() {
		super();

		this.graphics.beginFill(0xFF0000);
		this.graphics.drawRect(0, 0, 100, 100);
	}
}
