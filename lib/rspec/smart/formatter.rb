require 'rspec/core/formatters/documentation_formatter'
require 'rspec/core/formatters/progress_formatter'


METHODS = RSpec::Core::Formatters::BaseFormatter.instance_methods(false)

module RSpec
  module Smart

    class Formatter < ::RSpec::Core::Formatters::BaseFormatter


      METHODS.each do |method|
        class_eval <<-CODE, __FILE__, __LINE__
          def #{method}(*args, &block)
            smart_formatter.send(:#{method}, *args, &block)
          end
        CODE
      end

      def initialize(*args)
        @initialize_args = args
        super
      end

      def start(example_count)
        @example_count = example_count
        smart_formatter.start(example_count)
      end

      def smart_formatter
        if @example_count <= 20
          documentation_formatter
        else
          progress_formatter
        end
      end

      def documentation_formatter
        @documentation_formatter ||= RSpec::Core::Formatters::DocumentationFormatter.new(*@initialize_args)
      end

      def progress_formatter
        @progress_formatter ||= RSpec::Core::Formatters::ProgressFormatter.new(*@initialize_args)
      end

    end

  end
end
