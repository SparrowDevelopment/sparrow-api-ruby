module SparrowOne
  class Card < APIStruct

    def requires
      [:cardnum, :cardexp, :cvv]
    end

    def validate
      validator.coerce_mmyy(:cardexp)
      super
    end

  end


end
