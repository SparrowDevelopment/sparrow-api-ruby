module SparrowOne
  class Validator

    attr_accessor :params

    def self.validate(params)
      self.new(params).validate
    end

    def initialize(params)
      @params = params
    end

    def validate
      validate_numbered_fields
      validate_card_fields
      validate_address_fields
      validate_ach_fields
      validate_sale_fields
      validate_data_fields
      validate_passenger_fields
    end

    def validate_sale_fields
      is_currency :amount, :ship_amount, :tax, :opt_amount_value, :opt_amount_value_1
      is_boolean :sendtransreceipttobillemail, :sendtransreceipttoshipemail
      is_email :sendtransreceipttoemails, :email
    end

    def validate_card_fields
      is_mmyy :cardexp
      is_numeric :CID
      is_length 11, :CID
      is_ip :cardipaddress
    end

    def validate_address_fields
      is_alpha :state, :country
      is_length 2, :state, :country
      is_alpha :shipstate, :shipcountry
      is_length 2, :shipstate, :shipcountry
      is_email :shipemail
    end

    def validate_ach_fields
      matches(:achaccounttype, /\A(checking)|(savings)\z/i, "achaccounttype must be checking or savings")
      matches(:achaccountsubtype, /\A(business)|(personal)\z/i, "achaccountsubtype must be business or personal")

      is_date :birthdate
      is_max_length 50, :courtesycardid
      is_alphanumeric :courtesycardid
    end

    def validate_passenger_fields
      matches(:authcharindicator, /\A[AEFICKMNPRSTUVW\s]\z/, "invalid authcharindicator; see documentation for acceptable values")
      matches(:authresponsecode, /\A(([a-zA-Z0-9]{2})|(\s\s))\z/, "authresponsecode must be two alphanumeric characters or two spaces")
      matches(:passengername, /\A[a-zA-Z0-9\s]{1,20}\z/, "passengername must be a maximum of 20 alphanumeric/space characters")

      is_date :authdate
      is_alphanumeric :validationcode, :addressverificationcode, :approvalcode, :transactionid, :referencenumber
      is_length 1, :addressverificationcode
      is_length 4, :validationcode
      is_length 6, :approvalcode
      is_length 10, :ticketnumber
      is_length 12, :referencenumber
      is_length 15, :transactionid
      is_numeric :ticketnumber
      is_date :flightdatecoupon1
      is_time :flightdeparturetimecoupon1
    end

    def validate_data_fields
      is_uppercase :token
      is_alphanumeric :groupid, :token
    end

    def validate_numbered_fields
      (1..5).each do |i|
        is_alphanumeric("classofservicecoupon#{i}".to_sym, "airlinecodenumber#{i}".to_sym, "carriercoupon#{i}".to_sym, "airportcode#{i}".to_sym)
        is_length(2, "carriercoupon#{i}".to_sym)
        is_length(3, "airlinecodenumber#{i}".to_sym, "airportcode#{i}".to_sym)
        is_max_length(2, "classofservicecoupon#{i}".to_sym)
        matches("stopovercode#{i}".to_sym, /\A[OX\s]\z/, "stopovercode must be O, X, or a space")
      end
    end

    def requires(required_params)
      missing_params = required_params.reject { |required_param| @params.keys.map(&:to_sym).include?(required_param) }
      if missing_params.any?
        raise SparrowOne::RequestError.new("missing parameters: #{missing_params.map(&:to_s).join(', ')}")
      end
    end

    # Anything that passes the "requires" validator is permitted to be blank,
    # so we will allow anything that matches the regex *or* is blank.
    def matches(key, regex, plaintext)
      # puts "Matching #{key} against #{regex}"
      # puts "Value: #{params[key]}"
      unless params[key] =~ regex || params[key].to_s.size == 0
        raise SparrowOne::RequestError.new(plaintext)
      end
    end

    def is_max_length(limit, *keys)
      keys.each do |key|
        matches(key, /\A.{1,#{limit}}\z/, "#{key.to_s} must be shorter than #{limit} characters")
      end
    end

    def is_length(length, *keys)
      keys.each do |key|
        matches(key, /\A.{#{length}}\z/, "#{key.to_s} must be exactly #{length} characters")
      end
    end

    def is_currency(*keys)
      keys.each do |key|
        matches(key, FORMATS[:currency], "#{key.to_s} must be in currency format (d.dd)")
      end
    end

    def is_numeric(*keys)
      keys.each do |key|
        matches(key, FORMATS[:numeric], "#{key.to_s} must be numeric")
      end
    end

    def is_mmyy(*keys)
      keys.each do |key|
        matches(key, FORMATS[:mmyy], "#{key.to_s} must be in the format 'MMYY' (e.g., 0711 is July 2011)")
      end
    end

    FORMATS = {mmyy: /\A\d{4}\z/,
               numeric: /\A\d*\z/,
               currency: /\A\d+\.\d+\z/,
               email: /\A(([^\n@,]+@[^\n@,]+){1}[^\n,@]+$)|([^\n@,]+@.+,.+@.+$)/,
               ip: /\A(\d{1,3}\.){3}\d{1,3}\z/,
               alpha: /\A[a-zA-Z]*\z/,
               uppercase: /\A[^a-z]*\z/,
               alphanumeric: /\A[A-Z0-9]+\z/i,
               boolean: /\A(true|false)\z/i,
               date: /\A((0[1-9])|(1[012]))\/(([0][1-9])|([1-2][0-9])|(3[0-1]))\/\d{4}\z/,
               time: /\A(([0-1][0-9])|(2[0-3])):([0-5][0-9])\z/,
             }

    # Deliberately permissive - the absence of an "@" suggests the user is
    # attempting to provide something other than an email address, which is
    # worth a client-side validation error. Otherwise, email addresses are too
    # laden with special cases to filter aggressively at this level.
    # We do validate that multiple email addresses are comma-separated.
    # The regex is two statements, joined by the `|` operator. The first
    # statement permits any string with exactly one @, no newlines, and no commas.
    # The second statement permits any string that has two or more @ if there is at
    # least one comma between them.
    def is_email(*keys)
      keys.each do |key|
        matches(key, FORMATS[:email], "#{key} must be a comma-separated list of email addresses")
      end
    end

    def is_ip(*keys)
      keys.each do |key|
        matches(key, FORMATS[:ip], "#{key} must be in the form ddd.ddd.ddd.ddd")
      end
    end

    def is_alpha(*keys)
      keys.each do |key|
        matches(key, FORMATS[:alpha], "#{key} must be letters only")
      end
    end

    def is_uppercase(*keys)
      keys.each do |key|
        matches(key, FORMATS[:uppercase], "#{key} must have upper-cased letters")
      end
    end

    def is_alphanumeric(*keys)
      keys.each do |key|
        matches(key, FORMATS[:alphanumeric], "#{key} must be alphanumeric")
      end
    end

    def is_boolean(*keys)
      keys.each do |key|
        matches(key, FORMATS[:boolean], "#{key} must be a boolean value ('true' or 'false')")
      end
    end

    # Deliberately restrictive. MMDDYYYY is a common format in the US, but is rare
    # internationally. We can't do anything about ambiguous dates like 08/10/12, but
    # we can help head off the most common errors.
    # Accepts 01-12 in the first block, 01-31 in the second, and any 4-digit year.

    def is_date(*keys)
      keys.each do |key|
        matches(key, FORMATS[:date], "#{key} must be a date in the form MM/DD/YYYY")
      end
    end

    def coerce_date(*keys)
      keys.each do |key|
        next if params[key] =~ FORMATS[:date] || params[key].to_s.size == 0
        if params[key].is_a? Date
          params[key] = params[key].strftime('%m/%d/%Y')
        else
          params[key] = Date.parse(params[key]).strftime('%m/%d/%Y')
        end
      end
    end

    def is_time(*keys)
      keys.each do |key|
        matches(key, FORMATS[:time], "#{key} must be a time in the form HH:MM")
      end
    end

    def coerce_mmyy(*keys)
      keys.each do |key|
        next if params[key] =~ FORMATS[:mmyy] || params[key].to_s.size == 0
        if params[key].is_a? Date
          params[key] = params[key].strftime("%m%y")
        else
          params[key] = Date.parse(params[key]).strftime("%m%y")
        end
      end
    end

    def coerce_time(*keys)
      keys.each do |key|
        if params[key].is_a? Time
          params[key] = params[key].strftime('%H:%M')
        else
          params[key] = Time.parse(params[key]).strftime('%H:%M')
        end
      end
    end
  end
end
