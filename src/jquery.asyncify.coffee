$ ->

  `/*
    * jQuery Asyncify v0.2
    *
    * @author Adam Cuppy
    * @copyright Coding ZEAL (http://codingzeal.com)
   */`

  class AsynifyForm

    defaultCallbacks:
      before: $.noop
      done: $.noop
      fail: $.noop
      always: $.noop
      then: $.noop

    constructor: (form, callbacks) ->
      callbacks = { then: callbacks  } if $.isFunction(callbacks)

      @form = $(form)
      @callbacks = $.extend({}, @defaultCallbacks, callbacks)

    action: ->
      @form.prop('action')

    method: ->
      @form.prop('method')

    bind: ->
      @form.on "submit", (e) =>
        e.preventDefault()
        @callbacks.before(@form)
        @_xhr()

    _xhr: ->
      _xhr = $.ajax( @action(), type: @method(), data: @form.serialize() )
      _xhr.done @_bindToForm(@callbacks.done)
      _xhr.fail @_bindToForm(@callbacks.fail)
      _xhr.always @_bindToForm(@callbacks.always)
      _xhr.then @_bindToForm(@callbacks.then)
      _xhr

    _bindToForm: (callback) ->
      $.proxy(callback, @form)

  $.fn.asyncify = (callbacks) ->
    @each ->
      new AsynifyForm(@, callbacks).bind()
      return
