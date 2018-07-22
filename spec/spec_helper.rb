$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'delayed_job_class_name_plugin'

spec_dir = File.dirname(__FILE__)
Dir["#{spec_dir}/support/**/*.rb"].sort.each { |f| require f }
$LOAD_PATH << File.expand_path("support/delayed_job", __dir__)

Delayed::Worker.backend = :test

RSpec.configure do |config|
  config.order = 'random'
  config.before :each do
    Delayed::Job.delete_all
  end
end
