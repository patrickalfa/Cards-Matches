package;

import openfl.display.Sprite;
import CardsManager;
import Card;

class Hand extends Sprite {
	public function new() {
		super();
		
		for (card in CardsManager.instance.reserve) {
			card.x = 0;
			card.y = 200;
			addChild(card);
		}
	}

    public function update(deltaTime:Float) {
		var dist = Utils.CARD_WIDTH + Utils.HAND_SPACING;
		var hand = CardsManager.instance.hand;
		var count = hand.length;
		for (i in 0...count) {
			if (!hand[i].dragging) {
				var newX = -(dist * count * .5) + (dist * (count - i - .5));
				hand[i].x = Utils.Lerp(hand[i].x, newX, deltaTime * 5);
				hand[i].y = Utils.Lerp(hand[i].y, 0, deltaTime * 5);
			}
		}
    }
}
