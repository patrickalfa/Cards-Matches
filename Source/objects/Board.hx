package objects;

import openfl.display.Sprite;
import managers.CardsManager;
import utils.Utils;

class Board extends Sprite {
	public function update(deltaTime:Float) {
        var dist = Utils.CARD_WIDTH * .8;
		var board = CardsManager.instance.board;
		var count = board.length;
		for (i in 0...count) {
            if (board[i] != null && !board[i].dragging) {
				var newX = (dist * count * .5) - (dist * (count - i - .5));
                board[i].x = Utils.Lerp(board[i].x, newX, deltaTime * 5);
                board[i].y = Utils.Lerp(board[i].y, 0, deltaTime * 5);
                
                board[i].scaleX = Utils.Lerp(board[i].scaleX, .75, deltaTime * 5);
                board[i].scaleY = Utils.Lerp(board[i].scaleY, .75, deltaTime * 5);
            }
		}
	}
}
