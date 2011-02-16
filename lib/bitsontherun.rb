require 'bitsontherun/version'
require 'curb'
require 'cgi'
require 'uri'

module BitsOnTheRun
  PROTOCOL = "http"
  URL = "api.bitsontherun.com"
  API_VERSION = "v1"
  
  autoload :API,            "bitsontherun/api"
  autoload :Configuration,  "bitsontherun/configuration"
  autoload :Call,           "bitsontherun/call"
  autoload :Store,          "bitsontherun/store"
  autoload :Response,       "bitsontherun/response"
  autoload :Parser,         "bitsontherun/parser"

  extend Configuration

  class Base
    def initialize
      @params = {}
    end
    
    def method(method, params = {})
      @method = method.to_s
      @params.merge!(params.to_hash)
    end
    
    protected
      def build_url
        URI.escape("#{PROTOCOL}://#{URL}/#{API_VERSION}/#{@method}?#{build_params}")
      end
      
      def build_params
        @defaults.merge!(@params)
        @defaults[:api_signature] = build_signature
        escape_params
      end
      
      def build_signature
        signature = escape_params
        Digest::SHA1.hexdigest(signature + BitsOnTheRun.secret)
      end
      
      def escape_params
        params = @defaults.merge(@defaults) { |key, param| URI.escape(param.to_s) }
        params = params.map { |key, param| "#{key}=#{param}"}
        params.sort.join("&")
      end
  end
  
  def configure
    yield self if block_given?
  end

  class << self
    def call(method, params = {})
      adapter = API.new(:call)
      adapter.method(method, params)
      adapter.execute
    end
    
    def store(method, filename, params = {})
      adapter = API.new(:store)
      adapter.method(method, params)
      adapter.file(filename)
      adapter.execute
    end
  end
end
