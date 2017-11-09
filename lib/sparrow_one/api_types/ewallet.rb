module SparrowOne
  class EwalletAPI < SparrowOne::API
    def credit(params)
      with_error_handling do
        validate(params, requires: [:ewalletaccount, :amount])
        post("credit", params)
      end
    end

    def sale(params)
      raise SparrowOne::RequestError.new("The Services eWallet API can be used to process credit operations only.")
    end
  end
end
