# CousinRoman

`CousinRoman` is a `String` extension which allows you to convert
Roman numerals (following modern subtractive notation)
to Arabic numbers (i.e. Integers).

## Installation

Add this line to your application's Gemfile:

    gem 'cousin_roman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cousin_roman

## Usage

Just use `String#to_arabic` or `String#to_arabic!` method.

For example:

```ruby
'MMXIII'.to_arabic # => 2013
'MMYUOX'.to_arabic # => nil
'MMYOUX'.to_arabic! # => TypeError: not a valid roman number
```

## Testing

Just run

    $ rake

under gem folder.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
