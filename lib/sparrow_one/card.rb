module SparrowOne
  class Card < Validator

    def initialize(params)
      @params = params
      validate
    end

    def fields
      [:cardnum, :cardexp, :cvv]
    end

    def validate
      assist_cardexp
      super
    end

    def assist_cardexp
      return if params[:cardexp] =~ FORMATS[:mmyy]
      if params[:cardexp].is_a?(String)
        params[:cardexp] = DateTime.parse(params[:cardexp]).strftime("%m%y")
      elsif params[:cardexp].is_a?(Date)
        params[:cardexp] = params[:cardexp].strftime("%m%y")
      else
        raise "Invalid class in field :cardexp, must be String or Date"
      end
    end
  end


end
