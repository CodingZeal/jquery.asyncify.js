// Generated by CoffeeScript 1.7.1
(function() {
  var $;

  $ = JQuery;

  $(function() {
    /*
    * jQuery Asyncify v0.1
    *
    * @author Adam Cuppy
    * @copyright Coding ZEAL (http://codingzeal.com)
   */;
    var AsynifyForm;
    AsynifyForm = (function() {
      function AsynifyForm(form, callback) {
        this.form = $(form);
        this.callback = callback;
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
            return $[_this.method()](_this.action(), _this.form.serialize()).then(function(data) {
              return _this.callback.call(_this.form, data);
            });
          };
        })(this));
      };

      return AsynifyForm;

    })();
    return $.fn.asyncify = function(callback) {
      return this.each(function() {
        new AsynifyForm(this, callback).bind();
      });
    };
  });

}).call(this);