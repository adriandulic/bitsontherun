module BitsOnTheRun
  class Call
    @params = {}
    
    def execute
      response = Net::HTTP.get_response(@uri)

      response = case response
        when Net::HTTPSuccess,
          Net::HTTPBadRequest,
          Net::HTTPForbidden,
          Net::HTTPNotFound,
          Net::HTTPMethodNotAllowed,
          Net::HTTPConflict,
          Net::HTTPPreconditionFailed,
          Net::HTTPInternalServerError,
          Net::HTTPNotImplemented
            then response.body
      else
        nil
      end
      
      Parser.parse(response, @params[:api_format])
    end
    
    def method(method, params)
      url = build_url(method, params)
      @uri = URI.parse(url)
    end
    
    private
      def build_url(method, params)
        @params = {}
        @params.merge!(params)
        params = build_params
        URI.escape("#{URL}/#{API_VERSION}/#{method}?#{params}")
      end

      def build_params
        defaults = {
          :api_nonce => "%08d" % rand(99999999),
          :api_timestamp => Time.now.to_i,
          :api_key => Configuration.get(:key),
          :api_format => "json",
          :api_kit => "ruby-%s" % VERSION
        }
        @params = defaults.merge(@params)
        @params[:api_signature] = build_signature
        escape_params
      end

      def build_signature
        signature = escape_params
        Digest::SHA1.hexdigest(signature + Configuration.get(:secret))
      end

      def escape_params
        params = @params.merge(@params) { |key, param| CGI::escape(param.to_s) }
        params = params.map { |key, param| "#{key}=#{param}"}
        params = params.sort
        params.join("&")
      end
  end
end
