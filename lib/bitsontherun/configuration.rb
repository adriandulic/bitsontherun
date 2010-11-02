module BitsOnTheRun
  module Configuration
    extend self
    
    def run
      @@config = {
        :key => "",
        :secret => "",
        :format => "json"
      }
      if block_given?
        yield self
      end
    end
    
    def method_missing(name, *args)
      name = name.to_sym
      if args.empty?
        @@config[name]
      else
        @@config[name] = args.first.to_s
      end
    end
  end
end
