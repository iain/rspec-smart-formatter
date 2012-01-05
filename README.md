# RSpec Smart Formatter

RSpec Smart Formatter automatically chooses an appropriate formatter depending on the amount of
specs you're running.

## Why this formatter exists

This gem is for scratching an itch I have. When I run focussed tests (like, only one file, or only
one example group) I want to use the documentation formatter, which gives me a better view of which
tests pass and which tests fail.

When I run a lot of tests, I want something that doesn't fill my entire bash history and just shows
the list of specs.

I like formatters like [Instafail](https://github.com/grosser/rspec-instafail) and
[Fuubar](https://github.com/jeffkreeftmeijer/fuubar), which easily handles thousands of tests,
without cluttering your terminal, and showing you the failing specs instantly so you can figure out
what went wrong without having to wait for your whole suite to finish.

I could write `-fd` and `-fp` manually, but I keep forgetting that.

## Usage

Add to your gemfile:

``` ruby
group :test do
  gem 'rspec-smart-formatter', :require => false
end
```

Run `bundle install`


Add it your `.rspec` file:

```
--format RSpec::Smart::Formatter
```

And you're done!

## Configuration

Don't know yet. Still working on it.


## Copyright

Copyright 2012, Iain Hecker. Released under the MIT License.