module BitsOnTheRun
  class Configuration
    class << self
      attr_accessor :key
      attr_accessor :secret

      def format; "json"; end
    end
  end
end
