describe SparrowOne::ACHAccount do
  it "exists" do
    expect(defined?(SparrowOne::ACHAccount)).to eq("constant")
  end

  it "validates required fields on initialization" do
    expect { SparrowOne::ACHAccount.new(routing: '4111111111111111') }.to raise_exception(SparrowOne::RequestError)
  end

  it "coerces dates into MM/DD/YYYY format for birthdate" do
    expect(SparrowOne::ACHAccount.new({bankname: "Test bank", routing: '123456789', account: '1001001111', achaccounttype: 'checking', achaccountsubtype: 'personal', birthdate: DateTime.now}).sparrow_params[:birthdate]).to match(/\d\d\/\d\d\/\d\d\d\d/)
  end

  it "coerces strings into MM/DD/YYYY format for birthdate" do
    expect(SparrowOne::ACHAccount.new({bankname: "Test bank", routing: '123456789', account: '1001001111', achaccounttype: 'checking', achaccountsubtype: 'personal', birthdate: "January 29, 2001"}).sparrow_params[:birthdate]).to match(/\d\d\/\d\d\/\d\d\d\d/)
  end

end
