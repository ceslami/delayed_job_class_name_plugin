module Delayed
  module ClassName
    class Configuration
      attr_accessor :custom_parser

      def initialize(options = {})
        options.each do |key, value|
          send("#{key}=", value)
        end
      end

      def custom_parser?
        !!@custom_parser
      end
    end
  end
end
