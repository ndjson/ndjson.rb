require 'json'
require 'open-uri'

module NDJSON
  class Parser

    def initialize input
      @input = if input.is_a? String
        open(input)
      else
        input
      end
    end

    include Enumerable

    def each &block
      @input.each do |line|
        json_line = JSON.parse(line)
        yield json_line
      end
    end
  end

  class Generator 
    
    def initialize output
      @output = if output.is_a? String
        open(output, 'w')
      else
        output
      end
    end

    def write obj
      @output.puts JSON.generate(obj)
    end

  end
end
