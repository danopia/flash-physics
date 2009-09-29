class flashphysics.base {
	public static function gravitate(object:MovieClip, focus:MovieClip, strength:Number) {
 	  	focus = _level0.planet;
		var tempDX:Number = object._x-focus._x;
		var tempDY:Number = object._y-focus._y;
		//trace("gravitating"+object+" to "+ focus);
		//trace(object);
		var tempDistance:Number = Math.sqrt(tempDX*tempDX+tempDY*tempDY);
		tempDX /= tempDistance;
		tempDY /= tempDistance;

		tempDX *= focus.gravity/(tempDistance*tempDistance);
		tempDY *= focus.gravity/(tempDistance*tempDistance);

		tempDX *= -1;
		tempDY *= -1;
		tempDX *= strength;
		tempDY *= strength;
		object.dx += tempDX;
		object.dy += tempDY;

	}
}