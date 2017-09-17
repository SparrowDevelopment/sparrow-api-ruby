$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'dotenv'
Dotenv.load

require "sparrow"

require "minitest/autorun"
