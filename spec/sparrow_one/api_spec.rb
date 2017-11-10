require_relative '../spec_helper'

describe SparrowOne::API do
  it "exists" do
    expect(defined?(SparrowOne::API)).to eq("constant")
  end

  let(:mock_response) { double(body: 'status=200&textresponse=SUCCESS')}
  let(:mock_faraday) { double(post: mock_response  )}
  let(:api) { SparrowOne::API.new("ABCDEFGHIJ1234567890abcde", mock_faraday) }

  context "shared API methods" do
    context "#refund" do
      it "requires an amount and a transid" do
        response = api.refund(amount: '12.34')
        expect(response.status).to eq('400')
        expect(response.textresponse).to match(/missing parameters\: transid/)
      end

      it "validates the format of amount" do
        response = api.refund(transid: '1234', amount: '.34')
        expect(response.status).to eq('400')
        expect(response.textresponse).to match(/amount.+currency format/)
      end

      it "delivers a valid request as a POST" do
        response = api.refund(transid: '1234', amount: '12.34')
        expect(response.status).to eq('200')
        expect(response.textresponse).to match(/SUCCESS/)
      end

    end
  end
  context "after making a network call" do
    it "returns a Response object" do
      expect(api.send(:post, 'foo', {bar: 'baz'})).to be_a SparrowOne::Response
    end
  end
end
