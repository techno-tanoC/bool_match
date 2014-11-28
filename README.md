# BoolMatch

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bool_match'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bool_match

## Usage

```ruby
case [1, 2]
when [falsy, falsy] then "falsy, falsy"
when [falsy, _]     then "falsy, any"
when [truthy, _]    then "truthy, any"
else                     "default"
end
```

_truthy_ matches anything but nil, false
_falsy_ matches nil or false
_ matches anything

all object that have === method can use.
=== is alias of == on default.

```ruby
case [[1, 2], 3]
when [_,      2] then "[something, two]"
when [[1, _], 3] then "[[1, any], three]"
else             then "default"
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bool_match/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
