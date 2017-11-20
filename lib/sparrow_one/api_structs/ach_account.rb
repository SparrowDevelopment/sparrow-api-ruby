module SparrowOne
  class ACHAccount < APIStruct

    def requires
      [:bankname, :routing, :account, :achaccounttype, :achaccountsubtype]
    end

    def validate
      validator.coerce_date(:birthdate)
      super
    end

  end
end
