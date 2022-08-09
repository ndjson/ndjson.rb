# frozen_string_literal: true

require_relative 'test_helper'

module NDJSONTest
  class ParserTest < Minitest::Test
    def test_initialize_with_path
      parser = NDJSON::Parser.new(File.expand_path('example.ndjson', __dir__))
      index = 0
      parser.each do |entry|
        assert_equal({ 'some' => 'thing' }, entry) if index.zero?
        index += 1
      end
      assert_equal(index, 3)
    end

    def test_initialize_with_array
      content = File.read(File.expand_path('example.ndjson', __dir__)).lines
      parser = NDJSON::Parser.new(content)
      index = 0
      parser.each do |entry|
        assert_equal({ 'some' => 'thing' }, entry) if index.zero?
        index += 1
      end
      assert_equal(index, 3)
    end
  end

  class GeneratorTest < Minitest::Test
    def test_initialize_with_path
      file = Tempfile.new('example.ndjson')
      assert_equal(String, file.path.class)
      path = file.path
      generator = NDJSON::Generator.new(path)
      generator.write({ 'some' => 'thing' })
      generator.flush
      assert_equal(%({"some":"thing"}\n), File.read(path))
    end

    def test_initialize_with_stringio
      io = StringIO.new
      generator = NDJSON::Generator.new(io)
      generator.write({ 'some' => 'thing' })
      io.rewind
      assert_equal(%({"some":"thing"}\n), io.read)
    end
  end
end
