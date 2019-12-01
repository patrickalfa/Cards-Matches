package managers;

import Random;
import utils.Utils;
import objects.*;

class GoalsManager {
	public static var instance(default, null):GoalsManager = new GoalsManager();

	public var reserve:Array<Goal> = [];
	public var discard:Array<Goal> = [];
	public var mission:Array<Goal> = [];

	private var _mission:Mission;
	private var _reserve:Pile;
	private var _discard:Pile;

	private function new() {}

	/// Setup piles references
	public function SetupPiles(mission:Mission, reserve:Pile, discard:Pile) {
		this._mission = mission;
		this._reserve = reserve;
		this._discard = discard;

		// DEBUG - fill reserve pile
		for (i in 0...10) {
			this.reserve.push(new Goal());
		 	this._reserve.addChild(this.reserve[i]);
		}
	}

	/// Draws a goal from the reserve pile to the current mission
	public function Draw() {
		if (reserve.length == 0) {
			RefillReserve();
			Shuffle();
		}

		if (mission.length < Utils.MISSION_SIZE) {
			var goal = reserve.shift();

			Utils.LocalToLocal(goal, _reserve, _mission);

			mission.push(goal);
			_mission.addChild(goal);
		}
	}

	/// Discard an objective from the current mission, moving it to the discard pile
	public function Discard(goal:Goal) {
		mission.remove(goal);

		Utils.LocalToLocal(goal, _mission, _discard);

		discard.push(goal);
		_discard.addChild(goal);
	}

	/// Shuffles the reserve pile
	public function Shuffle() {
		reserve = Random.shuffle(reserve);
	}

	/// Draw all mission goals
	public function DrawMission() {
		while (mission.length < Utils.MISSION_SIZE)
			Draw();
	}

	/// Discard the entire mission
	public function DiscardHand() {
		while (mission.length > 0)
			Discard(mission[0]);
	}

	/// Refills the reserve pile
	public function RefillReserve() {
		reserve = discard;
		discard = [];

		for (goal in reserve) {
			Utils.LocalToLocal(goal, _discard, _reserve);

			_reserve.addChild(goal);
		}
	}
}
