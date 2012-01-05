require 'rspec/core/formatters/documentation_formatter'
require 'rspec/core/formatters/progress_formatter'
require 'delegate'

module RSpec
  module Smart
    class Formatter < ::Delegator

      def initialize(*args)
        @initialize_args = args
      end

      def start(example_count)
        @example_count = example_count
        super
      end

      def __getobj__
        if @example_count <= 20
          documentation_formatter
        else
          progress_formatter
        end
      end

      def __setobj__(obj)
        raise NotImplementedError.new("The delegated object is calculated automatically, it is not to be set")
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
