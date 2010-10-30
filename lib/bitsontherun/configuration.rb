module BitsOnTheRun
  class Configuration
    @config = {}
    
    class << self
      def method_missing(name, *args)  
        @config[name] = args.first
      end
      
      def get(name)
        @config[name]
      end
    end
  end
end
