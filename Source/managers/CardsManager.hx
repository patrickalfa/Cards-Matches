package managers;

import Random;
import managers.GameManager;
import utils.Utils;
import objects.Card;

class CardsManager {
    public static var instance(default, null):CardsManager = new CardsManager();

    public var reserve:Array<Card> = [];
    public var discard:Array<Card> = [];
    public var hand:Array<Card> = [];

    private function new() {
        for (i in 0...20) {
            reserve.push(new Card(Random.int(0,2)));
        }
    }

    // Draws a card from the reserve pile to the hand of the player
    public function Draw() {
        if (reserve.length == 0) {
            reserve = discard;
            discard = [];
            Shuffle();
        }

        if (hand.length < Utils.HAND_SIZE)
        {
            //GameManager.instance.state = GAME_STATE.DRAWING;
            //StopCoroutine("WaitForDrawToComplete");
            //StartCoroutine("WaitForDrawToComplete");

            hand.push(reserve[0]);
            reserve.shift();
        }
    }

    /// Discard a card from the hand of the player, moving it to the discard pile 
    public function Discard(card:Card)
    {
        hand.remove(card);
        discard.push(card);
    }

    /// Shuffles the reserve/draw pile of the player
    public function Shuffle() {
        hand = Random.shuffle(hand);
    }

    /// Draw an entire handful of cards
    public function DrawHand()
    {
        while(hand.length < Utils.HAND_SIZE)
            Draw();
    }

    /// Discard the entire hand
    public function DiscardHand()
    {
        while (hand.length > 0)
            Discard(hand[0]);
    }
}