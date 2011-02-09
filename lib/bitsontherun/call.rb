require 'digest/sha1'
require 'net/http'

module BitsOnTheRun
  class Call < Base
    def initialize
      @defaults = {
        :api_nonce => "%08d" % rand(99999999),
        :api_timestamp => Time.now.to_i,
        :api_key => BitsOnTheRun.key,
        :api_format => BitsOnTheRun.format,
        :api_kit => "ruby-%s" % VERSION
      }
      super
    end
    
    def execute
      response = Curl::Easy.perform(build_url).body_str
      Response.new(response)
    end
  end
end
