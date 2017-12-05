class CashAPITest < SparrowOne::TestRunner

  def api
    @api ||= SparrowOne::CashAPI.new(TEST_KEYS[:cash])
  end

  def run
  end
end
