module Delayed
  module ClassName
    class Plugin < Delayed::Plugin
      callbacks do |lifecycle|
        lifecycle.before(:enqueue) do |job|
          payload_object = job.payload_object

          if Delayed::ClassName.configuration.custom_parser?
            job.class_name = Delayed::ClassName.configuration.custom_parser.call payload_object
          else
            job.class_name = payload_object.class.name
          end
        end
      end
    end
  end
end

