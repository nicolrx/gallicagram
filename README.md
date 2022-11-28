# Gallicagram gem

This gem allows you to search Gallicagram data in Ruby. It's inspired by [pyllicagram](https://github.com/regicid/pyllicagram).

[Gallicagram](https://shiny.ens-paris-saclay.fr/app/gallicagram) is a program that graphically represents the evolution over time of the frequency of occurrence of one or more words, using the data of Gallica and many other libraries. This project was created by Benjamin Azoulay & Benoît de Courson.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gallicagram'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gallicagram

## Usage

First require the gallicagram gem:
```ruby
require 'gallicagram'
```

Then, search the data with the following parameters:
```ruby
# query = string or array of strings
# corpus = string ("lemonde","livres","presse")
# start_date = string (year)
# end_date = string (year)
# resolution = string ("year", "month")
# sum = true to return the sum of the frequencies of the searched words

Gallicagram.search("query","lemonde","1900","2000","month",false) 

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicolrx/gallicagram. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [Creative Commons License](https://creativecommons.org/licenses/by/4.0/).