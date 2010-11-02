require 'digest/sha1'
require 'net/http'

module BitsOnTheRun
  class Call < Base
    def initialize
      @params = {}
      @defaults = {
        :api_nonce => "%08d" % rand(99999999),
        :api_timestamp => Time.now.to_i,
        :api_key => Configuration.key,
        :api_format => Configuration.format,
        :api_kit => "ruby-%s" % VERSION
      }
    end
    
    def execute
      response = Curl::Easy.perform(build_url).body_str
      Response.new(response)
    end
  end
end
