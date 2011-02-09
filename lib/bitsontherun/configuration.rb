module BitsOnTheRun
  module Configuration
    attr_accessor :key
    attr_accessor :secret

    def format; "json"; end
  end
end
