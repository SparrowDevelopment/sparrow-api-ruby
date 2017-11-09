describe SparrowOne::Response do
  it "exists" do
    expect(defined?(SparrowOne::Response)).to eq("constant")
  end

  context "when parsing a response" do
    context "and CGI escaping" do
      let(:cgi_string) { "foobar=bazquux&oddstring=some%26value%3Dinjected&able=baker" }
      it "does not parse escaped characters" do
        expect(SparrowOne::Response.new(cgi_string)['value']).to be_nil
      end

      it "does unescape characters in values" do
        expect(SparrowOne::Response.new(cgi_string)['oddstring']).to eq('some&value=injected')
      end
    end
  end
  context "#ok?" do
    it "responds true when status = 200" do
      expect(SparrowOne::Response.new("status=200").ok?).to be true
    end

    it "responds true for any 2xx status code" do
      expect(SparrowOne::Response.new("status=210").ok?).to be true
    end

    it "responds false for a non-2xx status code" do
      expect(SparrowOne::Response.new("status=400").ok?).to be false
    end

    it "responds false when status does not look like an HTTP response code" do
      expect(SparrowOne::Response.new("status=aloha").ok?).to be false
    end
  end

end
