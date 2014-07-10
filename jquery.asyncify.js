$(function() {
  /*
    * jQuery Asyncify v0.2
    *
    * @author Adam Cuppy
    * @copyright Coding ZEAL (http://codingzeal.com)
   */;
  var AsynifyForm;
  AsynifyForm = (function() {
    AsynifyForm.prototype.defaultCallbacks = {
      before: $.noop,
      done: $.noop,
      fail: $.noop,
      always: $.noop,
      then: $.noop
    };

    function AsynifyForm(form, callbacks) {
      if ($.isFunction(callbacks)) {
        callbacks = {
          then: callbacks
        };
      }
      this.form = $(form);
      this.callbacks = $.extend({}, this.defaultCallbacks, callbacks);
    }

    AsynifyForm.prototype.action = function() {
      return this.form.prop('action');
    };

    AsynifyForm.prototype.method = function() {
      return this.form.prop('method');
    };

    AsynifyForm.prototype.bind = function() {
      return this.form.on("submit", (function(_this) {
        return function(e) {
          e.preventDefault();
          _this.callbacks.before(_this.form);
          return _this._xhr();
        };
      })(this));
    };

    AsynifyForm.prototype._xhr = function() {
      var _xhr;
      _xhr = $.ajax(this.action(), {
        type: this.method(),
        data: this.form.serialize()
      });
      _xhr.done(this._bindToForm(this.callbacks.done));
      _xhr.fail(this._bindToForm(this.callbacks.fail));
      _xhr.always(this._bindToForm(this.callbacks.always));
      _xhr.then(this._bindToForm(this.callbacks.then));
      return _xhr;
    };

    AsynifyForm.prototype._bindToForm = function(callback) {
      return $.proxy(callback, this.form);
    };

    return AsynifyForm;

  })();
  return $.fn.asyncify = function(callbacks) {
    return this.each(function() {
      new AsynifyForm(this, callbacks).bind();
    });
  };
});
