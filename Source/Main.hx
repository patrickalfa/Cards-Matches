package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import Hand;
import Utils;

class Main extends Sprite {
	private var _hand:Hand;
	
	// DELTA TIME
	var _deltaTime:Float = 0;
	var _curFrame:Float = 0;
	var _prevFrame:Float = 0;

	public function new() {
		super();

		stage.color = Utils.PALETTE[0];

		_hand = new Hand();
		_hand.x = stage.stageWidth / 2;
		_hand.y = stage.stageHeight - 50;
		addChild(_hand);

		addEventListener(Event.ENTER_FRAME, update);
		_prevFrame = Lib.getTimer();
	}

	private function update(e:Event) {
		_curFrame = Lib.getTimer();
		_deltaTime = (_curFrame - _prevFrame) * 0.001;
		_prevFrame = _curFrame;

		_hand.update(_deltaTime);
	}
}