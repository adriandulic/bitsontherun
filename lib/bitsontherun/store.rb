module BitsOnTheRun
  class Store < Base
    def initialize
      @params = {}
      @defaults = {
        :api_format => Configuration.format
      }
    end
    
    def file(filename)
      @filename = filename.to_s
    end
    
    def execute
      build_token
      file = Curl::PostField.file("file", @filename)
      response = Curl::Easy.http_post(build_url, file) do |curl|
        curl.multipart_form_post = true
      end.body_str
      Response.new(response)
    end
    
    private
      def build_token
        call = API.new(:call)
        call.method(@method, @params)
        @params = call.execute.hash
      end
      
      def build_url
        protocol = @params[:link][:protocol]
        address = @params[:link][:address]
        path = @params[:link][:path]
        
        @defaults[:key] = @params[:link][:query][:key]
        @defaults[:token] = @params[:link][:query][:token]
        
        parameters = escape_params
        "#{protocol}://#{address}#{path}?#{parameters}"
      end
  end
end
