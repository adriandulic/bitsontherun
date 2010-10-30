require 'rubygems'
require 'digest/sha1'
require 'net/http'
require 'nokogiri'
require 'json'
require 'cgi'
require 'uri'

module Ruby
  module Botr
    URL = "http://api.bitsontherun.com"
    VERSION = "v1"
    FORMATS = ["json", "xml"]

    class Base
      def initialize(key, secret)
        @key = key.to_s
        @secret = secret.to_s
        @params = {}
      end

      def call(query, params={})
        uri = build(query, params)
        response = Net::HTTP.get_response(uri)

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
              then response
        else
          response.error!
        end

        parse(response)
      end

      private
        def build(query, params={})
          url = build_url(query, params)
          URI.parse(url)
        end

        def parse(response)
          case @params[:api_format]
            when "json" then JSON.parse(response.body)
            when "xml" then Nokogiri.XML(response.body)
          else
            nil
          end
        end

        # build complete url
        def build_url(query, params)
          @params.merge!(params)
          params = build_params if not @params.empty?
          URI.escape("#{URL}/#{VERSION}/#{query}?#{params}")
        end

        # returns hash of parameters for api call with generated signature
        def build_params
          defaults = {
            :api_nonce => "%08d" % rand(99999999),
            :api_timestamp => Time.now.to_i,
            :api_key => @key,
            :api_format => "json",
            :api_kit => "ruby-%s" % VERSION
          }
          @params = defaults.merge(@params)
          @params[:api_signature] = build_signature
          escape_params
        end

        # generates signature for given params hash
        def build_signature
          signature = escape_params(true)
          Digest::SHA1.hexdigest(signature + @secret)
        end

        # escape hash of params
        def escape_params(sort = false)
          params = @params.merge(@params) { |key, param| CGI::escape(param.to_s) }
          params = params.map { |key, param| "#{key}=#{param}"}
          params.sort! if sort
          params.join("&")
        end
    end
  end
end
