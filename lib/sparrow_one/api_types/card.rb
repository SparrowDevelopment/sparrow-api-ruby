module SparrowOne
  class CardAPI < SparrowOne::API

    def sale(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:cardnum, :cardexp, :amount])
        post("sale", params)
      end
    end

    def credit(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:cardnum, :cardexp, :amount])
        post("credit", params)
      end
    end

    def auth(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:cardnum, :amount, :cardexp])
        post("auth", params)
      end
    end
    alias_method :authorize, :auth

    def capture(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:transid, :amount])
        post("capture", params)
      end
    end

    def offline(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:cardnum, :cardexp, :amount, :authcode, :authdate])
        post("offline", params)
      end
    end
    alias_method :offline_auth, :offline

    def passenger_sale(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:cardnum, :amount, :cardexp, :passengername,
                                    :airportcode1, :airlinecodenumber, :ticketnumber,
                                    :flightdatecoupon1, :flightdeparturetimecoupon1,
                                    :approvalcode, :authcharindicator, :validationcode,
                                    :authresponsecode])
        post("passengersale", params)
      end
    end

    def balance(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:cardnum])
        post("balanceinquire", params)
      end
    end

    def verify(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:cardnum, :cardexp])
        post("auth", params.merge(amount: '0.00'))
      end
    end

  end
  class FiservAPI < CardAPI ; end
end
