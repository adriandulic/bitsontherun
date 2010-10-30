module BitsOnTheRun
  class Parser
    def self.parse(response, format)
      case format
        when "json" then JSON.parse(response, :symbolize_names => true)
        when "xml" then Nokogiri.XML(response)
      else
        nil
      end
    end
    
    def self.parse!(response, format)
      case format
        when "json" then JSON.parse(response, :symbolize_names => true)
        when "xml" then Nokogiri.XML(response)
      else
        raise ParseError("Unrecognized format")
      end
    end
  end
end
