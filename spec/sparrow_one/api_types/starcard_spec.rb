describe SparrowOne::StarcardAPI do
  it "exists" do
    expect(defined?(SparrowOne::StarcardAPI)).to eq("constant")
  end

  let(:mock_response) { double(body: 'status=200&textresponse=SUCCESS')}
  let(:mock_faraday) { double(post: mock_response  )}
  let(:api) { SparrowOne::StarcardAPI.new("ABCDEFGHIJ1234567890abcde", mock_faraday) }

  context "#sale" do
    it "requires a CID" do
      response = api.sale(cardnum: '1234567812345678', cardexp: '0920', amount: '12.34')
      expect(response.status).to eq('400')
      expect(response.textresponse).to match(/missing parameters\: CID/)
    end

    it "validates the format of CID" do
      response = api.sale(CID: '1234X678901', cardnum: '1234567812345678', cardexp: '0920', amount: '12.34')
      expect(response.status).to eq('400')
      expect(response.textresponse).to match(/CID.+numeric/)
    end

    it "sends a valid request as a post" do
      response = api.sale(CID: '12345678901', cardnum: '1234567812345678', cardexp: '0920', amount: '12.34')
      expect(response.status).to eq('200')
      expect(response.textresponse).to match(/SUCCESS/)
    end
  end
end
