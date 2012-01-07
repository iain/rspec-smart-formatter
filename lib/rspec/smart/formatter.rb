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
        choose_formatter
      end

      def __setobj__(obj)
        raise "Nothing to set here"
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
        formatter RSpec::Core::Formatters::DocumentationFormatter
      end

      def formatter_for_more_specs
        require 'fuubar'
        formatter Fuubar
      rescue LoadError
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
