module BitsOnTheRun
  module Configuration
    extend self
    
    @@config = {
      :key    => "",
      :secret => "",
      :format => "json"
    }
    
    def run
      if block_given?
        yield self
      end
    end
    
    def method_missing(name, *args)
      name = name.to_sym
      if args.empty?
        @@config[name]
      else
        if name.to_s =~ /^(.+)=$/
          name = $1.to_sym
        end
        @@config[name] = args.first
      end
    end
  end
end
