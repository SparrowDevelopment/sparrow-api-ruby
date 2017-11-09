describe SparrowOne::CardAPI do
  it "exists" do
    expect(defined?(SparrowOne::CardAPI)).to eq("constant")
  end

  let(:mock_response) { double(body: 'status=200&textresponse=SUCCESS')}
  let(:mock_faraday) { double(post: mock_response  )}
  let(:api) { SparrowOne::CardAPI.new("ABCDEFGHIJ1234567890abcde", mock_faraday) }

  context "#sale" do
    it "requires a cardnum" do
      response = api.sale(cardexp: '0920', amount: '12.34')
      expect(response.status).to eq('400')
      expect(response.textresponse).to match(/missing parameters\: cardnum/)
    end

    it "requires a cardexp" do
      response = api.sale(cardnum: '1234567812345678', amount: '12.34')
      expect(response.status).to eq('400')
      expect(response.textresponse).to match(/missing parameters\: cardexp/)
    end

    it "validates format of cardexp" do
      response = api.sale(cardnum: '1234567812345678', cardexp: '09/20', amount: '12.34')
      expect(response.status).to eq('400')
      expect(response.textresponse).to match(/cardexp.+MMYY/)
    end

    it "sends a valid request as a post" do
      response = api.sale(cardnum: '1234567812345678', cardexp: '0920', amount: '12.34')
      expect(response.status).to eq('200')
      expect(response.textresponse).to match(/SUCCESS/)
    end
  end

  context "#passenger_sale" do
    let(:valid_requirements) { { passengername: "Joe Schmoe", airportcode1: 'PDX', airlinecodenumber: 'Ab1',
                                 ticketnumber: '1234567890', flightdatecoupon1: "12/14/2019", flightdeparturetimecoupon1: "21:44",
                                 approvalcode: 'AB12cd', authcharindicator: 'W', validationcode: '1aB2', authresponsecode: '9Z',
                                 cardnum: '1234567890123456', amount: '1.23', cardexp: '0115' } }

    let(:valid_options)      { { stopovercode1: 'O', carriercoupon1: 'B1', classofservicecoupon1: 'C2', addressverificationcode: 'A',
                                 transactionid: 'ABCDE1234567890', referencenumber: 'AB1234567890' } }

    context "validates required fields" do
      it "passes when all values are present and OK" do
        response = api.passenger_sale(valid_requirements)
        expect(response.status).to eq('200')
      end

      it "raises a RequestError when one field is missing" do
        test_requirements = valid_requirements.dup
        test_requirements.delete(:passengername)
        response = api.passenger_sale(test_requirements)
        expect(response.status).to eq('400')
      end

      it "raises a RequestError when one field is malformed" do
        test_requirements = valid_requirements.dup
        test_requirements[:passengername] = 'Joe%Schmoe'
        response = api.passenger_sale(test_requirements)
        expect(response.status).to eq('400')
      end
    end

    context "validates optional fields" do
      it "passes when all values are OK" do
        response = api.passenger_sale(valid_requirements.merge(valid_options))
        expect(response.status).to eq('200')
      end
    end

    context "validates numbered fields" do
      it "rejects a malformed airportcode5" do
        test_requirements = valid_requirements.dup
        test_requirements[:airportcode5] = 'McCarran'
        response = api.passenger_sale(test_requirements)
        expect(response.status).to eq('400')
      end

      it "accepts a well-formed airportcode5" do
        test_requirements = valid_requirements.dup
        test_requirements[:airportcode5] = 'PDX'
        response = api.passenger_sale(test_requirements)
        expect(response.status).to eq('200')
      end

      it "rejects a malformed stopovercode3" do
        test_requirements = valid_requirements.dup
        test_requirements[:stopovercode3] = 'J'
        response = api.passenger_sale(test_requirements)
        expect(response.status).to eq('400')
      end

      it "accepts a well-formed stopovercode3" do
        test_requirements = valid_requirements.dup
        test_requirements[:stopovercode3] = 'O'
        response = api.passenger_sale(test_requirements)
        expect(response.status).to eq('200')
      end
    end

    context "validates custom field definitions" do
      context "passengername" do
        it "accepts spaces" do
          test_requirements = valid_requirements.dup
          test_requirements[:passengername] = 'Joe Schmoe'
          response = api.passenger_sale(test_requirements)
          expect(response.status).to eq('200')
        end

        it "accepts mixed case and digits" do
          test_requirements = valid_requirements.dup
          test_requirements[:passengername] = 'AbleBaker1 Charlie'
          response = api.passenger_sale(test_requirements)
          expect(response.status).to eq('200')
        end

        it "rejects special characters" do
          test_requirements = valid_requirements.dup
          test_requirements[:passengername] = 'Able%Baker'
          response = api.passenger_sale(test_requirements)
          expect(response.status).to eq('400')
        end

        it "rejects 21 characters" do
          test_requirements = valid_requirements.dup
          test_requirements[:passengername] = 'ABCDEFGHIJKLMNOPQRSTU'
          response = api.passenger_sale(test_requirements)
          expect(response.status).to eq('400')
        end
      end

      context "authresponsecode" do
        it "accepts two characters" do
          test_requirements = valid_requirements.dup
          test_requirements[:authresponsecode] = 'WX'
          response = api.passenger_sale(test_requirements)
          expect(response.status).to eq('200')
        end

        it "accepts two spaces" do
          test_requirements = valid_requirements.dup
          test_requirements[:authresponsecode] = '  '
          response = api.passenger_sale(test_requirements)
          expect(response.status).to eq('200')
        end

        it "rejects three spaces" do
          test_requirements = valid_requirements.dup
          test_requirements[:authresponsecode] = '   '
          response = api.passenger_sale(test_requirements)
          expect(response.status).to eq('400')
        end

        it "rejects one letter and one space" do
          test_requirements = valid_requirements.dup
          test_requirements[:authresponsecode] = 'B '
          response = api.passenger_sale(test_requirements)
          expect(response.status).to eq('400')
        end
      end
    end


  end

end
