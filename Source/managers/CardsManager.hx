package managers;

import Random;
import openfl.geom.Point;
import managers.GameManager;
import utils.Utils;
import objects.*;

class CardsManager {
	public static var instance(default, null):CardsManager = new CardsManager();

	public var reserve:Array<Card> = [];
	public var discard:Array<Card> = [];
	public var hand:Array<Card> = [];

	private var _hand:Hand;
	private var _reserve:Reserve;
	private var _discard:Discard;

	private function new() {
	}

    /// Setup piles references
	public function SetupPiles(_hand:Hand, _reserve:Reserve, _discard:Discard) {
		this._hand = _hand;
		this._reserve = _reserve;
		this._discard = _discard;

		for (i in 0...20) {
			reserve.push(new Card(Random.int(0, 2)));
            _reserve.addChild(reserve[i]);
		}
	}

	/// Draws a card from the reserve pile to the hand of the player
	public function Draw() {
		if (reserve.length == 0) {
			RefillReserve();
            Shuffle();
		}

		if (hand.length < Utils.HAND_SIZE) {
			var card = reserve.shift();

			Utils.LocalToLocal(card, _reserve, _hand);
			
			hand.push(card);
			_hand.addChild(card);
		}
	}

	/// Discard a card from the hand of the player, moving it to the discard pile
	public function Discard(card:Card) {
		hand.remove(card);

		Utils.LocalToLocal(card, _hand, _discard);

		discard.push(card);
		_discard.addChild(card);
	}

	/// Shuffles the reserve pile of the player
	public function Shuffle() {
		hand = Random.shuffle(hand);
	}

	/// Draw an entire handful of cards
	public function DrawHand() {
		while (hand.length < Utils.HAND_SIZE)
			Draw();
	}

	/// Discard the entire hand
	public function DiscardHand() {
		while (hand.length > 0)
			Discard(hand[0]);
	}

	/// Refills the reserve pile
	public function RefillReserve() {
		reserve = discard;
        discard = [];

        for (card in reserve) {
			Utils.LocalToLocal(card, _discard, _reserve);
			
            _reserve.addChild(card);
		}
	}
}
