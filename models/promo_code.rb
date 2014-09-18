class PromoCode

  attr_accessor :code, :validation_status

  def initialize(promo_code)
    self.code = promo_code
    validate_promo_code
  end

  def validation_message
    if self.validation_status == :valid
      "Success 15% off!"
    elsif self.validation_status == :not_valid_for_today
      "Code not valid for today"
    else
      "Invalid code format"
    end
  end

  def valid?
    self.validation_status == :valid
  end

  def validate_promo_code
    return self.validation_status = :invalid_format unless self.is_numeric?
    return self.validation_status = :invalid_format unless @code.length == 10
    return self.validation_status = :not_valid_for_today unless self.total_of_first_five_is_twenty?
    return self.validation_status = :not_valid_for_today unless self.middle_three_is_commercial_week?
    return self.validation_status = :not_valid_for_today unless self.last_two_is_today?
    self.validation_status = :valid
  end

  def is_numeric?
    @code.slice(/\d+/) == @code
  end

  def total_of_first_five_is_twenty?
    @code[0..4].to_s.split("").inject(0) { |sum, n| sum + n.to_i } == 20
  end

  def middle_three_is_commercial_week?
    @code[5..7].to_i == DateTime.now.cweek
  end

  def last_two_is_today?
    @code[8..9].to_i == DateTime.now.day
  end


end