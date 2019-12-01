package managers;

import Random;
import utils.Utils;
import objects.*;

class CardsManager {
	public static var instance(default, null):CardsManager = new CardsManager();

	public var reserve:Array<Card> = [];
	public var discard:Array<Card> = [];
	public var hand:Array<Card> = [];
	public var board:Array<Card> = [];

	private var _hand:Hand;
	private var _reserve:Pile;
	private var _discard:Pile;
	private var _board:Board;

	private function new() {}

	/// Setup piles references
	public function SetupPiles(hand:Hand, reserve:Pile, discard:Pile, board:Board) {
		this._hand = hand;
		this._reserve = reserve;
		this._discard = discard;
		this._board = board;

		// DEBUG - fill reserve pile
		for (i in 0...20) {
			this.reserve.push(new Card(Random.int(0, 1)));
			this._reserve.addChild(this.reserve[i]);
		}

		// DEBUG - initialize board array
		this.board = [null, null, null, null, null];
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
		reserve = Random.shuffle(reserve);
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

	/// Move a card from the player's hand to the board
	public function AddToBoard(card:Card, id:Int) {
		if (board[id] != null)
			return;

		hand.remove(card);

		Utils.LocalToLocal(card, _hand, _board);

		board[id] = card;
		_board.addChild(card);
	}

	/// Move a card from the board to the player's hand
	public function RemoveFromBoard(card:Card) {
		var id = board.indexOf(card);

		if (id < 0)
			return;

		board[id] = null;

		Utils.LocalToLocal(card, _board, _hand);

		hand.push(card);
		_hand.addChild(card);
	}
}
