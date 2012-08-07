# copied from rspec
require 'rails/generators/named_base'

module TimelineKeeper
  module Generators
    class Base < ::Rails::Generators::NamedBase
      def self.source_root
        @_rspec_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'timeline_keeper', generator_name, 'templates'))
      end
    end
  end
end

module Rails
  module Generators
    class GeneratedAttribute
      def input_type
        @input_type ||= if type == :text
          "textarea"
        else
          "input"
        end
      end
    end
  end
end