# UnsortedToQuery

A Rails patch for ActiveSupport::CoreExtensions::Hash#to_query which removes the call for `sort!`

- Issue: https://github.com/rails/rails/issues/10529
- Code: [lib/active_support/core_ext/object/to_query](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/object/to_query.rb#L75)

Requires: >= Ruby 2.0.0

## Why I did this

I find this feature important on a lot of projects that i've been working since I've been using `.to_query` a lot so I decided to put it on a gem.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'unsorted_to_query'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unsorted_to_query

## Usage

This patch is using `Refinements`. To learn more about it, click [here](http://ruby-doc.org/core-2.1.1/doc/syntax/refinements_rdoc.html)

NOTE: From ruby-doc.org
> You may only activate refinements at top-level, not inside any class, module or method scope. You may activate refinements in a string passed to Kernel#eval that is evaluated at top-level. Refinements are active until the end of the file or the end of the eval string, respectively.

```ruby
class Foo
  using UnsortedToQuery
  
  def self.test
    { foo: 'bar', buzz: 'fizz' }.to_query
  end
end

Foo.test
#=> "foo=bar&buzz=fizz" 
```


## Test

```ruby
$ ruby test/test_unsorted_to_query.rb
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/unsorted_to_query/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
