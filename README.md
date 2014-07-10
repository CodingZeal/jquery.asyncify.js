## jQuery Asyncify

Convert standard HTML forms to asynchronous submit

## Requirement

jQuery (>= 1.6)

## Usage

Require jquery.asyncify.js after your jQuery lib and bind a target form
via the asyncify method:

```
  $('form').asyncify()
```

Optionally add a followup callback, which is the defaults to .then()
handler

```
  $('form').asyncify(function(data){
    // do something...
  });
```

If you would like access to specific jQuery.ajax callbacks, you can pass
in a named method with a corresponding function.

```
  $('form').asyncify({

    /*
     * Run pre-processing with a before callback
     */
    before:  function(form){},

    /*
     * These callbacks are passed directly to the XHR ajax handler
     */
    done:   function(data){},
    fail:   function(data){},
    always: function(data){},
    then:   function(data){}
  });
```

## Credits

Authored by Adam Cuppy (@acuppy) of Coding ZEAL (http://codingzeal.com)

![Coding ZEAL](https://googledrive.com/host/0B3TWa6M1MsWeWmxRZWhscllwTzA/ZEAL-logo-final-150.png)

This is freely distributed under the MIT license.  Use it, modify it,
enjoy :)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

