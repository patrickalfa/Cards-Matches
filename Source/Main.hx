package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import objects.*;
import managers.*;
import utils.Utils;

class Main extends Sprite {
	// CARDS
	private var _hand:Hand;
	private var _reserve:Pile;
	private var _discard:Pile;
	private var _board:Board;

	// MISSION
	private var _mission:Mission;
	private var _goalsReserve:Pile;
	private var _goalsDiscard:Pile;

	// DELTA TIME
	private var _deltaTime:Float = 0;
	private var _curFrame:Float = 0;
	private var _prevFrame:Float = 0;

	public function new() {
		super();

		// CARDS

		_hand = new Hand();
		_hand.x = stage.stageWidth / 2;
		_hand.y = stage.stageHeight - 50;

		_reserve = new Pile(cast(CardsManager.instance.reserve));
		_reserve.x = stage.stageWidth / 2;
		_reserve.y = stage.stageHeight + 200;

		_discard = new Pile(cast(CardsManager.instance.discard));
		_discard.x = stage.stageWidth / 2;
		_discard.y = stage.stageHeight + 200;

		_board = new Board();
		_board.x = stage.stageWidth / 2;
		_board.y = stage.stageHeight - 200;

		addChild(_reserve);
		addChild(_discard);
		addChild(_board);
		addChild(_hand);

		// MISSION

		_mission = new Mission();
		_mission.x = stage.stageWidth / 2;
		_mission.y = stage.stageHeight / 2 - 100;

		_goalsReserve = new Pile(cast(GoalsManager.instance.reserve));
		_goalsReserve.x = stage.stageWidth / 2;
		_goalsReserve.y = -200;

		_goalsDiscard = new Pile(cast(GoalsManager.instance.discard));
		_goalsDiscard.x = stage.stageWidth / 2;
		_goalsDiscard.y = -200;

		addChild(_goalsReserve);
		addChild(_goalsDiscard);
		addChild(_mission);

		//

		stage.color = Utils.PALETTE[0];

		stage.addEventListener(Event.ENTER_FRAME, enterFrame);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);

		_prevFrame = Lib.getTimer();

		CardsManager.instance.SetupPiles(_hand, _reserve, _discard, _board);
		GoalsManager.instance.SetupPiles(_mission, _goalsReserve, _goalsDiscard);
	}

	private function enterFrame(e:Event) {
		_curFrame = Lib.getTimer();
		_deltaTime = (_curFrame - _prevFrame) * 0.001;
		_prevFrame = _curFrame;

		_hand.update(_deltaTime);
		_reserve.update(_deltaTime);
		_discard.update(_deltaTime);
		_board.update(_deltaTime);

		_mission.update(_deltaTime);
		_goalsReserve.update(_deltaTime);
		_goalsDiscard.update(_deltaTime);
	}

	private function keyDown(e:KeyboardEvent) {
		trace("keyDown: " + e.keyCode);

		// DEBUG
		if (e.keyCode == 84) {
			var board = CardsManager.instance.board;
			var goalsMatched = [];

			for (goal in GoalsManager.instance.mission) {
				if (goal.CheckMatch(board)) {
					trace("MATCH");
					goalsMatched.push(goal);
				} else {
					trace("NOT MATCH");
				}
			}

			CardsManager.instance.ClearBoard();
			for (goal in goalsMatched)
				GoalsManager.instance.Discard(goal);
			
			CardsManager.instance.DrawHand();
			GoalsManager.instance.DrawMission();
		}
	}
}