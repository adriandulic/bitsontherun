module Botr
  class Parser
    def self.parse(response, format)
      case format
        when "json" then JSON.parse(response.body, :symbolize_names => true)
        when "xml" then Nokogiri.XML(response.body)
      else
        nil
      end
    end
  end
end
