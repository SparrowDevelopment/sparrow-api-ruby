module SparrowOne
  class StarcardAPI < SparrowOne::API

    def sale(*params)
      with_error_handling do
        params = validate(flatten(params), requires: [:cardnum, :cardexp, :amount, :CID])
        post("sale", params)
      end
    end

  end
end
