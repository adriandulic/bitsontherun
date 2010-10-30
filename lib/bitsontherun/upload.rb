module BitsOnTheRun
  class Upload
    @params = {}
    
    def execute
      response = Curl::Easy.http_post(@url, Curl::PostField.file("file", @filename)) do |curl|
        curl.multipart_form_post = true
      end.body_str
      
      Parser.parse(response, "json")
    end
    
    def execute!
      begin
        response = Curl::Easy.http_post(@url, Curl::PostField.file("file", @filename)) do |curl|
          curl.multipart_form_post = true
        end.body_str
      rescue
        raise UploadError("File #{@filename} was not uploaded")
      end
      
      Parser.parse!(response, "json")
    end
    
    def file(filename)
      call = API.new(:call)
      call.method('videos/create')
      params = call.execute
        
      @filename = filename
      @url = build_url(params)
    end
    
    def build_url(params)
      address = params[:link][:address]
      path = params[:link][:path]
      protocol = params[:link][:protocol]
      query = {}
      query[:api_format] = "json"
      query[:key] = params[:link][:query][:key]
      query[:token] = params[:link][:query][:token]
      query = query.merge(query) { |key, q| CGI::escape(q.to_s) }
      query = query.map { |key, q| "#{key}=#{q}"}
      query = query.sort.join("&")
      "#{protocol}://#{address}#{path}?#{query}"
    end
  end
end
