require 'delayed/class_name/configuration'
require 'delayed/class_name/plugin'
require 'delayed/class_name/version'

module Delayed
  module ClassName
    @configuration = Delayed::ClassName::Configuration.new

    class << self
      def configure
        yield(configuration) if block_given?
      end

      def configuration
        @configuration
      end
    end
  end
end
