package;

import CardsManager;
import Card;

enum GAME_STATE {
	DRAWING;
	PLANNING;
	ACTING;
	SPECTATING;
}

class GameManager {
	public static var instance(default, null):GameManager = new GameManager();

	public var state:GAME_STATE;

	private var _lateState:GAME_STATE;

	private function new() {
		_lateState = GAME_STATE.DRAWING;
		state = GAME_STATE.DRAWING;

		// DEBUG
		//CardsManager.instance.Shuffle();
		//CardsManager.instance.DrawHand();
	}

	public function update(deltaTime:Float) {
		if (_lateState != state)
			OnStateChange();
	}

	private function OnStateChange() {
		switch (state) {
			case GAME_STATE.DRAWING:
			case GAME_STATE.PLANNING:
			case GAME_STATE.ACTING:
			case GAME_STATE.SPECTATING:
		}

		_lateState = state;
	}
}
