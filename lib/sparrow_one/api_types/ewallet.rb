module SparrowOne
  class EwalletAPI < SparrowOne::API
    def credit(params)
      with_error_handling do
        validate(params, requires: [:ewalletaccount, :amount])
        post("credit", params)
      end
    end

    def sale(params)
      with_error_handling do
        raise SparrowOne::RequestError.new("The Services eWallet API can be used to process credit operations only.")
      end
    end
  end
end
