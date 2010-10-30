require 'digest/sha1'
require 'net/http'
require 'nokogiri'
require 'json'
require 'cgi'
require 'uri'

require 'ruby-botr/call'
require 'ruby-botr/upload'
require 'ruby-botr/config'
require 'ruby-botr/parser'

module Botr
  URL = "http://api.bitsontherun.com"
  API_VERSION = "v1"
  FORMATS = ["json", "xml"]
  
  class << self
    def configure
      if block_given?
        yield Config
      end
    end
  end
  
  class API
    def initialize(adapter)
      @adapter = Botr.const_get(adapter.to_s.capitalize).new
    end
    
    def method(method, params = {})
      @adapter.method(method, params)
    end
    
    def upload(file, params = {})
      @adapter.upload(file, params)
    end
    
    def execute
      @adapter.execute
    end
  end
end
