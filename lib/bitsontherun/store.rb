module BitsOnTheRun
  class Store < Base
    attr_reader :store_url
    
    def file(filename)
      @filename = filename.to_s
    end
    
    def execute
      build_store_url
      file = Curl::PostField.file("file", @filename)
      response = Curl::Easy.http_post(@store_url, file) do |curl|
        curl.multipart_form_post = true
      end.body_str
      Response.new(response)
    end
    
    def build_store_url
      unless @store_url
        response = build_token
        protocol = response.find(:video, :link, :protocol)
        address = response.find(:video, :link, :address)
        path = response.find(:video, :link, :path)
        @defaults[:key] = response.find(:video, :link, :query, :key)
        @defaults[:token] = response.find(:video, :link, :query, :token)
        @store_url ||= URI.escape("#{protocol}://#{address}#{path}?#{escape_params}")
      end
    end
    
    private
    
      def build_token
        call = API.new(:call)
        call.method(@method, @params)
        call.execute
      end
  end
end
