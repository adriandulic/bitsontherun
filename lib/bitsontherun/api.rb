module BitsOnTheRun
  class API
    def initialize(adapter)
      @adapter = BitsOnTheRun.const_get(adapter.to_s.capitalize).new
    end
    
    def method(method, params = {})
      if params.include?(:api_format)
        raise ArgumentError("Params hash should not include :api_format")
      end
      if params.include?(:api_key)
        raise ArgumentError("Params hash should not include :api_key, use BitsOnTheRun.key instead")
      end
      if params.include?(:api_secret)
        raise ArgumentError("Params hash should not include :api_secret, use BitsOnTheRun.secret instead")
      end
      @adapter.method(method, params)
    end
    
    def file(file)
      @adapter.file(file)
    end
    
    def execute
      @adapter.execute
    end
  end
end
