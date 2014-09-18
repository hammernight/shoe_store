require "spec_helper"

describe "Email submission" do
  context "Valid email address" do

    let(:subject) { EmailNotification.new("test.user-bob@manheim.com")}

    it 'should be a valid email address' do
      subject.valid?.should be_true
    end

    it 'should be a valid email format' do
      subject.email_format?.should be_true
    end

    it 'should have a domain' do
      subject.missing_domain?.should be_false
    end

    it 'should not cannot contain special characters other than @ . - _' do
      subject = EmailNotification.new("invalid@email.com")
      subject.illegal_characters?.should be_false
    end

    it 'email validation should be :valid' do
      subject.validate_email.should be :valid
    end
  end

  context "Invalid email address" do

    it 'email address must be in a valid email format' do
      subject = EmailNotification.new("not.an.email")
      subject.valid?.should be_false
    end

    it 'email address cannot contain special characters other than @ . - _' do
      subject = EmailNotification.new("invalid$@email.com")
      subject.illegal_characters?.should be_true
    end

    it 'invalid email format should be :invalid_email' do
      subject = EmailNotification.new("not.an.email")
      subject.validate_email.should be :invalid_email
    end

    it 'email missing domain should be :missing_domain' do
      subject = EmailNotification.new("test@")
      subject.validate_email.should be :missing_domain
    end
  end

end