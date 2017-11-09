module SparrowOne
  class EwalletAPI < SparrowOne::API
    def credit(params)
      with_error_handling do
        validate(params, requires: [:ewalletaccount, :amount])
        post("credit", params)
      end
    end
  end
end
