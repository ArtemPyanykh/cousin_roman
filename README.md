# CousinRoman

CousinRoman provides functionality to convert between Roman and Arabian numerals.
The functionality provided via String and Integer extensions.

## Roman numbers and conversion rules

CousinRoman follows strict roman notation with subtractive rule, i.e.

1. Letters should be ordered by decreasing of magnitude.
2. Only I, X, C, M can be repeated, but up to three times.
3. Letter with lower magnitude can appear BEFORE letter with higher magnitude,
but only in the following cases: IV, IX, XL, XC, CD, CM - lets call them **subtractives**
4. **subtractives** and regular letters cannot appear within the same power,
i.e. `ivi` is not allowed.

Therefore, only numbers within range of 1..3999 can be represented in roman notation.

CousinRoman is thoroughly spec'ed, and considered reliable in following these rules.

## Installation

Add this line to your application's Gemfile:

    gem 'cousin_roman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cousin_roman

## Usage

Just use `String#to_arabian` or `String#to_arabian!` methods
if you want to convert from Roman to Arabian
and
`Integer#to_roman` or `Integer#to_roman!`
if you want to convert from Arabian to Roman.

For example:

```ruby
'MMXIII'.to_arabian # => 2013
'MMYUOX'.to_arabian # => nil
'MMYOUX'.to_arabian! # => TypeError: not a valid roman number

2013.to_roman # => 'MMXIII'
'0'.to_roman # => nil
'100500'.to_roman! # => TypeError: not a valid roman number
```

`String#to_arabian(!)` is case insensitive.

`Integer#to_roman(!)` returns numerals in upper case.

## Testing

Just run

    $ rake

under gem folder (be prepared for massive output).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
