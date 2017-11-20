class StarcardAPITest < SparrowOne::TestRunner
  def api
    @api ||= SparrowOne::StarcardAPI.new(TEST_KEYS[:star_card])
  end

  def run
    # Faulty examples
    # No valid CID to test with - confirmed by RL
    sale_one = skip("No valid test CID", :sale, { cardnum: '6019440000011111', cardexp: '1019', amount: '5.25', cvv: '999', CID: '52347800001' })
    sale_two = skip("No valid test CID", :sale, { state: "NV", cardnum: '6019440000011111', cardexp: '1019', amount: '5.25', cvv: '999', CID: '52347800001' })
  end
end
