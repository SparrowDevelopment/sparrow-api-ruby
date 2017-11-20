require_relative '../spec_helper'

describe SparrowOne::Validator do
  let(:test_validator) { SparrowOne::Validator }
  it "exists" do
    expect(defined?(SparrowOne::Validator)).to eq("constant")
  end

  context "while validating presence" do
    it "raises an error when one or more required fields are missing" do
      validator = test_validator.new({one: '1'})
      expect { validator.requires([:one, :two]) }.to raise_exception(SparrowOne::RequestError)
    end

    it "does not raise an error when unrecognized fields are present" do
      validator = test_validator.new({one: '1', two: '2'})
      expect { validator.requires([:one, :two]) }.to_not raise_exception
    end
  end

  context "while validating format of" do
    context "email" do
      it "accepts an email address" do
        expect { test_validator.validate(email: 'bob@example.com') }.to_not raise_exception
      end

      it "accepts strings that are plausibly email addresses" do
        expect { test_validator.validate(email: '"did you"+know@this-is_legit.com.really') }.to_not raise_exception
      end

      it "accepts multiple email addresses when comma-separated" do
        expect { test_validator.validate(email: 'able@baker.com, charlie@dog.com') }.to_not raise_exception
      end

      it "rejects multiple email addresses when not comma-separated" do
        expect { test_validator.validate(email: 'able@baker.com; charlie@dog.com') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects a comma when there is only one email address" do
        expect { test_validator.validate(email: 'able@baker,.com') }.to raise_exception(SparrowOne::RequestError)
      end
    end

    context "mmyy" do
      it "accepts empty strings" do
        expect { test_validator.validate(cardexp: '') }.to_not raise_exception
      end

      it "accepts exactly 4 digits" do
        expect { test_validator.validate(cardexp: '1234') }.to_not raise_exception
      end

      it "rejects 5 digits" do
        expect { test_validator.validate(cardexp: '12345') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects 3 digits" do
        expect { test_validator.validate(cardexp: '123') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects non-digit characters" do
        expect { test_validator.validate(cardexp: '3/12') }.to raise_exception(SparrowOne::RequestError)
      end
    end

    context "date" do
      it "accepts empty strings" do
        expect { test_validator.validate(authdate: '') }.to_not raise_exception
      end

      it "accepts exactly 10 characters" do
        expect { test_validator.validate(authdate: '09/13/1980') }.to_not raise_exception
      end

      it "accepts ambiguous dates" do
        expect { test_validator.validate(authdate: '12/12/1212') }.to_not raise_exception
      end

      it "rejects impossible months" do
        expect { test_validator.validate(authdate: '13/09/1980') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects impossible days" do
        expect { test_validator.validate(authdate: '09/80/1313') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects missing digits" do
        expect { test_validator.validate(authdate: '9/13/1980') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects extra digits" do
        expect { test_validator.validate(authdate: '009/13/1980') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects improperly formatted characters" do
        expect { test_validator.validate(authdate: '09-13-1980') }.to raise_exception(SparrowOne::RequestError)
      end
    end

    context "CID" do
      it "accepts empty strings" do
        expect { test_validator.validate(CID: '') }.to_not raise_exception
      end

      it "accepts exactly 11 digits" do
        expect { test_validator.validate(CID: '12345678901') }.to_not raise_exception
      end

      it "rejects letters" do
        expect { test_validator.validate(CID: '1234X678901') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects spaces" do
        expect { test_validator.validate(CID: '1234 678901') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects too few digits" do
        expect { test_validator.validate(CID: '1234567890') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects too many digits" do
        expect { test_validator.validate(CID: '123456789012') }.to raise_exception(SparrowOne::RequestError)
      end
    end

    context "token" do
      it "accepts empty strings" do
        expect { test_validator.validate(token: '') }.to_not raise_exception
      end

      it "accepts mixed upper-case letters and digits" do
        expect { test_validator.validate(token: 'ABCD1234GHIJ5678I7') }.to_not raise_exception
      end

      it "rejects mixed case" do
        expect { test_validator.validate(token: 'ABCDEfghi1234') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects spaces" do
        expect { test_validator.validate(token: 'ABCD whoops') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects special characters" do
        expect { test_validator.validate(token: 'ABCDef-ghi') }.to raise_exception(SparrowOne::RequestError)
      end
    end

    context "currency" do
      it "it accepts a decimal value" do
        expect { test_validator.validate(amount: '1.23') }.to_not raise_exception
      end

      it "requires a decimal point" do
        expect { test_validator.validate(amount: '123') }.to raise_exception(SparrowOne::RequestError)
      end

      it "requires a leading 0 for values less than 1" do
        expect { test_validator.validate(amount: '.25') }.to raise_exception(SparrowOne::RequestError)
      end

      it "accepts arbitrarily large values" do
        expect { test_validator.validate(amount: '1234467887455.25') }.to_not raise_exception
      end

      it "requires at least one digit after the decimal point" do
        expect { test_validator.validate(amount: '1.') }.to raise_exception(SparrowOne::RequestError)
      end

      it "accepts more than two digits after the decimal point" do
        expect { test_validator.validate(amount: '1.2345') }.to_not raise_exception
      end

      it "rejects letters" do
        expect { test_validator.validate(amount: 'A.25') }.to raise_exception(SparrowOne::RequestError)
      end
    end

    context "ip" do
      it "accepts short octets" do
        expect { test_validator.validate(cardipaddress: '0.0.0.0') }.to_not raise_exception
      end

      it "accepts long octets" do
        expect { test_validator.validate(cardipaddress: '123.123.123.123') }.to_not raise_exception
      end

      it "rejects octets with too many digits" do
        expect { test_validator.validate(cardipaddress: '192.168.0.1000') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects fewer than 4 octets" do
        expect { test_validator.validate(cardipaddress: '192.168.0') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects more than 4 octets" do
        expect { test_validator.validate(cardipaddress: '192.168.0.1.5') }.to raise_exception(SparrowOne::RequestError)
      end
    end

    context "alphanumeric" do
      it "accepts empty strings" do
        expect { test_validator.validate(courtesycardid: '') }.to_not raise_exception
      end

      it "accepts mixed case" do
        expect { test_validator.validate(courtesycardid: 'ABCDEfghi1234') }.to_not raise_exception
      end

      it "rejects spaces" do
        expect { test_validator.validate(courtesycardid: 'ABCD whoops') }.to raise_exception(SparrowOne::RequestError)
      end

      it "rejects special characters" do
        expect { test_validator.validate(courtesycardid: 'ABCDef-ghi') }.to raise_exception(SparrowOne::RequestError)
      end
    end

    context "boolean" do
      it "accepts the string literal 'true'" do
        expect { test_validator.validate(sendtransreceipttobillemail: 'true') }.to_not raise_exception
      end

      it "accepts the string literal 'false'" do
        expect { test_validator.validate(sendtransreceipttobillemail: 'false') }.to_not raise_exception
      end

      it "is not case sensitive" do
        expect { test_validator.validate(sendtransreceipttobillemail: 'TRUE') }.to_not raise_exception
      end

      it "rejects values that contain more than 'true' or 'false'" do
        expect { test_validator.validate(sendtransreceipttobillemail: 'truee') }.to raise_exception(SparrowOne::RequestError)
      end
    end
  end
end
