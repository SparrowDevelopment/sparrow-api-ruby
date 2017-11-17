module SparrowOne
  class ACHAPI < SparrowOne::API

    def sale(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:bankname, :routing, :account, :achaccounttype,
                                    :achaccountsubtype, :amount, :firstname, :lastname])
        post("sale", params)
      end
    end

    def refund(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:bankname, :routing, :account, :achaccounttype,
                                    :achaccountsubtype, :amount])
        post("refund", params)
      end
    end

    def credit(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:bankname, :routing, :account, :achaccounttype,
                                    :achaccountsubtype, :amount])
        post("credit", params)
      end
    end

  end

end
