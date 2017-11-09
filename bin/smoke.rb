#!/usr/bin/env ruby

require "bundler/setup"
require "sparrow_one"
require_relative "../test_keys"

puts "Expect: SUCCESS"
api = SparrowOne::CardAPI.new(TEST_KEYS[:credit_card], Faraday.new('http://localhost:8080'))
r = api.sale(cardnum: '4111111111111111', cardexp: '1019', amount: '5.25', cvv: '999')
puts r['textresponse']

puts "Expect: SUCCESS"
r = api.sale(cardnum: '4111111111111111', cardexp: '1019', amount: '5.25', cvv: '999')
puts r['textresponse']

puts "Expect: missing params"
r = api.sale(cardnum: '4111111111111111')
puts r['textresponse']

puts "Expect: bad format"
r = api.sale(foo: 'bar', cardnum: '4111111111111111', cardexp: '10/19', amount: '5.25', cvv: '999')
puts r['textresponse']

puts "Expect: SUCCESS"
  r = api.sale(state: "NV", cardnum: '4111111111111111', cardexp: '1019', amount: '5.25', cvv: '999')
puts r['textresponse']

puts "Expect: Bad format"
  r = api.sale(state: "NVx", cardnum: '4111111111111111', cardexp: '1019', amount: '5.25', cvv: '999')
puts r['textresponse']

puts "Expect: Payment type mismatch (missing params)"
api = SparrowOne::ACHAPI.new(TEST_KEYS[:credit_card], Faraday.new('http://localhost:8080'))
r = api.sale(cardnum: '4111111111111111', cardexp: '1019', amount: '5.25', cvv: '999')
puts r['textresponse']
