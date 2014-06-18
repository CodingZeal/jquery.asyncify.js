$ = JQuery

$ ->

  `/*
    * jQuery Asyncify v0.1
    *
    * @author Adam Cuppy
    * @copyright Coding ZEAL (http://codingzeal.com)
   */`

  class AsynifyForm
    constructor: (form, callback) ->
      @form = $(form)
      @callback = callback

    action: ->
      @form.prop('action')

    method: ->
      @form.prop('method')

    bind: ->
      @form.on "submit", (e) =>
        e.preventDefault()
        $[@method()](@action(), @form.serialize()).then (data) =>
          @callback.call @form, data

  $.fn.asyncify = (callback) ->
    @each ->
      new AsynifyForm(@, callback).bind()
      return
