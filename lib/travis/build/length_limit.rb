module Travis
  class Build
    class LengthLimit
      def self.of(limit)
        new(limit)
      end

      def initialize(limit)
        raise ArgumentError, "limit cannot be nil!" if limit.nil?

        @limit         = limit
        self.reset!
      end

      def update(output)
        @output_length += output.length
      end

      def length
        @output_length
      end

      def hit?
        @output_length >= @limit
      end

      def reset!
        @output_length = 0
      end
    end
  end
end
