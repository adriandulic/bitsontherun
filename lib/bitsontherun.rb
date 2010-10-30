require 'digest/sha1'
require 'net/http'
require 'nokogiri'
require 'json'
require 'curb'
require 'cgi'
require 'uri'

require 'bitsontherun/call'
require 'bitsontherun/upload'
require 'bitsontherun/configuration'
require 'bitsontherun/parser'

module BitsOnTheRun
  URL = "http://api.bitsontherun.com"
  API_VERSION = "v1"
  FORMATS = ["json", "xml"]
  
  class << self
    def configure
      if block_given?
        yield Configuration
      end
    end
  end
  
  class API
    def initialize(adapter)
      @adapter = BitsOnTheRun.const_get(adapter.to_s.capitalize).new
    end
    
    def method(method, params = {})
      @adapter.method(method, params)
    end
    
    def file(file)
      @adapter.file(file)
    end
    
    def execute
      @adapter.execute
    end
    
    class << self
      def call(method, params = {})
        adapter = BitsOnTheRun::Call.new
        adapter.method(method, params)
        adapter.execute
      end
      
      def upload(filename)
        adapter = BitsOnTheRun::Upload.new
        adapter.file(filename)
        adapter.execute
      end
    end
  end
end
