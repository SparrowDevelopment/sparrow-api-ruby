module SparrowOne
  class APIStruct

    def initialize(params)
      @params = params
      validate
    end

    def sparrow_params
      @params
    end

    def validator
      SparrowOne::Validator.new(@params)
    end

    def validate
      validator = SparrowOne::Validator.new(@params)
      validator.requires(requires)
      validator.validate
    end

    def method_missing(meth, *args, &blk)
      if fields.include?(meth)
        @params[meth]
      elsif fields.include?((meth.to_s.gsub(/=\z/, '').to_sym))
        @params[(meth.to_s.gsub(/=\z/, '')).to_sym] = args.first
      else
        super
      end
    end

    private
    attr_accessor :params

  end
end
