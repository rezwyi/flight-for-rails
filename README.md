FlightForRails
==============

FlightForRails is a plugin for Rails assets pipeline, which integrates your applicaiton with Twitter Flight javascript framework. Flight is a lightweight, component-based javascript framework that maps behavior to DOM nodes. Twitter uses it for their web applications. Why do not you try it? :)

For more information see [official Flight page](http://twitter.github.com/flight).

## Browser Support

Flight has been tested on all major browsers: Chrome, Firefox, Safari, Opera and IE7 and upwards.

## Installation

This gem vendors Flight files and dependecies for Rails assets pipeline.

First add the following lines to your application `Gemfile`:

``` ruby
gem 'flight-for-rails', '~> 1.0.0'
```

Then run `bundle install` to update your's gems bundle.

Now you need to edit your manifest file (usualy `app/assets/javascripts/application.js`) and add the following lines:

``` javascript
//= require jquery
//= require flight-for-rails
```

Done!

## Usage

0. Define a component
0. Attach a component instance to a DOM node

Simple example:

``` coffeescript
# app/assets/javascript/components/my-component.js.coffee
$ ->
  MyComponent = flight.component
    @after 'initialize', ->
      @on 'click', @triggerMyEvent

    @triggerMyEvent = ->
      @trigger document, 'myEvent', text: 'My event'

  MyComponent.attachTo '#my-component'
```

``` coffeescript
# app/assets/javascript/components/my-component-2.js.coffee
$ ->
  MyComponent2 = flight.component
    @after 'initialize', ->
      @on 'myEvent', @handleMyEvent

    @handleMyEvent = (event, data) ->
      console.log "#{data.text} event is triggered!"

  MyComponent2.attachTo '#my-component2'
```

And don't forget add the following line to your manifest file (usualy `app/assets/javascript/application.js`):

```javascript
//= require_directory ./components
```

Pretty awesome! Enjoy!

## Authors

+ [Sergey Rezvanov](http://github.com/rezwyi)

## Copyright

See LICENSE file.
