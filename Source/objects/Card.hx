package objects;

import openfl.events.MouseEvent;
import objects.Draggable;
import managers.CardsManager;
import utils.Utils;

class Card extends Draggable {
	private var _type:Int;

	public function new(type:Int) {
		super();

		this._type = type;

		graphics.beginFill(Utils.PALETTE[type + 1]);
		graphics.drawRect(-50, -75, 100, 150);
		graphics.endFill();

		addEventListener(MouseEvent.RIGHT_CLICK, rightClick);
	}

	// DEBUG
	private function rightClick(e:MouseEvent) {
		var board = CardsManager.instance.board;
		for (i in 0...board.length) {
			if (board[i] == null) {
				CardsManager.instance.AddToBoard(this, i);
				return;
			}
		}
	}
}
