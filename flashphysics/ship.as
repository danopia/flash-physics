class flashphysics.ship extends flashphysics.object {
	private var thrustSpeed:Number;
	public var thrust:Number;
	public var missile:MovieClip;
	public var dx: Number;
	public var dy:Number;
	public var leftKey:Number;
	public var rightKey:Number;
	public var thrustKey:Number;
	public var fireKey:Number;
	private var numMissiles:Number;
	public var missileLife:Number;
	public function ship() { //Initialize vars and stuff.
		this.gravityFocus = null;
		this.dx = 0;
		this.dy = 0;
		this.thrustSpeed = 0;
		this.leftKey = Key.LEFT;
		this.rightKey = Key.RIGHT;
		this.thrustKey = Key.UP;
		this.fireKey = Key.SPACE;
		this.numMissiles = 0;
		this.missileLife = 20;
		missile.lifeSpan = missileLife;
	}      
 	                                                                                                                                                                                     public function onEnterFrame() {
		this.move();
		this.turn();
		flashphysics.base.gravitate(this,gravityFocus,1);
		this.checkKeys();
	}
	public function checkKeys() {
		if (Key.isDown(leftKey)) {
			this.dir -= 5;
			if (this.dir<0) {
				this.dir = 360;
			}
		} else if (Key.isDown(rightKey)) {
			this.dir += 5;
			if (this.dir>360) {
				this.dir = 0;
			}
		} else if (Key.isDown(thrustKey)) {
			thrustSpeed = thrust
		} else if (Key.isDown(fireKey)) {
			fire(missile);
		} else {
			thrustSpeed = 0;
		}
	}
	public function fire(missile) { //Fire that thing
		var newMissile:MovieClip = missile.duplicateMovieClip('a_missile', numMissiles);
		newMissile._visible = false;
		newMissile._x = this._x;
		newMissile._y = this._y;
		newMissile._visible = true;
		var degrees:Number = this.dir;
		degrees -= 90;
		var radians:Number = (degrees*Math.PI/180);
		newMissile.dx = Math.cos(radians)*10; //Maths Magic
		newMissile.dy = Math.sin(radians)*10; //:D
		newMissile.dir = this.dir;
		newMissile.gravityFocus = this.gravityFocus;
		newMissile.persistant = false; //I don't know why I need this, but I do
		newMissile.fired = true;
		newMissile.lifeSpan = missileLife;
	    numMissiles++; 
		//trace(numMissiles);
		 
  	 }
	public function turn():Void { //Rotate and get a new dx and dy with respect to thrust
		this._rotation = this.dir;
		var degrees:Number = this.dir;
		degrees -= 90;
		var radians:Number = degrees*Math.PI/180;
		var thrustDX:Number = thrustSpeed*Math.cos(radians);
		var thrustDY:Number = thrustSpeed*Math.sin(radians);
		dx += thrustDX;
		dy += thrustDY;
	}

}