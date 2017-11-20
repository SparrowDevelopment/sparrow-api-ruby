require "faraday"
require "json" # Standard library
require "time"

module SparrowOne
  class RequestError < RuntimeError; end
  class ResponseError < RuntimeError; end
  module Validators; end
end

require "sparrow_one/version"
require "sparrow_one/validator"
require "sparrow_one/shared_api_methods"

require "sparrow_one/api_struct"
require "sparrow_one/api_structs/ach_account"
require "sparrow_one/api_structs/card"
require "sparrow_one/api_structs/echeck_account"
require "sparrow_one/api_structs/ewallet_account"
require "sparrow_one/api_structs/starcard"


require "sparrow_one/api"
require "sparrow_one/api_types/ach"
require "sparrow_one/api_types/card"
require "sparrow_one/api_types/cash"
require "sparrow_one/api_types/echeck"
require "sparrow_one/api_types/ewallet"
require "sparrow_one/api_types/starcard"

require "sparrow_one/response"
