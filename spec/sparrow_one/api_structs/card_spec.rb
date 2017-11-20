describe SparrowOne::Card do
  it "exists" do
    expect(defined?(SparrowOne::Card)).to eq("constant")
  end

  it "validates required fields on initialization" do
    expect { SparrowOne::Card.new(cardnum: '4111111111111111') }.to raise_exception(SparrowOne::RequestError)
  end

  it "coerces dates into MMYY format for cardexp" do
    expect(SparrowOne::Card.new(cardnum: '4111111111111111', cvv: '999', cardexp: DateTime.now).sparrow_params[:cardexp]).to match(/\d\d\d\d/)
  end

  it "coerces strings into MMYY format for cardexp" do
    expect(SparrowOne::Card.new(cardnum: '4111111111111111', cvv: '999', cardexp: "January 18, 2023").sparrow_params[:cardexp]).to match(/\d\d\d\d/)
  end

end
