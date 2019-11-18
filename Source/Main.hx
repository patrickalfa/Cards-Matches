package;

import openfl.display.Sprite;
import Card;

class Main extends Sprite {
	public function new() {
		super();

		addChild(new Card());
	}
}