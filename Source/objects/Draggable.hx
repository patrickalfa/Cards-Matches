package objects;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

class Draggable extends Sprite {
	public var dragging:Bool = false;

	public function new() {
		super();

		addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		addEventListener(MouseEvent.MOUSE_UP, mouseUp);
	}

	public function mouseDown(e:MouseEvent) {
		trace("mouseDown");

		parent.addChild(this);
		
        dragging = true;
		startDrag();
	}

	public function mouseUp(e:MouseEvent) {
		trace("mouseUp");

		dragging = false;
        stopDrag();
	}
}
