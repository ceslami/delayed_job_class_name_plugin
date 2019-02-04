module Delayed
  module ClassName
    class Plugin < Delayed::Plugin
      callbacks do |lifecycle|
        lifecycle.before(:enqueue) do |job|
          if Delayed::ClassName.configuration.custom_parser?
            job.class_name = Delayed::ClassName.configuration.custom_parser.call job.payload_object
          else
            job.class_name = job.name
          end
        end
      end
    end
  end
end

