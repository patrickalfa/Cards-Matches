package;

import openfl.display.Sprite;
import openfl.events.Event;
import Card;

class Hand extends Sprite {
	public var cards:Array<Card> = [];

	public function new() {
		super();

		var count = Utils.HAND_SIZE;
		var dist = Utils.CARD_WIDTH + Utils.HAND_SPACING;
		for (i in 0...count) {
            var card = new Card();
			card.x = -(dist * count * .5) + (dist * (count - i - .5));

            cards.push(card);
			addChild(card);
		}
	}

    public function update(deltaTime:Float) {
		trace(deltaTime);
		var count = Utils.HAND_SIZE;
		var dist = Utils.CARD_WIDTH + Utils.HAND_SPACING;
		for (i in 0...count) {
			if (!cards[i].dragging) {
				var newX = -(dist * count * .5) + (dist * (count - i - .5));
				cards[i].x = Utils.Lerp(cards[i].x, newX, deltaTime * 5);
				cards[i].y = Utils.Lerp(cards[i].y, 0, deltaTime * 5);
			}
		}
    }
}
