module BitsOnTheRun
  class Call < Base
    attr_reader :url
    
    def execute
      build_url
      response = Curl::Easy.perform(@url).body_str
      Response.new(response)
    end
    
    def build_url
      @url ||= URI.escape("#{PROTOCOL}://#{URL}/#{API_VERSION}/#{@method}?#{build_params}")
    end
  end
end
