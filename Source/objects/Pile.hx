package objects;

import openfl.display.Sprite;
import managers.CardsManager;
import utils.Utils;

class Pile extends Sprite {
	private var _objects:Array<Sprite>;

	public function new(objects:Array<Sprite>) {
		super();

		this._objects = objects;
	}

	public function update(deltaTime:Float) {
		var count = _objects.length;
		for (i in 0...count) {
			_objects[i].x = Utils.Lerp(_objects[i].x, 0, deltaTime * 5);
			_objects[i].y = Utils.Lerp(_objects[i].y, 0, deltaTime * 5);
		}
	}
}
