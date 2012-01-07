require 'rspec/core/formatters/documentation_formatter'
require 'rspec/core/formatters/progress_formatter'
require 'delegate'

module RSpec
  module Smart
    class Formatter < ::Delegator

      def initialize(*args)
        @initialize_args = args
        @example_count = 0
      end

      def start(example_count)
        @example_count = example_count
        super
      end

      def __getobj__
        @formatter_set || choose_formatter
      end

      def __setobj__(obj)
        @formatter_set = obj
      end

      private

      def choose_formatter
        if few_specs?
          formatter_for_fewer_specs
        else
          formatter_for_more_specs
        end
      end

      def few_specs?
        @example_count <= 20
      end

      def formatter_for_fewer_specs
        documentation
      end

      def formatter_for_more_specs
        fuubar || progress
      end

      def documentation
        formatter RSpec::Core::Formatters::DocumentationFormatter
      end

      def fuubar
        require 'fuubar'
        formatter Fuubar
      rescue LoadError
        nil
      end

      def progress
        formatter RSpec::Core::Formatters::ProgressFormatter
      end

      def formatter(formatter)
        formatters[formatter] ||= formatter.new(*@initialize_args)
      end

      def formatters
        @formatters ||= {}
      end

    end
  end
end
