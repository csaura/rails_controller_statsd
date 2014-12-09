# RailsControllerStatsd

Rack Middleware for monitor in statsd when a rails controller is used


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_controller_statsd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_controller_statsd

## Usage

Application.middleware.use RailsControllerStatsd::Middleware, statsd_client, 'rails_controllers'

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rails_controller_statsd/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
