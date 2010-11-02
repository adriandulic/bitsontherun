require 'json'

module BitsOnTheRun
  module Parser
    extend self
    
    def parse(response)
      JSON.parse(response, :symbolize_names => true)
    end
  end
end
