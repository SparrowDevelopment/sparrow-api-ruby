module SparrowOne
  class StarcardAPI < SparrowOne::API

    def sale(params)
      with_error_handling do
        validate(params, requires: [:cardnum, :cardexp, :amount, :CID])
        post("sale", params)
      end
    end

  end
end
