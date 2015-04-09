# jQuery Numerator

A jQuery plugin to easily animate numbers.

### Demo page

<a href="http://garethdn.github.io/jquery-numerator/">http://garethdn.github.io/jquery-numerator/</a>

### Installation

Include script after the jQuery library:

```html
<script type="text/javascript" src="/path/to/jquery-numerator.js"></script>
```

### Usage

```js
$('.my-value').numerator( options )
```

### Options

#### easing (string)

An optional parameter to specify the animation easing. Defaults to swing.

```js
easing: 'linear'
```

#### duration (number)

An optional parameter specifying the length of the animation in milliseconds (ms). Defaults to 500 (1/2 a second).

```js
duration: 2000
```

#### delimiter (string)

An optional parameter specifying character(s) used to delimit thousands values.

```js
delimiter: ','
```

#### rounding (number)

This parameter specifies the number of decimal points to display. Defaults to 0.

```js
rounding: 2
```

#### toValue (number)

The final value that you want the number to be animated to.

```js
toValue: 205
```

#### onStart (function)

A function to be called when the animation beings.

```js
onStart: function(){
	alert('Animation started')
}
```

#### onStep (function)

A function to be called at each step of the animation. Accepts two arguments, now and fx.

```js
onStep: function(now, fx){
	alert('The current value is: ' + now)
}
```

#### onComplete (function)

A function to be called when the animation is complete.

```js
onComplete: function(){
	alert('The animation is now complete')
}
```

### TODO

* Implement queue functionality

## License

MIT License
(c) [Gareth Nolan](http://ie.linkedin.com/in/garethnolan/)