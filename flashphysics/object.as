class flashphysics.object extends MovieClip {
	public var gravityFocus:MovieClip;
	public var speed:Number;
	public var dir:Number;
	public var gravity:Number;
	public var dx:Number;
	public var dy:Number;

	public function object() {
		//gravityFocus = null;
		speed = 0;
		dir = 0;
		gravity = 0;
		dx = 0;
		dy = 0;
	}
	public function onEnterFrame() {
		this.move();
		flashphysics.base.gravitate(this, gravityFocus,1);
		
	}
	public function move() {
		this._x += this.dx;
		this._y += this.dy;
	}

}