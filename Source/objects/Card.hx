package objects;

import openfl.events.MouseEvent;
import objects.Draggable;
import managers.CardsManager;
import utils.Utils;

class Card extends Draggable {
	private var type:Int;

	public function new(type:Int) {
		super();

		this.type = type;

		graphics.beginFill(Utils.PALETTE[type + 1]);
		graphics.drawRect(-50, -75, 100, 150);
		graphics.endFill();

		addEventListener(MouseEvent.RIGHT_CLICK, rightClick);
	}

	private function rightClick(e:MouseEvent) {
		CardsManager.instance.Discard(this);
	}
}
