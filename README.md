# Crochets

This gem is kinda syntactic sugar for setting hooks on ruby method calls.

It uses [Aquarium](https://github.com/deanwampler/Aquarium) for aspects.

## Installation

Add this line to your application's Gemfile:

    gem 'crochets'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crochets

## Usage

The usage is straightforward:

    class MyClass
      def my_method
        puts "Hello, world!"
      end
    end
        
    @aspect = Crochets::Crocheter.hook(MyClass, :my_method, after: true, blocking: false) do |obj, *args|
      puts "NB: world is now helloed."
    end
    
    # ⇒ Hello, world!
    # ⇒ NB: world is now helloed.

The hook may then be unset:

    @aspect.unhook
    
There are many hooks on the same method may be set simultaneously. They will be invoked in
the order they were set.

### Arguments

The method `Crochets::Crocheter#hook` accepts following parameters:

* **object or class** `[Class|Object]` the object or class to set the hook on;
* **method** `Symbol` the name of the method to set the hook on, or `:all_methods`
* **after** `[TrueClass|FalseClass]` apply the hook _after_ method body execution
* **before** `[TrueClass|FalseClass]` apply the hook _before_ method body execution
* **blocking** `[TrueClass|FalseClass]` when `false`, the hook will be executed in the
separate thread.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
