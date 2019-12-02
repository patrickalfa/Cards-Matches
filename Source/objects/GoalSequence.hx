package objects;

import Random;
import objects.Card;
import utils.Utils;

class GoalSequence extends Goal {
	private var _sequence:Array<Int> = [];

	public function new(length:Int) {
		super();

		_sequence = [for(i in 0...length) Random.int(0, 1)];

		var dist = 60;
		for (i in 0...length) {
			var newX = (dist * length * .5) - (dist * (length - i - .5));
			
			graphics.beginFill(Utils.PALETTE[_sequence[i] + 2]);
			graphics.drawRect(newX - 25, 0, 50, 75);
			graphics.endFill();
		}
	}

	public override function CheckMatch(board:Array<Card>):Bool {
		var bLength = board.length;
		var sLength = _sequence.length;

		for (i in 0...bLength-sLength+1) {
			var matches = 0;

			for (j in 0...sLength) {
				if (board[i + j] != null &&
					board[i + j].GetType() == _sequence[j])
					matches++;
			}
			
			if (matches == sLength)
				return true;
		}

		return false;
	}
}