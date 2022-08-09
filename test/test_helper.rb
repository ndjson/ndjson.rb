# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'ndjson'

require 'tempfile'
require 'stringio'
require 'minitest/autorun'
