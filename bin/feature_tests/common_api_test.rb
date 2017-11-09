class CommonAPITest
  def self.run(options)
    self.new(options).run
  end

  def initialize(options)
    @verbose = options[:verbose]
  end

  def log(response, matcher = /success/i, long_notice = "" )
    if @verbose
      puts response.to_json
    end
    if response['textresponse'].match matcher
      if long_notice == ""
        puts "  OK"
      else
        puts "  OK (" + long_notice + ")"
      end
    else
      puts "--Fault: Expected #{response['textresponse']} to match #{matcher.to_s}"
    end
  end

  def api
    @api ||= SparrowOne::CardAPI.new(TEST_KEYS[:credit_card])
  end

  def run
    # Datavault
    # addcustomer
    #   Card
    #   ACH
    # updatecustomer
    # decrypt
    # updatecustomer-addpaytype
    # updatecustomer-deletepaytype
    # getcustomer
    #
    # Payment Plans
    # create plan
    # update plan
    # build sequence
    # plan notification settings
    # addsequence
    # updatesequence
    # deletesequence
    # deleteplan
    # assignplan
    # updateassignment
    # cancelassignment
    # createinvoice
    # updateinvoice
    # getinvoice
    # cancelinvoice
    # cancelinvoicebycustomer
    # payinvoice
    #   Card
    #   ACH
    #

  end
end
