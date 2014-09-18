require "spec_helper"

describe "Validate Promo Codes" do
  context "valid promotional codes" do

    first_five_digits = "44444"
    middle_three_digits = DateTime.now.cweek.to_s.rjust(3,'0')
    last_two_digits = DateTime.now.day.to_s.rjust(2, '0')
    code = first_five_digits + middle_three_digits + last_two_digits

    let(:subject) { PromoCode.new(code) }

    it "should not be nil" do
      subject.should_not be_nil
    end

    it "should be 10 digits" do
      subject.code.length.should == 10
    end

    it "should contain only numbers" do
      subject.is_numeric?.should be_true
    end

    it "total of first five digits should equal 20" do
      subject.total_of_first_five_is_twenty?.should be_true
    end

    it "middle 3 digits are current commercial week" do
      subject.middle_three_is_commercial_week?.should be_true
    end

    it "last 2 digits are current day of month" do
      subject.last_two_is_today?.should be_true
    end

    it "validation status should be :valid" do
      subject.validation_status.should be :valid
    end

  end

  context "invalid promoational codes" do

    invalid_first_five_digits = "11111"
    invalid_middle_three_digits = (DateTime.now.cweek + 1).to_s.rjust(3,'0')
    invalid_last_two_digits = (DateTime.now.day + 1).to_s.rjust(2, '0')
    invalid_code = invalid_first_five_digits + invalid_middle_three_digits + invalid_last_two_digits

    it "alpha-numeric codes are invalid" do
      subject = PromoCode.new("abc123")
      subject.validation_status.should be :invalid_format
    end

    it "is invalid if less than 10 digits" do
      subject = PromoCode.new("1234567")
      subject.validation_status.should be :invalid_format
    end

    it "is invalid if more than 10 digits" do
      subject = PromoCode.new("123456789012345")
      subject.validation_status.should be :invalid_format
    end

    it "is not valid for today if total of first 5 does not equal 20" do
      subject = PromoCode.new(invalid_code)
      subject.validation_status.should be :not_valid_for_today
    end

    it "is not valid for today if middle 3 are not current month" do
      subject = PromoCode.new(invalid_code)
      subject.validation_status.should be :not_valid_for_today
    end

    it "is not valid for today if last 2 are not current day of month" do
      subject = PromoCode.new(invalid_code)
      subject.validation_status.should be :not_valid_for_today
    end

  end

end