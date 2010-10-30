module Botr
  class Upload
    @params = {}
    
    def execute
      boundary = "AaB03x"
      
      post_body = []
      post_body << "--#{boundary}\r\n"
      post_body << "Content-Disposition: form-data; name=\"datafile\"; filename=\"#{@filename}\"\r\n"
      post_body << "Content-Type: application/octet-stream\r\n"
      post_body << "\r\n"
      post_body << @file.read
      post_body << "\r\n--#{boundary}--\r\n"
      
      http = Net::HTTP.new(@url.host, @url.port)
      request = Net::HTTP::Post.new(@url.request_uri)
      request.body = post_body.join
      request["Content-Type"] = "multipart/form-data, boundary=#{boundary}"
      
      response = http.request(request)
      
      Botr::Parser.parse(response, "json")
    end
    
    def upload(filename, params)
      @filename = filename
      @file = open(filename, 'rb')
      
      url = build_url(params)
      @url = URI.parse(url)
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
