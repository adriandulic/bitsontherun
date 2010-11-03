module BitsOnTheRun
  class Store < Base
    def initialize
      @response = nil
      @defaults = {
        :api_format => Configuration.format
      }
      super
    end
    
    def file(filename)
      @filename = filename.to_s
    end
    
    def execute
      build_token
      file = Curl::PostField.file("file", @filename)
      response = Curl::Easy.http_post(build_store_url, file) do |curl|
        curl.multipart_form_post = true
      end.body_str
      Response.new(response)
    end
    
    private
      def build_token
        call = API.new(:call)
        call.method(@method, @params)
        @response = call.execute
      end
      
      def build_store_url
        protocol = @response.find(:link, :protocol)
        address = @response.find(:link, :address)
        path = @response.find(:link, :path)
        
        @defaults[:key] = @response.find(:link, :query, :key)
        @defaults[:token] = @response.find(:link, :query, :token)
      
        URI.escape("#{protocol}://#{address}#{path}?#{escape_params}")
      end
  end
end
