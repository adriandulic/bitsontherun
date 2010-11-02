module BitsOnTheRun
  class Response
    def initialize(response, hash=false)
      @response = response
      if hash
        @parsed = response
      else
        @parsed = Parser::parse(response)
      end
    end
    
    def ok?
      status == "ok"
    end
    
    def error?
      status == "error"
    end
    
    def hash
      to_hash
    end
    
    def to_hash
      @parsed
    end
    
    def find(*args)
      if args.first.class == Array
        args = args.first
      end
      name = args.shift.to_sym
      if @parsed.has_key?(name)
        data = @parsed[name]
        if args.first.class == Array
          args = args.first
        end
        args.each do |arg|
          data = data[arg]
        end
        if data.class == Hash
          data = self.class.new(data, true)
        end
        if data.class == Array
          data.map! { |d| self.class.new(d, true) }
        end
        data
      else
        nil
      end
    end
    
    def method_missing(name, *args)
      args.unshift(name)
      find(*args)
    end
  end
end
