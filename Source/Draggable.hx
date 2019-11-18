package;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

class Draggable extends Sprite {
	var offsetX:Float = 0;
	var offsetY:Float = 0;
	var dragging:Bool = false;

	public function new() {
		super();

		addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
	}

	public function mouseDown(e:MouseEvent) {
		trace("mouseDown");

        dragging = true;
		this.startDrag();
	}

	public function mouseUp(e:MouseEvent) {
		trace("mouseUp");

		dragging = false;
        this.stopDrag();
	}

	public function mouseMove(e:MouseEvent) {
		trace("mouseMove");
	}
}
