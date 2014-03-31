class Tone
  WAVE_TYPE_CODES = ['sine', 'square', 'sawtooth', 'triangle']

  constructor: (type, frequency) ->
    unless this instanceof Tone
      return new Tone(type, frequency)

    @type = type
    @type = 'sine' if @typeCode < 0

    @frequency = frequency
    @connected = false

  connect: ->
    @oscillator.connect(@context.destination)
    @connected = true
    @

  play: ->
    @oscillator.type = @typeCode
    @oscillator.frequency.value = @frequency
    @oscillator.start(0)
    @

  Object.defineProperties @prototype,
    context:
      get: ->
        return @_context if @_context
        return @_context = new AudioContext if AudioContext?
        return @_context = new webkitAudioContext if webkitAudioContext?
        throw new Error 'AudioContext is not supported.'

    oscillator:
      get: ->
        return @_oscillator if @_oscillator
        @_oscillator = @context.createOscillator()

    typeCode:
      get: ->
        WAVE_TYPE_CODES.indexOf(@type)
