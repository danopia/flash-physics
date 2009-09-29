class flashphysics.projectile extends flashphysics.object {
	public var lifeSpan:Number;
	private var age:Number;
	public var fired:Boolean;
	public function projectile() {
		//gravityFocus = null;
		speed = 0;
		dir = 0;
		gravity = 0;
		dx = 0;
		dy = 0;
		lifeSpan = Math.PI; //Random number ftw 
		fired = false;
		age = 0;
	}
	public function onEnterFrame() {
		if (fired) {
			//Do things to do with moving and stuff
			this.move();
			flashphysics.base.gravitate(this,gravityFocus,10);
			age++;
		}
		if (age>=lifeSpan) {
			this.removeMovieClip(); //DIE!
		}
	}
	public function move() {
		this._x += this.dx;
		this._y += this.dy;
	}

}