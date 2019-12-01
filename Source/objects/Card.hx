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

		graphics.beginFill(Utils.PALETTE[type + 2]);
		graphics.drawRect(-50, -75, 100, 150);
		graphics.endFill();

		addEventListener(MouseEvent.RIGHT_CLICK, rightClick);
	}

	public function GetState():CARD_STATE {
		if (CardsManager.instance.hand.indexOf(this) > -1)
			return CARD_STATE.HAND;
		else if (CardsManager.instance.board.indexOf(this) > -1)
			return CARD_STATE.BOARD;
		else if (CardsManager.instance.reserve.indexOf(this) > -1)
			return CARD_STATE.RESERVE;

		return CARD_STATE.DISCARDED;
	}

	private override function mouseDown(e:MouseEvent) {
		if (GetState() == CARD_STATE.HAND)
			super.mouseDown(e);
	}

	// DEBUG
	private function rightClick(e:MouseEvent) {
		if (GetState() == CARD_STATE.HAND) {
			var board = CardsManager.instance.board;
			for (i in 0...board.length) {
				if (board[i] == null) {
					CardsManager.instance.AddToBoard(this, i);
					return;
				}
			}
		} else if (GetState() == CARD_STATE.BOARD) {
			CardsManager.instance.RemoveFromBoard(this);
		}
	}
}
