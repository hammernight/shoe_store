class EmailNotification

  attr_accessor :email_address, :validation_status

  def initialize(address)
    self.email_address = address
    validate_email
  end

  def validation_message
    if self.validation_status == :valid
      "#{@email_address} Valid email address"
    elsif self.validation_status == :missing_domain
      "Invalid email missing domain. Ex. name@example.com"
    else
      "Invalid email format. Ex. name@example.com"
    end
  end

  def validate_email
    return self.validation_status = :missing_domain if missing_domain?
    return self.validation_status = :invalid_email if illegal_characters?
    return self.validation_status = :invalid_email unless email_format?
    self.validation_status = :valid
  end

  def valid?
    self.validation_status == :valid
  end

  def email_format?
    self.email_address =~ /(\w)+\@(\w|-)+\.(\w{3}|\w{2}\.\w{2})/
  end

  def missing_domain?
    self.email_address.slice(/(\w|\.|-)+\@/) == email_address
  end

  def illegal_characters?
    self.email_address.slice(/[^@\w\.-]/)
  end
end