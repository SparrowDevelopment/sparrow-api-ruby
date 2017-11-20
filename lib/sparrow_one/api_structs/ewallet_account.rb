module SparrowOne
  class ECheckAccount < APIStruct

    def requires
      [:bankname, :routing, :account, :achaccounttype, :amount, :firstname,
                  :lastname, :address1, :city, :state, :zip, :country]
    end

  end
end
