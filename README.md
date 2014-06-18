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

Optionally add a followup callback

```
  $('form').asyncify(function(data){
    // do something...
  });
```
## Copyright

Authored by Adam Cuppy (@acuppy) of Coding ZEAL (http://codingzeal.com)

This is freely distributed under the MIT license.  Use it, modify it,
enjoy :)
