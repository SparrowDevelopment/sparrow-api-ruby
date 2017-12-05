module SparrowOne
  class StarCard < Card

    def requires
      [:cardnum, :cardexp, :cvv, :CID]
    end

  end


end
