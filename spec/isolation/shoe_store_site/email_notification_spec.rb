require "spec_helper"

describe "Email submission" do
  context "Valid email address" do

    let(:subject) { EmailNotification.new('test.user-bob@manheim.com')}

    it 'should be a valid email address' do
      expect(subject.valid?).to be_truthy
    end

    it 'should be a valid email format' do
      expect(subject.email_format?).to be_truthy
    end

    it 'should have a domain' do
      expect(subject.missing_domain?).to be_falsey
    end

    it 'should not cannot contain special characters other than @ . - _' do
      subject = EmailNotification.new('invalid@email.com')
      expect(subject.illegal_characters?).to be_falsey
    end

    it 'email validation should be :valid' do
      subject.validate_email.should be :valid
    end
  end

  context 'Invalid email address' do

    it 'email address must be in a valid email format' do
      subject = EmailNotification.new('not.an.email')
      expect(subject.valid?).to be_falsey
    end

    it 'email address cannot contain special characters other than @ . - _' do
      subject = EmailNotification.new('invalid$@email.com')
      expect(subject.illegal_characters?).to be_truthy
    end

    it 'invalid email format should be :invalid_email' do
      subject = EmailNotification.new('not.an.email')
      expect(subject.validate_email).to eql :invalid_email
    end

    it 'email missing domain should be :missing_domain' do
      subject = EmailNotification.new('test@')
      expect(subject.validate_email).to eql :missing_domain
    end
  end

end