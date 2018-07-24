# Delayed::ClassName Plugin

[Delayed Job](https://github.com/collectiveidea/delayed_job) records a serialized payload object to the `delayed_jobs` table. If you want to know what _kinds of_ jobs are currently enqueued, you must write complicated and brittle queries that parse the serialized payloads (ie the `Delayed::Job#handler` column). This gem exists to make queue administration more convenient. :sparkles:

This plugin adds an indexed `class_name` column to the `delayed_jobs` table. By default, it contains the stringified class name of the enqeued payload object.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'delayed_job_class_name_plugin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install delayed_job_class_name_plugin

Run the required database migrations:

    $ rails generate delayed_job_class_name_plugin:install
    $ rails db:migrate

## Usage

In certain cases, you may want to parse the payload object in a custom way to derive its "class name."

For example, [ActiveJob](http://edgeguides.rubyonrails.org/active_job_basics.html) in Rails, will always enqueue a `JobWrapper` as the payload object. This object, predictably, wraps the object that's actually doing work. By default, "JobWrapper" would be the value of `Delayed::Job#class_name`. You may find this less helpful than having `#class_name` contain the class of the _wrapped_ object.

Let's see how we can use the `#custom_parser` configuration to accomplish this:

```ruby
# config/initializers/delayed_job.rb

Delayed::ClassName.configure do |c|
  c.custom_parser = ->(payload_object) {
    if payload_object.class == ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper
      payload_object.job_data['job_class']
    else
      payload_object.class.name
    end
  }
end
```

`Configuration#custom_parser` can take a `Proc` which receives a single parameter, `job`, and returns a `String` that will be written to `Delayed::Job#class_name` at enqueue-time.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
