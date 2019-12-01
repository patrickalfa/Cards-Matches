package objects;

import openfl.display.Sprite;
import managers.GoalsManager;
import utils.Utils;

class Mission extends Sprite {
	public function update(deltaTime:Float) {
		var dist = 200 + Utils.MISSION_SPACING;
		var mission = GoalsManager.instance.mission;
		var count = mission.length;
		for (i in 0...count) {
			var newX = -(dist * count * .5) + (dist * (count - i - .5));

			mission[i].x = Utils.Lerp(mission[i].x, newX, deltaTime * 5);
			mission[i].y = Utils.Lerp(mission[i].y, 0, deltaTime * 5);

			mission[i].scaleX = Utils.Lerp(mission[i].scaleX, 1, deltaTime * 5);
			mission[i].scaleY = Utils.Lerp(mission[i].scaleY, 1, deltaTime * 5);
		}
	}
}
