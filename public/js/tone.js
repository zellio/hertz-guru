var Tone = (function() {
    var WAVE_TYPE_CODES = ['sine', 'square', 'sawtooth', 'triangle'];

	function Tone(type, frequency) {
		if (!(this instanceof Tone)) {
			return new Tone(type, frequency);
		}
	
		this._type = type;
		this._frequency = frequency;
		this._context = new AudioContext();
		this._oscillator = this._context.createOscillator();
		this._oscillator.connect(this._context.destination);
		
		if (WAVE_TYPE_CODES[this.type].indexOf(this.type) < 0)
			this.type = 'sine';
	}
	
	Tone.prototype = {
		play: function() {
			this._oscillator.type = this.typeCode;
			this._oscillator.frequency.value = this.frequency;
			this._oscillator.start(0);
		},
		get type() { return this._type },
		get frequency() { return this._frequency },
		get typeCode() { return WAVE_TYPE_CODES.indexOf(this._type) }
	};
	
	return Tone;
})();