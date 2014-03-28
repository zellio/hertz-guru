var Tone = (function() {
    var WAVE_TYPE_CODES = ['sine', 'square', 'sawtooth', 'triangle'];

    function Tone(type, frequency) {
        if (!(this instanceof Tone)) {
            return new Tone(type, frequency);
        }

        // console.log(AudioContext);
        // var AudioContext = AudioContext || webkitAudioContext;

        this._type = type;
        this._frequency = frequency;

        this.oscillator.connect(this.context.destination);

        if (WAVE_TYPE_CODES.indexOf(this.type) < 0)
            this.type = 'sine';
    }

    Tone.prototype = {
        play: function() {
            this.oscillator.type = this.typeCode;
            this.oscillator.frequency.value = this.frequency;
            this.oscillator.start(0);
        },
        get context() {
            if (this._context) {
                return this._context;
            }
            if (typeof AudioContext !== 'undefined') {
                return this._context = new AudioContext();
            }
            if (typeof webkitAudioContext !== 'undefined') {
                return this._context = new webkitAudioContext();
            }
            throw new Error('AudioContext is not supported.');
        },
        get oscillator() {
            if (this._oscillator)
                return this._oscillator;
            return this._oscillator = this.context.createOscillator();
        },
        get type() { return this._type },
        get frequency() { return this._frequency },
        get typeCode() { return WAVE_TYPE_CODES.indexOf(this._type) }
    };

    return Tone;
})();
