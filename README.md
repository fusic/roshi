# Roshi

[![Gem Version](https://badge.fury.io/rb/roshi.svg)](https://badge.fury.io/rb/roshi)
[![Build Status](https://travis-ci.org/fusic/roshi.svg)](https://travis-ci.org/fusic/roshi)

ActiveModel/ActiveRecord Validation Collection For Mainly Japanese

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roshi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roshi

## Usage

```ruby
class TestModel
  validates :email, email: true
  validates :zip_code, zip_code: true # zip_code: { hiphenation: true }
  validates :phone_number, phone_number: true # phone_number: { hiphenation: true }
  validates :date, date: true
  validates :hiragana, hiragana: true
  validates :version_number, version_number: true
  validates :large_value, numerical_comparation: { compare_to: :small_value, type: :greater_than }
  validates :large_value, numerical_comparation: { compare_to: :small_value, type: :greater_than_or_equal_to }
  validates :large_value, numerical_comparation: { compare_to: :small_value, type: :equal_to }
  validates :small_value, numerical_comparation: { compare_to: :large_value, type: :less_than_or_equal_to }
  validates :small_value, numerical_comparation: { compare_to: :large_value, type: :less_than }
  validates :middle_value, numerical_comparation: { compare_to: { min: :small_value, max: :large_value }, type: :between }
  end
end
```

## Contributing

1. Fork it ( https://github.com/fusic/roshi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
