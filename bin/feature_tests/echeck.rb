module SparrowOne
  class EcheckAPI < SparrowOne::API

    def sale(params)
      with_error_handling do
        params = validate(params, requires: [:bankname, :routing, :account, :achaccounttype,
                                    :amount, :firstname, :lastname, :address1, :city,
                                    :state, :zip, :country])
        post("sale", params)
      end
    end

    def refund(params)
      with_error_handling do
        params = validate(params, requires: [:bankname, :routing, :account, :achaccounttype,
                                    :amount, :firstname, :lastname, :address1, :city,
                                    :state, :zip, :country])
        post("refund", params)
      end
    end

    def credit(params)
      with_error_handling do
        params = validate(params, requires: [:bankname, :routing, :account, :achaccounttype,
                                    :amount, :firstname, :lastname, :address1, :city,
                                    :state, :zip, :country])
        post("refund", params)
      end
    end

  end

end
