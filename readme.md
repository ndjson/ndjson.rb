# ndjson.rb

Simple ndjson parser gem. 

The Parser as well as the Generator take IO Objects or Strings. Strings are
opened with the `open-uri` gem.

Note that this is written by a Ruby noob and looking for actual Ruby dev
collaborators.


## Usage

### NDJSON::Parser
```rb
require 'ndjson'

parser = NDJSON::Parser.new( $stdin )
parser.each { |l| puts l }
```

### NDJSON::Generator
```rb
generator = NDJSON::Generator.new( 'test.file' )

generator.write({:hello => "world"})
generator.write({:noob => "what"})
```


## Resources

* http://smyck.net/2011/02/12/parsing-large-logfiles-with-ruby/
* http://www.ruby-doc.org/stdlib-2.0/libdoc/json/rdoc/JSON.html
* http://ruby-doc.org/stdlib-1.9.2/libdoc/open-uri/rdoc/OpenURI.html
* http://www.ruby-doc.org/core-2.0.0/IO.html